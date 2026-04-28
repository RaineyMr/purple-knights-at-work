import React from 'react';
import { useAuth } from '../hooks/useAuth';

export default function Dashboard() {
  const { user } = useAuth();

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-purple-600 to-amber-500 rounded-lg p-6 text-white">
        <h1 className="text-2xl font-bold mb-2">Welcome back, {user?.first_name || 'Purple Knight'}!</h1>
        <p className="opacity-90">{user?.headline || 'Complete your profile to get started'}</p>
      </div>
      
      <div className="bg-white rounded-lg shadow-sm p-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Simple Dashboard Test</h2>
        <p className="text-gray-600">If you can see this, the navigation to dashboard is working!</p>
        <div className="mt-4 p-4 bg-green-50 border border-green-200 rounded-lg">
          <p className="text-green-800">✅ Dashboard component loaded successfully</p>
        </div>
      </div>
    </div>
  );
}
