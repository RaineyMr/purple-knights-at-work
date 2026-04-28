import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../hooks/useAuth';
import { useRealtimeAnalytics } from '../hooks/useRealtime';
import { db } from '../lib/supabase';
import { BriefcaseIcon, UserGroupIcon, NewspaperIcon, ChatBubbleLeftIcon, EyeIcon, BookmarkIcon, HeartIcon, CalendarIcon, MapPinIcon } from '@heroicons/react/24/outline';
import { HeartIcon as HeartSolidIcon } from '@heroicons/react/24/solid';

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
  
  // Feed state
  const [feedItems, setFeedItems] = useState([]);
  const [feedLoading, setFeedLoading] = useState(true);
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState({
    currentPage: 1,
    totalPages: 1,
    totalItems: 0,
    hasNextPage: false,
    hasPreviousPage: false
  });
  const itemsPerPage = 5;

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

  // Load feed data
  useEffect(() => {
    // Mock feed data for demo purposes - expanded to more items for pagination
    const mockFeedItems = [
      {
        id: '1',
        type: 'job_posted',
        user: {
          name: 'Sarah Johnson',
          avatar: 'SJ',
          role: 'HR Manager at Tech Corp'
        },
        action: 'posted a new job',
        target: {
          title: 'Senior Frontend Developer',
          company: 'Tech Innovations Inc.',
          location: 'New York, NY'
        },
        timestamp: new Date(Date.now() - 3600000).toISOString(),
        likes: 12,
        comments: 3,
        liked: false
      },
      {
        id: '2',
        type: 'profile_update',
        user: {
          name: 'Michael Chen',
          avatar: 'MC',
          role: 'Software Engineer'
        },
        action: 'updated their profile',
        target: {
          detail: 'Added new skills: React, TypeScript, Node.js'
        },
        timestamp: new Date(Date.now() - 7200000).toISOString(),
        likes: 8,
        comments: 1,
        liked: true
      },
      {
        id: '3',
        type: 'job_applied',
        user: {
          name: 'Emily Davis',
          avatar: 'ED',
          role: 'UX Designer'
        },
        action: 'applied for a job',
        target: {
          title: 'Product Manager',
          company: 'Digital Solutions LLC'
        },
        timestamp: new Date(Date.now() - 10800000).toISOString(),
        likes: 15,
        comments: 5,
        liked: false
      },
      {
        id: '4',
        type: 'connection',
        user: {
          name: 'David Wilson',
          avatar: 'DW',
          role: 'Marketing Specialist'
        },
        action: 'connected with',
        target: {
          name: 'Lisa Anderson',
          role: 'Product Manager at StartupXYZ'
        },
        timestamp: new Date(Date.now() - 14400000).toISOString(),
        likes: 6,
        comments: 2,
        liked: false
      },
      {
        id: '5',
        type: 'achievement',
        user: {
          name: 'Jennifer Martinez',
          avatar: 'JM',
          role: 'Data Scientist'
        },
        action: 'achieved',
        target: {
          detail: '100+ job applications milestone',
          badge: '🎉'
        },
        timestamp: new Date(Date.now() - 18000000).toISOString(),
        likes: 25,
        comments: 8,
        liked: true
      },
      {
        id: '6',
        type: 'job_posted',
        user: {
          name: 'Robert Taylor',
          avatar: 'RT',
          role: 'Recruiter at StartupXYZ'
        },
        action: 'posted a new job',
        target: {
          title: 'Full Stack Developer',
          company: 'StartupXYZ',
          location: 'Remote'
        },
        timestamp: new Date(Date.now() - 21600000).toISOString(),
        likes: 18,
        comments: 4,
        liked: false
      },
      {
        id: '7',
        type: 'profile_update',
        user: {
          name: 'Amanda White',
          avatar: 'AW',
          role: 'Product Designer'
        },
        action: 'updated their profile',
        target: {
          detail: 'Added portfolio link and updated work experience'
        },
        timestamp: new Date(Date.now() - 25200000).toISOString(),
        likes: 10,
        comments: 2,
        liked: false
      },
      {
        id: '8',
        type: 'job_applied',
        user: {
          name: 'Chris Brown',
          avatar: 'CB',
          role: 'Backend Developer'
        },
        action: 'applied for a job',
        target: {
          title: 'Senior Backend Engineer',
          company: 'Cloud Systems Inc'
        },
        timestamp: new Date(Date.now() - 28800000).toISOString(),
        likes: 7,
        comments: 1,
        liked: true
      }
    ];

    setTimeout(() => {
      setFeedItems(mockFeedItems);
      
      // Set up pagination
      const totalItems = mockFeedItems.length;
      const totalPages = Math.ceil(totalItems / itemsPerPage);
      
      setPagination({
        currentPage: 1,
        totalPages,
        totalItems,
        hasNextPage: totalPages > 1,
        hasPreviousPage: false
      });
      
      setFeedLoading(false);
    }, 1000);
  }, []);

  useEffect(() => {
    // Update pagination when page changes
    if (feedItems.length > 0) {
      const totalItems = feedItems.length;
      const totalPages = Math.ceil(totalItems / itemsPerPage);
      
      setPagination(prev => ({
        ...prev,
        currentPage,
        totalPages,
        hasNextPage: currentPage < totalPages,
        hasPreviousPage: currentPage > 1
      }));
    }
  }, [currentPage, feedItems.length]);

  // Feed helper functions
  const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
  };

  const getPaginatedItems = () => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    return feedItems.slice(startIndex, endIndex);
  };

  const handleLike = (itemId) => {
    setFeedItems(prev => prev.map(item => 
      item.id === itemId 
        ? { ...item, liked: !item.liked, likes: item.liked ? item.likes - 1 : item.likes + 1 }
        : item
    ));
  };

  const formatTimeAgo = (timestamp) => {
    const now = new Date();
    const time = new Date(timestamp);
    const diffInMinutes = Math.floor((now - time) / 60000);
    
    if (diffInMinutes < 60) {
      return `${diffInMinutes}m ago`;
    } else if (diffInMinutes < 1440) {
      return `${Math.floor(diffInMinutes / 60)}h ago`;
    } else {
      return `${Math.floor(diffInMinutes / 1440)}d ago`;
    }
  };

  const getActivityIcon = (type) => {
    switch (type) {
      case 'job_posted':
        return <BriefcaseIcon className="h-5 w-5 text-blue-600" />;
      case 'profile_update':
        return <UserGroupIcon className="h-5 w-5 text-green-600" />;
      case 'job_applied':
        return <BriefcaseIcon className="h-5 w-5 text-purple-600" />;
      case 'connection':
        return <UserGroupIcon className="h-5 w-5 text-orange-600" />;
      case 'achievement':
        return <HeartIcon className="h-5 w-5 text-red-600" />;
      default:
        return <UserGroupIcon className="h-5 w-5 text-gray-600" />;
    }
  };

  const renderPaginationControls = () => {
    if (pagination.totalPages <= 1) return null;

    const pages = [];
    const maxVisiblePages = 5;
    
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(pagination.totalPages, startPage + maxVisiblePages - 1);
    
    if (endPage - startPage < maxVisiblePages - 1) {
      startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    for (let i = startPage; i <= endPage; i++) {
      pages.push(i);
    }

    return (
      <div className="flex items-center justify-center space-x-2 mt-8">
        <button
          onClick={() => handlePageChange(1)}
          disabled={!pagination.hasPreviousPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          First
        </button>
        
        <button
          onClick={() => handlePageChange(currentPage - 1)}
          disabled={!pagination.hasPreviousPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Previous
        </button>

        {startPage > 1 && (
          <>
            <button
              onClick={() => handlePageChange(1)}
              className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50"
            >
              1
            </button>
            {startPage > 2 && <span className="px-2 text-gray-500">...</span>}
          </>
        )}

        {pages.map(page => (
          <button
            key={page}
            onClick={() => handlePageChange(page)}
            className={`px-3 py-2 text-sm font-medium rounded-md ${
              page === currentPage
                ? 'bg-blue-600 text-white border border-blue-600'
                : 'text-gray-500 bg-white border border-gray-300 hover:bg-gray-50'
            }`}
          >
            {page}
          </button>
        ))}

        {endPage < pagination.totalPages && (
          <>
            {endPage < pagination.totalPages - 1 && <span className="px-2 text-gray-500">...</span>}
            <button
              onClick={() => handlePageChange(pagination.totalPages)}
              className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50"
            >
              {pagination.totalPages}
            </button>
          </>
        )}

        <button
          onClick={() => handlePageChange(currentPage + 1)}
          disabled={!pagination.hasNextPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Next
        </button>

        <button
          onClick={() => handlePageChange(pagination.totalPages)}
          disabled={!pagination.hasNextPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Last
        </button>
      </div>
    );
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
      
      {/* Activity Feed Section */}
      <div className="bg-white rounded-lg shadow-sm p-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Activity Feed</h2>
        
        {/* Pagination info */}
        <div className="mb-4 text-sm text-gray-600">
          Showing {((currentPage - 1) * itemsPerPage) + 1} to {Math.min(currentPage * itemsPerPage, pagination.totalItems)} of {pagination.totalItems} activities
        </div>
        
        {feedLoading ? (
          <div className="text-center py-8">
            <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
            <p className="mt-2 text-gray-600">Loading activity feed...</p>
          </div>
        ) : (
          <>
            <div className="space-y-6">
              {getPaginatedItems().map((item) => (
                <div key={item.id} className="bg-gray-50 rounded-lg p-6 hover:bg-gray-100 transition-colors">
                  <div className="flex items-start space-x-3">
                    <div className="flex-shrink-0">
                      <div className="h-10 w-10 rounded-full bg-purple-600 flex items-center justify-center">
                        <span className="text-white text-sm font-bold">{item.user.avatar}</span>
                      </div>
                    </div>
                    
                    <div className="flex-1">
                      <div className="flex items-center space-x-2">
                        <span className="font-semibold text-gray-900">{item.user.name}</span>
                        <span className="text-gray-600">{item.action}</span>
                        {getActivityIcon(item.type)}
                      </div>
                      
                      <div className="mt-1">
                        {item.type === 'job_posted' && (
                          <div className="text-gray-700">
                            <span className="font-medium">{item.target.title}</span>
                            <span className="text-gray-600"> at {item.target.company}</span>
                            {item.target.location && (
                              <div className="flex items-center text-sm text-gray-500 mt-1">
                                <MapPinIcon className="h-4 w-4 mr-1" />
                                {item.target.location}
                              </div>
                            )}
                          </div>
                        )}
                        
                        {item.type === 'profile_update' && (
                          <div className="text-gray-700">{item.target.detail}</div>
                        )}
                        
                        {item.type === 'job_applied' && (
                          <div className="text-gray-700">
                            <span className="font-medium">{item.target.title}</span>
                            <span className="text-gray-600"> at {item.target.company}</span>
                          </div>
                        )}
                        
                        {item.type === 'connection' && (
                          <div className="text-gray-700">
                            <span className="font-medium">{item.target.name}</span>
                            <span className="text-gray-600"> ({item.target.role})</span>
                          </div>
                        )}
                        
                        {item.type === 'achievement' && (
                          <div className="text-gray-700">
                            <span className="mr-2">{item.target.badge}</span>
                            <span>{item.target.detail}</span>
                          </div>
                        )}
                      </div>
                      
                      <div className="flex items-center justify-between mt-4">
                        <div className="flex items-center space-x-4 text-sm text-gray-500">
                          <span className="flex items-center">
                            <CalendarIcon className="h-4 w-4 mr-1" />
                            {formatTimeAgo(item.timestamp)}
                          </span>
                        </div>
                        
                        <div className="flex items-center space-x-4">
                          <button
                            onClick={() => handleLike(item.id)}
                            className={`flex items-center space-x-1 text-sm ${
                              item.liked ? 'text-red-600' : 'text-gray-500 hover:text-red-600'
                            }`}
                          >
                            {item.liked ? (
                              <HeartSolidIcon className="h-5 w-5" />
                            ) : (
                              <HeartIcon className="h-5 w-5" />
                            )}
                            <span>{item.likes}</span>
                          </button>
                          
                          <button className="flex items-center space-x-1 text-sm text-gray-500 hover:text-blue-600">
                            <ChatBubbleLeftIcon className="h-5 w-5" />
                            <span>{item.comments}</span>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
            
            {getPaginatedItems().length === 0 && (
              <div className="bg-gray-50 rounded-lg p-8 text-center">
                <p className="text-gray-500">No recent activity</p>
              </div>
            )}
            
            {/* Pagination Controls */}
            {renderPaginationControls()}
          </>
        )}
      </div>
    </div>
  );
}
