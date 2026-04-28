import { useCallback } from 'react';
import { useAuth } from './useAuth';
import { db } from '../lib/supabase';

export const useAnalytics = () => {
  const { user } = useAuth();

  const trackEvent = useCallback(async (eventType, entityType = null, entityId = null, metadata = {}) => {
    if (!user) return;

    try {
      await db.trackAnalyticsEvent(user.id, eventType, entityType, entityId, metadata);
    } catch (error) {
      console.error('Error tracking analytics event:', error);
    }
  }, [user]);

  const trackJobView = useCallback(async (jobId, jobTitle = null) => {
    await trackEvent('job_view', 'job', jobId, { job_title: jobTitle });
  }, [trackEvent]);

  const trackJobSave = useCallback(async (jobId, jobTitle = null) => {
    await trackEvent('job_save', 'job', jobId, { job_title: jobTitle });
  }, [trackEvent]);

  const trackApplication = useCallback(async (jobId, jobTitle = null) => {
    await trackEvent('job_application', 'job', jobId, { job_title: jobTitle });
  }, [trackEvent]);

  const trackMessage = useCallback(async (messageId, recipientId = null) => {
    await trackEvent('message_sent', 'message', messageId, { recipient_id: recipientId });
  }, [trackEvent]);

  const trackProfileView = useCallback(async (profileId, profileName = null) => {
    await trackEvent('profile_view', 'profile', profileId, { profile_name: profileName });
  }, [trackEvent]);

  const trackLogin = useCallback(async () => {
    await trackEvent('login', null, null, { timestamp: new Date().toISOString() });
  }, [trackEvent]);

  return {
    trackEvent,
    trackJobView,
    trackJobSave,
    trackApplication,
    trackMessage,
    trackProfileView,
    trackLogin
  };
};

// Higher-order component for automatic tracking
export const withAnalytics = (WrappedComponent) => {
  return function WithAnalyticsComponent(props) {
    const analytics = useAnalytics();
    
    return <WrappedComponent {...props} analytics={analytics} />;
  };
};
