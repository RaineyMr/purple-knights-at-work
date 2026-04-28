import React, { useState, useEffect } from 'react';
import { HeartIcon, ChatBubbleLeftIcon, ShareIcon, PlusIcon, BriefcaseIcon, DocumentIcon, GiftIcon, EyeIcon, ChatBubbleLeftRightIcon, SparklesIcon, StarIcon, BuildingOfficeIcon, TrophyIcon } from '@heroicons/react/24/outline';
import { HeartIcon as HeartSolidIcon } from '@heroicons/react/24/solid';
import { useAuth } from '../hooks/useAuth';
import { useActivityFeed } from '../hooks/useActivityFeed';
import { useAnalytics } from '../hooks/useAnalytics';

export default function Feed() {
  const { user } = useAuth();
  const analytics = useAnalytics();
  const { activities, loading } = useActivityFeed();
  const [searchTerm, setSearchTerm] = useState('');

  const getIcon = (iconType) => {
    const iconMap = {
      briefcase: BriefcaseIcon,
      document: DocumentIcon,
      gift: GiftIcon,
      celebration: SparklesIcon,
      eye: EyeIcon,
      message: ChatBubbleLeftRightIcon,
      star: StarIcon,
      building: BuildingOfficeIcon,
      award: TrophyIcon
    };
    return iconMap[iconType] || BriefcaseIcon;
  };

  const formatTime = (dateString) => {
    if (!dateString) return '';
    
    const date = new Date(dateString);
    const now = new Date();
    const diffMs = now - date;
    const diffMins = Math.floor(diffMs / 60000);
    const diffHours = Math.floor(diffMs / 3600000);
    const diffDays = Math.floor(diffMs / 86400000);
    
    if (diffMins < 1) return 'Just now';
    if (diffMins < 60) return `${diffMins}m ago`;
    if (diffHours < 24) return `${diffHours}h ago`;
    if (diffDays < 7) return `${diffDays}d ago`;
    
    return date.toLocaleDateString();
  };

  const handleActivityClick = async (activity) => {
    // Track analytics for feed interactions
    await analytics.trackEvent('feed_click', activity.type, activity.metadata?.job_id);
    
    // Handle different activity types
    if (activity.type === 'job_posting' && activity.metadata?.job_id) {
      // Navigate to job details
      console.log('Navigate to job:', activity.metadata.job_id);
    } else if (activity.type === 'job_message' && activity.metadata?.message_id) {
      // Navigate to messages
      console.log('Navigate to message:', activity.metadata.message_id);
    }
  };

  if (loading) {
    return (
      <div className="max-w-2xl mx-auto p-6">
        <div className="text-center py-8">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-purple-600"></div>
          <p className="mt-2 text-gray-600">Loading feed...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto">
      {/* Activity Feed Header */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 mb-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Activity Feed</h1>
            <p className="text-gray-600 mt-1">Job opportunities and network updates</p>
          </div>
          <div className="relative">
            <input
              type="text"
              placeholder="Search activities..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
            />
            <div className="absolute left-3 top-1/2 transform -translate-y-1/2">
              <svg className="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
          </div>
        </div>
      </div>

      {/* Activity Feed */}
      <div className="space-y-4">
        {loading ? (
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-8 text-center">
            <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-purple-600"></div>
            <p className="mt-2 text-gray-600">Loading activity feed...</p>
          </div>
        ) : activities.length === 0 ? (
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-8 text-center">
            <BriefcaseIcon className="h-12 w-12 text-gray-400 mx-auto mb-4" />
            <h3 className="text-lg font-medium text-gray-900 mb-2">No recent activity</h3>
            <p className="text-gray-500">Check back later for job opportunities and network updates</p>
          </div>
        ) : (
          activities
            .filter(activity => 
              searchTerm === '' || 
              activity.target.toLowerCase().includes(searchTerm.toLowerCase()) ||
              activity.action.toLowerCase().includes(searchTerm.toLowerCase())
            )
            .map(activity => {
              const Icon = getIcon(activity.icon);
              return (
                <div 
                  key={activity.id} 
                  className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow cursor-pointer"
                  onClick={() => handleActivityClick(activity)}
                >
                  <div className="flex items-start space-x-4">
                    {/* Activity Icon */}
                    <div className="flex-shrink-0">
                      <div className={`p-2 rounded-full ${
                        activity.type === 'job_posting' ? 'bg-purple-100' :
                        activity.type === 'hire' ? 'bg-green-100' :
                        activity.type === 'offer' ? 'bg-amber-100' :
                        activity.type === 'promotion' ? 'bg-blue-100' :
                        activity.type === 'company_change' ? 'bg-indigo-100' :
                        activity.type === 'achievement' ? 'bg-yellow-100' :
                        'bg-gray-100'
                      }`}>
                        <Icon className={`h-5 w-5 ${
                          activity.type === 'job_posting' ? 'text-purple-600' :
                          activity.type === 'hire' ? 'text-green-600' :
                          activity.type === 'offer' ? 'text-amber-600' :
                          activity.type === 'promotion' ? 'text-blue-600' :
                          activity.type === 'company_change' ? 'text-indigo-600' :
                          activity.type === 'achievement' ? 'text-yellow-600' :
                          'text-gray-600'
                        }`} />
                      </div>
                    </div>

                    {/* Activity Content */}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center space-x-2 mb-2">
                        {activity.actor && (
                          <span className="font-semibold text-gray-900">
                            {activity.actor.first_name} {activity.actor.last_name}
                          </span>
                        )}
                        <span className="text-gray-600">{activity.action}</span>
                        <span className="font-medium text-purple-600">{activity.target}</span>
                      </div>
                      
                      {/* Activity Details */}
                      {activity.type === 'job_posting' && activity.metadata && (
                        <div className="mt-3 p-3 bg-purple-50 rounded-lg">
                          <div className="grid grid-cols-2 gap-2 text-sm">
                            {activity.metadata.location && (
                              <div>
                                <span className="text-gray-600">Location:</span>
                                <span className="ml-2 text-purple-700">{activity.metadata.location}</span>
                              </div>
                            )}
                            {activity.metadata.job_type && (
                              <div>
                                <span className="text-gray-600">Type:</span>
                                <span className="ml-2 text-purple-700">{activity.metadata.job_type.replace('_', ' ')}</span>
                              </div>
                            )}
                            {activity.metadata.salary_min && activity.metadata.salary_max && (
                              <div className="col-span-2">
                                <span className="text-gray-600">Salary:</span>
                                <span className="ml-2 text-purple-700">
                                  ${activity.metadata.salary_min.toLocaleString()} - ${activity.metadata.salary_max.toLocaleString()}
                                </span>
                              </div>
                            )}
                          </div>
                        </div>
                      )}
                      
                      {activity.type === 'job_message' && activity.metadata?.preview && (
                        <div className="mt-2 p-3 bg-gray-50 rounded-lg">
                          <p className="text-sm text-gray-600 italic">"{activity.metadata.preview}"</p>
                        </div>
                      )}
                      
                      {activity.type === 'hire' && (
                        <div className="mt-2">
                          <span className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">
                            🎉 Congratulations!
                          </span>
                        </div>
                      )}
                      
                      {activity.type === 'offer' && (
                        <div className="mt-2">
                          <span className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-amber-100 text-amber-800">
                            🎁 New Offer
                          </span>
                        </div>
                      )}
                      
                      {activity.type === 'promotion' && (
                        <div className="mt-2">
                          <span className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                            ⭐ Promotion
                          </span>
                        </div>
                      )}
                      
                      {activity.type === 'company_change' && (
                        <div className="mt-2">
                          <span className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800">
                            🏢 New Role
                          </span>
                        </div>
                      )}
                      
                      {activity.type === 'achievement' && (
                        <div className="mt-2">
                          <span className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                            🏆 Achievement
                          </span>
                        </div>
                      )}
                    </div>

                    {/* Timestamp */}
                    <div className="flex-shrink-0">
                      <span className="text-sm text-gray-500">{formatTime(activity.timestamp)}</span>
                    </div>
                  </div>
                </div>
              );
            })
        )}
      </div>

      {/* Load More */}
      <div className="mt-6 text-center">
        <button className="px-6 py-2 text-purple-600 hover:text-purple-700 font-medium">
          Load more posts
        </button>
      </div>
    </div>
  );
}
