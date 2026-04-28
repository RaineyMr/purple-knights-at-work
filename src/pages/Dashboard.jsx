import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../hooks/useAuth';
import { useRealtimeAnalytics } from '../hooks/useRealtime';
import { db } from '../lib/supabase';
import { BriefcaseIcon, UserGroupIcon, NewspaperIcon, ChatBubbleLeftIcon, EyeIcon, BookmarkIcon } from '@heroicons/react/24/outline';

export default function Dashboard() {
  const { user } = useAuth();
  const { analytics, loading } = useRealtimeAnalytics(user?.id);
  const [stats, setStats] = useState({ 
    applications: 0, 
    jobPosts: 0, 
    connections: 0, 
    unreadMessages: 0,
    jobViews: 0,
    jobSaves: 0,
    totalApplications: 0,
    offeredApplications: 0,
    sentMessages: 0,
    receivedMessages: 0
  });
  const [messages, setMessages] = useState([]);

  // Update stats when analytics data changes
  useEffect(() => {
    if (analytics && user) {
      setStats({
        applications: analytics.applications.applied,
        jobPosts: 0, // This would require a separate query to count user's posted jobs
        connections: 0, // Groups not implemented yet
        unreadMessages: messages.filter(m => !m.read_at && m.to_user_id === user.id).length,
        jobViews: analytics.jobViews,
        jobSaves: analytics.jobSaves,
        totalApplications: analytics.applications.total,
        offeredApplications: analytics.applications.offered,
        sentMessages: analytics.messages.sent,
        receivedMessages: analytics.messages.received
      });
    }
  }, [analytics, user, messages]);

  // Fetch messages for unread count
  useEffect(() => {
    if (user) {
      db.getMessages(user.id).then(setMessages).catch(() => setMessages([]));
    }
  }, [user]);

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
        {analytics && (
          <p className="text-sm opacity-75 mt-2">
            Your activity over the last {analytics.period}
          </p>
        )}
      </div>
      
      {/* Analytics Summary */}
      {analytics && (
        <div className="bg-white rounded-lg shadow-sm p-6">
          <h2 className="text-lg font-semibold mb-4 text-gray-900">Your Activity Summary</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="text-center p-4 bg-purple-50 rounded-lg">
              <EyeIcon className="h-8 w-8 text-purple-600 mx-auto mb-2" />
              <p className="text-2xl font-bold text-purple-900">{analytics.jobViews}</p>
              <p className="text-sm text-purple-700">Job Views</p>
            </div>
            <div className="text-center p-4 bg-amber-50 rounded-lg">
              <BookmarkIcon className="h-8 w-8 text-amber-600 mx-auto mb-2" />
              <p className="text-2xl font-bold text-amber-900">{analytics.jobSaves}</p>
              <p className="text-sm text-amber-700">Job Saves</p>
            </div>
            <div className="text-center p-4 bg-green-50 rounded-lg">
              <BriefcaseIcon className="h-8 w-8 text-green-600 mx-auto mb-2" />
              <p className="text-2xl font-bold text-green-900">{analytics.applications.applied}</p>
              <p className="text-sm text-green-700">Applications</p>
            </div>
            <div className="text-center p-4 bg-blue-50 rounded-lg">
              <ChatBubbleLeftIcon className="h-8 w-8 text-blue-600 mx-auto mb-2" />
              <p className="text-2xl font-bold text-blue-900">{analytics.messages.total}</p>
              <p className="text-sm text-blue-700">Messages</p>
            </div>
          </div>
        </div>
      )}
      
      {/* Traditional Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm">
          <p className="text-sm text-gray-600">Applications</p>
          <p className="text-2xl font-semibold">{stats.applications}</p>
          {analytics && analytics.applications.offered > 0 && (
            <p className="text-xs text-green-600 mt-1">{analytics.applications.offered} offered</p>
          )}
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
          <p className="text-sm text-gray-600">Unread Messages</p>
          <p className="text-2xl font-semibold">{stats.unreadMessages}</p>
        </div>
      </div>
      
      {/* Detailed Activity Breakdown */}
      {analytics && (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div className="bg-white p-6 rounded-lg shadow-sm">
            <h3 className="text-lg font-semibold mb-4">Application Status</h3>
            <div className="space-y-3">
              <div className="flex justify-between items-center">
                <span className="text-sm text-gray-600">Applied</span>
                <span className="font-semibold">{analytics.applications.applied}</span>
              </div>
              {analytics.applications.offered > 0 && (
                <div className="flex justify-between items-center">
                  <span className="text-sm text-gray-600">Offers Received</span>
                  <span className="font-semibold text-green-600">{analytics.applications.offered}</span>
                </div>
              )}
              <div className="flex justify-between items-center">
                <span className="text-sm text-gray-600">Total Applications</span>
                <span className="font-semibold">{analytics.applications.total}</span>
              </div>
            </div>
          </div>
          
          <div className="bg-white p-6 rounded-lg shadow-sm">
            <h3 className="text-lg font-semibold mb-4">Messaging Activity</h3>
            <div className="space-y-3">
              <div className="flex justify-between items-center">
                <span className="text-sm text-gray-600">Sent</span>
                <span className="font-semibold">{analytics.messages.sent}</span>
              </div>
              <div className="flex justify-between items-center">
                <span className="text-sm text-gray-600">Received</span>
                <span className="font-semibold">{analytics.messages.received}</span>
              </div>
              <div className="flex justify-between items-center">
                <span className="text-sm text-gray-600">Total Messages</span>
                <span className="font-semibold">{analytics.messages.total}</span>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
