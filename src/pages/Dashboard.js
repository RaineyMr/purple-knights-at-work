import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../hooks/useAuth';
import { BriefcaseIcon, UserGroupIcon, NewspaperIcon, ChatBubbleLeftIcon } from '@heroicons/react/24/outline';

export default function Dashboard() {
  const { profile } = useAuth();
  const [stats, setStats] = useState({ applications: 0, jobPosts: 0, connections: 0, unreadMessages: 0 });

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-purple-600 to-amber-500 rounded-lg p-6 text-white">
        <h1 className="text-2xl font-bold mb-2">Welcome back, {profile?.first_name}!</h1>
        <p className="opacity-90">{profile?.headline || 'Complete your profile to get started'}</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm"><p className="text-sm text-gray-600">Applications</p><p className="text-2xl font-semibold">{stats.applications}</p></div>
        <div className="bg-white p-6 rounded-lg shadow-sm"><p className="text-sm text-gray-600">Posted Jobs</p><p className="text-2xl font-semibold">{stats.jobPosts}</p></div>
        <div className="bg-white p-6 rounded-lg shadow-sm"><p className="text-sm text-gray-600">Connections</p><p className="text-2xl font-semibold">{stats.connections}</p></div>
        <div className="bg-white p-6 rounded-lg shadow-sm"><p className="text-sm text-gray-600">Messages</p><p className="text-2xl font-semibold">{stats.unreadMessages}</p></div>
      </div>
    </div>
  );
}
