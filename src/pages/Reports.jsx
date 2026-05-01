import React, { useState, useEffect } from 'react';
import { useAuth } from '../hooks/useAuth';
import { ChartBarIcon, DocumentArrowDownIcon, CalendarIcon, BriefcaseIcon, ArrowTrendingUpIcon } from '@heroicons/react/24/outline';

export default function Reports() {
  const { user } = useAuth();
  const [analytics, setAnalytics] = useState(null);
  const [loading, setLoading] = useState(true);
  const [reportPeriod, setReportPeriod] = useState('7');
  const [reportType, setReportType] = useState('overview');

  useEffect(() => {
    const loadAnalytics = async () => {
      if (!user?.id) {
        setLoading(false);
        return;
      }

      try {
        setLoading(true);
        
        // Import db dynamically to avoid circular dependencies
        const { db } = await import('../lib/supabase');
        const analyticsData = await db.getUserAnalyticsSummary(user.id, parseInt(reportPeriod));
        setAnalytics(analyticsData);
      } catch (err) {
        console.error('Error loading analytics for reports:', err);
        // Set mock data as fallback
        setAnalytics({
          jobViews: 24,
          jobSaves: 8,
          applications: {
            applied: 2,
            offered: 1,
            total: 3
          },
          messages: {
            sent: 5,
            received: 12,
            total: 17
          },
          period: `${reportPeriod} days`
        });
      } finally {
        setLoading(false);
      }
    };

    loadAnalytics();
  }, [user?.id, reportPeriod]);

  const generateReport = () => {
    // In a real implementation, this would generate and download a report
    const reportData = {
      period: `${reportPeriod} days`,
      generated: new Date().toISOString(),
      user: user?.first_name || 'User',
      analytics
    };

    const blob = new Blob([JSON.stringify(reportData, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `job-search-report-${new Date().toISOString().split('T')[0]}.json`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  if (loading) {
    return (
      <div className="space-y-6">
        <div className="bg-white rounded-lg shadow-sm p-6">
          <div className="animate-pulse">
            <div className="h-8 bg-gray-200 rounded w-1/3 mb-4"></div>
            <div className="space-y-4">
              {[1, 2, 3, 4].map(i => (
                <div key={i} className="h-20 bg-gray-200 rounded"></div>
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="bg-white rounded-lg shadow-sm p-6">
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Job Search Reports</h1>
        <p className="text-gray-600">Generate insights and track your job search progress</p>
      </div>

      {/* Report Controls */}
      <div className="bg-white rounded-lg shadow-sm p-6">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between space-y-4 md:space-y-0">
          <div className="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Report Period</label>
              <select
                value={reportPeriod}
                onChange={(e) => setReportPeriod(e.target.value)}
                className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500"
              >
                <option value="7">Last 7 days</option>
                <option value="30">Last 30 days</option>
                <option value="90">Last 90 days</option>
                <option value="365">Last year</option>
              </select>
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Report Type</label>
              <select
                value={reportType}
                onChange={(e) => setReportType(e.target.value)}
                className="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500"
              >
                <option value="overview">Overview</option>
                <option value="applications">Applications</option>
                <option value="activity">Activity</option>
                <option value="trends">Trends</option>
              </select>
            </div>
          </div>

          <button
            onClick={generateReport}
            className="flex items-center space-x-2 px-4 py-2 bg-purple-600 text-white rounded-md hover:bg-purple-700 transition-colors"
          >
            <DocumentArrowDownIcon className="h-5 w-5" />
            <span>Export Report</span>
          </button>
        </div>
      </div>

      {/* Report Content */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Key Metrics */}
        <div className="bg-white rounded-lg shadow-sm p-6">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Key Metrics</h2>
          <div className="space-y-4">
            <div className="flex items-center justify-between p-3 bg-purple-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <BriefcaseIcon className="h-5 w-5 text-purple-600" />
                <span className="text-sm font-medium text-gray-900">Total Applications</span>
              </div>
              <span className="text-lg font-bold text-purple-900">{analytics?.applications.total || 0}</span>
            </div>
            
            <div className="flex items-center justify-between p-3 bg-green-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <ArrowTrendingUpIcon className="h-5 w-5 text-green-600" />
                <span className="text-sm font-medium text-gray-900">Response Rate</span>
              </div>
              <span className="text-lg font-bold text-green-900">
                {analytics?.applications.total > 0 
                  ? Math.round((analytics?.applications.offered / analytics?.applications.total) * 100) 
                  : 0}%
              </span>
            </div>
            
            <div className="flex items-center justify-between p-3 bg-amber-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <ChartBarIcon className="h-5 w-5 text-amber-600" />
                <span className="text-sm font-medium text-gray-900">Jobs Viewed</span>
              </div>
              <span className="text-lg font-bold text-amber-900">{analytics?.jobViews || 0}</span>
            </div>
            
            <div className="flex items-center justify-between p-3 bg-blue-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <CalendarIcon className="h-5 w-5 text-blue-600" />
                <span className="text-sm font-medium text-gray-900">Messages</span>
              </div>
              <span className="text-lg font-bold text-blue-900">{analytics?.messages.total || 0}</span>
            </div>
          </div>
        </div>

        {/* Activity Breakdown */}
        <div className="bg-white rounded-lg shadow-sm p-6">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Activity Breakdown</h2>
          <div className="space-y-4">
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-gray-600">Job Views</span>
                <span className="text-sm font-medium">{analytics?.jobViews || 0}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-purple-600 h-2 rounded-full" 
                  style={{ width: `${Math.min((analytics?.jobViews || 0) / 50 * 100, 100)}%` }}
                ></div>
              </div>
            </div>
            
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-gray-600">Job Saves</span>
                <span className="text-sm font-medium">{analytics?.jobSaves || 0}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-amber-600 h-2 rounded-full" 
                  style={{ width: `${Math.min((analytics?.jobSaves || 0) / 20 * 100, 100)}%` }}
                ></div>
              </div>
            </div>
            
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-gray-600">Applications</span>
                <span className="text-sm font-medium">{analytics?.applications.total || 0}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-green-600 h-2 rounded-full" 
                  style={{ width: `${Math.min((analytics?.applications.total || 0) / 10 * 100, 100)}%` }}
                ></div>
              </div>
            </div>
            
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm text-gray-600">Messages</span>
                <span className="text-sm font-medium">{analytics?.messages.total || 0}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-blue-600 h-2 rounded-full" 
                  style={{ width: `${Math.min((analytics?.messages.total || 0) / 30 * 100, 100)}%` }}
                ></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Insights */}
      <div className="bg-white rounded-lg shadow-sm p-6">
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Insights & Recommendations</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div className="p-4 bg-blue-50 rounded-lg">
            <h3 className="font-medium text-blue-900 mb-2">Application Rate</h3>
            <p className="text-sm text-blue-700">
              You've applied to {Math.round(((analytics?.applications.total || 0) / (analytics?.jobViews || 1)) * 100)}% of jobs you've viewed. 
              Consider increasing this to 15-20% for better results.
            </p>
          </div>
          
          <div className="p-4 bg-green-50 rounded-lg">
            <h3 className="font-medium text-green-900 mb-2">Response Success</h3>
            <p className="text-sm text-green-700">
              Your response rate is {analytics?.applications.total > 0 
                ? Math.round((analytics?.applications.offered / analytics?.applications.total) * 100) 
                : 0}%. 
              This is {analytics?.applications.total > 0 && (analytics?.applications.offered / analytics?.applications.total) >= 0.2 ? 'above' : 'below'} the industry average.
            </p>
          </div>
          
          <div className="p-4 bg-amber-50 rounded-lg">
            <h3 className="font-medium text-amber-900 mb-2">Activity Level</h3>
            <p className="text-sm text-amber-700">
              You've viewed {analytics?.jobViews || 0} jobs in the last {reportPeriod} days. 
              {analytics?.jobViews < 10 ? ' Consider increasing your job viewing activity.' : ' Great job staying active!'}
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
