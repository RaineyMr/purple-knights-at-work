import React, { useState, useEffect } from 'react';
import { HeartIcon, ChatBubbleLeftIcon, BriefcaseIcon, UserGroupIcon, CalendarIcon, MapPinIcon } from '@heroicons/react/24/outline';
import { HeartIcon as HeartSolidIcon } from '@heroicons/react/24/solid';

export default function Feed() {
  const [feedItems, setFeedItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState({
    currentPage: 1,
    totalPages: 1,
    totalItems: 0,
    hasNextPage: false,
    hasPreviousPage: false
  });
  const itemsPerPage = 5;

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
      },
      {
        id: '9',
        type: 'connection',
        user: {
          name: 'Lisa Anderson',
          avatar: 'LA',
          role: 'Product Manager at StartupXYZ'
        },
        action: 'connected with',
        target: {
          name: 'Kevin Rodriguez',
          role: 'CTO at Tech Innovations'
        },
        timestamp: new Date(Date.now() - 32400000).toISOString(),
        likes: 12,
        comments: 3,
        liked: false
      },
      {
        id: '10',
        type: 'achievement',
        user: {
          name: 'Mark Thompson',
          avatar: 'MT',
          role: 'DevOps Engineer'
        },
        action: 'achieved',
        target: {
          detail: '5 years at Purple Knights milestone',
          badge: '🏆'
        },
        timestamp: new Date(Date.now() - 36000000).toISOString(),
        likes: 30,
        comments: 12,
        liked: true
      },
      {
        id: '11',
        type: 'job_posted',
        user: {
          name: 'Nancy Davis',
          avatar: 'ND',
          role: 'Talent Acquisition'
        },
        action: 'posted a new job',
        target: {
          title: 'DevOps Engineer',
          company: 'Digital Solutions LLC',
          location: 'Austin, TX'
        },
        timestamp: new Date(Date.now() - 39600000).toISOString(),
        likes: 14,
        comments: 3,
        liked: false
      },
      {
        id: '12',
        type: 'profile_update',
        user: {
          name: 'James Wilson',
          avatar: 'JW',
          role: 'Frontend Developer'
        },
        action: 'updated their profile',
        target: {
          detail: 'Completed certification in Cloud Architecture'
        },
        timestamp: new Date(Date.now() - 43200000).toISOString(),
        likes: 20,
        comments: 5,
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
      
      setLoading(false);
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

  const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
  };

  const getPaginatedItems = () => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    return feedItems.slice(startIndex, endIndex);
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

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto p-6">
        <div className="text-center py-8">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading activity feed...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto p-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">Activity Feed</h1>
      
      {/* Pagination info */}
      <div className="mb-4 text-sm text-gray-600">
        Showing {((currentPage - 1) * itemsPerPage) + 1} to {Math.min(currentPage * itemsPerPage, pagination.totalItems)} of {pagination.totalItems} activities
      </div>
      
      <div className="space-y-6">
        {getPaginatedItems().map((item) => (
          <div key={item.id} className="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow">
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
        <div className="bg-white rounded-lg shadow-md p-8 text-center">
          <p className="text-gray-500">No recent activity</p>
        </div>
      )}
      
      {/* Pagination Controls */}
      {renderPaginationControls()}
    </div>
  );
}
