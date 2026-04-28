import { useState, useEffect, useCallback } from 'react';
import { supabase } from '../lib/supabase';

export const useRealtime = (table, userId, filters = {}) => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchData = useCallback(async () => {
    try {
      setLoading(true);
      let query = supabase.from(table).select('*');

      // Apply filters
      if (userId) {
        query = query.or(`profile_id.eq.${userId},from_user_id.eq.${userId},to_user_id.eq.${userId},user_id.eq.${userId}`);
      }

      Object.entries(filters).forEach(([key, value]) => {
        query = query.eq(key, value);
      });

      const { data: result, error } = await query;
      if (error) throw error;
      setData(result || []);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [table, userId, filters]);

  useEffect(() => {
    fetchData();

    // Set up real-time subscription
    const subscription = supabase
      .channel(`${table}_changes`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: table,
          filter: userId ? `user_id=eq.${userId}` : ''
        },
        (payload) => {
          console.log(`Real-time change in ${table}:`, payload);
          
          switch (payload.eventType) {
            case 'INSERT':
              setData(prev => [...prev, payload.new]);
              break;
            case 'UPDATE':
              setData(prev => 
                prev.map(item => 
                  item.id === payload.new.id ? payload.new : item
                )
              );
              break;
            case 'DELETE':
              setData(prev => 
                prev.filter(item => item.id !== payload.old.id)
              );
              break;
          }
        }
      )
      .subscribe();

    return () => {
      subscription.unsubscribe();
    };
  }, [fetchData, table, userId]);

  const refetch = useCallback(() => {
    fetchData();
  }, [fetchData]);

  return { data, loading, error, refetch };
};

export const useRealtimeAnalytics = (userId) => {
  const [analytics, setAnalytics] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchAnalytics = useCallback(async () => {
    try {
      setLoading(true);
      const { db } = await import('../lib/supabase');
      const analyticsData = await db.getUserAnalyticsSummary(userId, 7);
      setAnalytics(analyticsData);
    } catch (error) {
      console.error('Error fetching analytics:', error);
    } finally {
      setLoading(false);
    }
  }, [userId]);

  useEffect(() => {
    if (!userId) return;

    fetchAnalytics();

    // Listen for changes in relevant tables
    const subscriptions = [
      supabase
        .channel('analytics_events_changes')
        .on(
          'postgres_changes',
          {
            event: '*',
            schema: 'public',
            table: 'analytics_events',
            filter: `user_id=eq.${userId}`
          },
          () => fetchAnalytics()
        )
        .subscribe(),
      
      supabase
        .channel('applications_changes')
        .on(
          'postgres_changes',
          {
            event: '*',
            schema: 'public',
            table: 'applications',
            filter: `profile_id=eq.${userId}`
          },
          () => fetchAnalytics()
        )
        .subscribe(),
      
      supabase
        .channel('messages_changes')
        .on(
          'postgres_changes',
          {
            event: '*',
            schema: 'public',
            table: 'messages',
            filter: `from_user_id=eq.${userId},to_user_id=eq.${userId}`
          },
          () => fetchAnalytics()
        )
        .subscribe()
    ];

    return () => {
      subscriptions.forEach(sub => sub.unsubscribe());
    };
  }, [userId, fetchAnalytics]);

  return { analytics, loading, refetch: fetchAnalytics };
};
