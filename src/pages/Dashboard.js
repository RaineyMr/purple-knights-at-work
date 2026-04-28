import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../hooks/useAuth';
import { db } from '../lib/supabase';
import { BriefcaseIcon, UserGroupIcon, NewspaperIcon, ChatBubbleLeftIcon } from '@heroicons/react/24/outline';

export default function Dashboard() {
  const { user } = useAuth();
  const [stats, setStats] = useState({ applications: 0, jobPosts: 0, connections: 0, unreadMessages: 0 });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchStats();
    }
  }, [user]);

  const fetchStats = async () => {
    try {
      const [applications, messages, groups] = await Promise.all([
        db.getApplications(user.id).catch(() => []),
        db.getMessages(user.id).catch(() => []),
        db.getGroups(user.id).catch(() => [])
      ]);

      setStats({
        applications: applications.length,
        jobPosts: 0, // This would require a separate query to count user's posted jobs
        connections: groups.length,
        unreadMessages: messages.filter(m => !m.is_read && m.receiver_id === user.id).length
      });
    } catch (error) {
      console.error('Error fetching stats:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="space-y-6">
        <div className="bg-gradient-to-r from-purple-600 to-amber-500 rounded-lg p-6 text-white">
          <div className="animate-pulse">
            <div className="h-8 bg-white/20 rounded w-1/3 mb-2"></div>
            <div className="h-4 bg-white/20 rounded w-2/3"></div>
          </div>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          {[1, 2, 3, 4].map(i => (
            <div key={i} className="bg-white p-6 rounded-lg shadow-sm">
              <div className="animate-pulse">
                <div className="h-4 bg-gray-200 rounded w-2/3 mb-2"></div>
                <div className="h-8 bg-gray-200 rounded w-1/2"></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-purple-600 to-amber-500 rounded-lg p-6 text-white">
        <h1 className="text-2xl font-bold mb-2">Welcome back, {user?.first_name || 'Purple Knight'}!</h1>
        <p className="opacity-90">{user?.headline || 'Complete your profile to get started'}</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <p className="text-sm text-gray-600">Applications</p>
          <p className="text-2xl font-semibold">{stats.applications}</p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <p className="text-sm text-gray-600">Posted Jobs</p>
          <p className="text-2xl font-semibold">{stats.jobPosts}</p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <p className="text-sm text-gray-600">Connections</p>
          <p className="text-2xl font-semibold">{stats.connections}</p>
        </div>
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <p className="text-sm text-gray-600">Messages</p>
          <p className="text-2xl font-semibold">{stats.unreadMessages}</p>
        </div>
      </div>
    </div>
  );
}
