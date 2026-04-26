import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';
import { db } from '../../lib/supabase';
import toast from 'react-hot-toast';
import {
  BriefcaseIcon,
  UserGroupIcon,
  ChartBarIcon,
  DocumentTextIcon,
  AcademicCapIcon,
  StarIcon,
  ArrowTrendingUpIcon,
  ClockIcon,
} from '@heroicons/react/24/outline';

const AlumniDashboard = () => {
  const { profile } = useAuth();
  const [stats, setStats] = useState({
    totalApplications: 0,
    activeApplications: 0,
    matchedJobs: 0,
    mentorConnections: 0,
    profileCompletion: 0,
  });
  const [recentActivity, setRecentActivity] = useState([]);
  const [recommendedJobs, setRecommendedJobs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadDashboardData();
  }, [profile]);

  const loadDashboardData = async () => {
    if (!profile) return;

    try {
      setLoading(true);

      // Load applications stats
      const { data: applications } = await db.getApplications(profile.id);
      const activeApps = applications?.filter(app => 
        ['applied', 'reviewing', 'interviewing'].includes(app.status)
      ) || [];

      // Load matches
      const { data: matches } = await db.getMatches(profile.id);
      
      // Load mentorships
      const { data: mentorships } = await db.getMentorships(profile.id);

      // Calculate profile completion
      const completion = calculateProfileCompletion(profile);

      // Get recent activity (mock data for now)
      const activity = [
        {
          id: 1,
          type: 'application',
          title: 'Applied to Software Engineer',
          company: 'Tech Corp',
          date: '2 days ago',
          status: 'reviewing'
        },
        {
          id: 2,
          type: 'match',
          title: 'New job match',
          company: 'Innovation Labs',
          date: '3 days ago',
          score: 85
        },
        {
          id: 3,
          type: 'mentor',
          title: 'Connected with mentor',
          mentor: 'John Smith',
          date: '1 week ago'
        }
      ];

      setStats({
        totalApplications: applications?.length || 0,
        activeApplications: activeApps.length,
        matchedJobs: matches?.length || 0,
        mentorConnections: mentorships?.length || 0,
        profileCompletion: completion,
      });

      setRecentActivity(activity);
      setRecommendedJobs(matches?.slice(0, 3) || []);

    } catch (error) {
      console.error('Error loading dashboard data:', error);
      toast.error('Failed to load dashboard data');
    } finally {
      setLoading(false);
    }
  };

  const calculateProfileCompletion = (profile) => {
    const fields = [
      'first_name', 'last_name', 'headline', 'bio', 'graduation_year',
      'phone', 'linkedin_url', 'resume_url'
    ];
    const completed = fields.filter(field => profile[field]).length;
    return Math.round((completed / fields.length) * 100);
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-purple-600"></div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Welcome Header */}
      <div className="bg-gradient-to-r from-purple-600 to-amber-500 rounded-lg p-6 text-white">
        <h1 className="text-2xl font-bold mb-2">
          Welcome back, {profile?.first_name}!
        </h1>
        <p className="opacity-90">
          Class of {profile?.graduation_year} • Ready to advance your career
        </p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="flex-shrink-0 bg-purple-100 rounded-lg p-3">
              <DocumentTextIcon className="h-6 w-6 text-purple-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Total Applications</p>
              <p className="text-2xl font-semibold text-gray-900">{stats.totalApplications}</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="flex-shrink-0 bg-green-100 rounded-lg p-3">
              <ClockIcon className="h-6 w-6 text-green-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Active Applications</p>
              <p className="text-2xl font-semibold text-gray-900">{stats.activeApplications}</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="flex-shrink-0 bg-amber-100 rounded-lg p-3">
              <BriefcaseIcon className="h-6 w-6 text-amber-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Job Matches</p>
              <p className="text-2xl font-semibold text-gray-900">{stats.matchedJobs}</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="flex-shrink-0 bg-blue-100 rounded-lg p-3">
              <AcademicCapIcon className="h-6 w-6 text-blue-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Mentor Connections</p>
              <p className="text-2xl font-semibold text-gray-900">{stats.mentorConnections}</p>
            </div>
          </div>
        </div>
      </div>

      {/* Profile Completion */}
      <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
        <div className="flex items-center justify-between mb-4">
          <h3 className="text-lg font-semibold text-gray-900">Profile Completion</h3>
          <span className="text-sm text-gray-600">{stats.profileCompletion}%</span>
        </div>
        <div className="w-full bg-gray-200 rounded-full h-2">
          <div 
            className="bg-gradient-to-r from-purple-600 to-amber-500 h-2 rounded-full"
            style={{ width: `${stats.profileCompletion}%` }}
          ></div>
        </div>
        {stats.profileCompletion < 100 && (
          <div className="mt-4">
            <Link
              to="/profile"
              className="inline-flex items-center text-sm text-purple-600 hover:text-purple-500"
            >
              Complete your profile to get better matches
              <ArrowTrendingUpIcon className="ml-1 h-4 w-4" />
            </Link>
          </div>
        )}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recent Activity */}
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Recent Activity</h3>
          <div className="space-y-4">
            {recentActivity.map((activity) => (
              <div key={activity.id} className="flex items-start space-x-3">
                <div className="flex-shrink-0">
                  {activity.type === 'application' && <DocumentTextIcon className="h-5 w-5 text-purple-600" />}
                  {activity.type === 'match' && <StarIcon className="h-5 w-5 text-amber-500" />}
                  {activity.type === 'mentor' && <AcademicCapIcon className="h-5 w-5 text-blue-600" />}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-gray-900">{activity.title}</p>
                  <p className="text-sm text-gray-500">
                    {activity.company && `${activity.company} • `}
                    {activity.mentor && `${activity.mentor} • `}
                    {activity.date}
                  </p>
                  {activity.status && (
                    <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-green-100 text-green-800 mt-1">
                      {activity.status}
                    </span>
                  )}
                  {activity.score && (
                    <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-amber-100 text-amber-800 mt-1">
                      {activity.score}% match
                    </span>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Recommended Jobs */}
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">Recommended Opportunities</h3>
            <Link to="/jobs" className="text-sm text-purple-600 hover:text-purple-500">
              View all
            </Link>
          </div>
          <div className="space-y-4">
            {recommendedJobs.length > 0 ? (
              recommendedJobs.map((job) => (
                <div key={job.id} className="border-l-4 border-purple-500 pl-4">
                  <h4 className="text-sm font-medium text-gray-900">{job.job_postings?.title}</h4>
                  <p className="text-sm text-gray-500">{job.job_postings?.company_name}</p>
                  <div className="flex items-center mt-2 space-x-4">
                    <span className="text-xs text-gray-500">{job.job_postings?.location}</span>
                    <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-purple-100 text-purple-800">
                      {job.match_score}% match
                    </span>
                  </div>
                </div>
              ))
            ) : (
              <p className="text-sm text-gray-500">No job matches yet. Complete your profile to get recommendations!</p>
            )}
          </div>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Quick Actions</h3>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          <Link
            to="/jobs"
            className="flex items-center justify-center px-4 py-3 bg-purple-600 text-white rounded-lg hover:bg-purple-700 transition-colors"
          >
            <BriefcaseIcon className="h-5 w-5 mr-2" />
            Browse Jobs
          </Link>
          <Link
            to="/profile"
            className="flex items-center justify-center px-4 py-3 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 transition-colors"
          >
            <UserGroupIcon className="h-5 w-5 mr-2" />
            Update Profile
          </Link>
          <Link
            to="/applications"
            className="flex items-center justify-center px-4 py-3 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 transition-colors"
          >
            <DocumentTextIcon className="h-5 w-5 mr-2" />
            My Applications
          </Link>
          <Link
            to="/messages"
            className="flex items-center justify-center px-4 py-3 bg-gray-200 text-gray-900 rounded-lg hover:bg-gray-300 transition-colors"
          >
            <ChartBarIcon className="h-5 w-5 mr-2" />
            Messages
          </Link>
        </div>
      </div>
    </div>
  );
};

export default AlumniDashboard;
