import React, { useState, useEffect } from 'react';
import { HeartIcon, ChatBubbleLeftIcon, ShareIcon, PlusIcon } from '@heroicons/react/24/outline';
import { HeartIcon as HeartSolidIcon } from '@heroicons/react/24/solid';
import { db } from '../lib/supabase';
import { useAuth } from '../hooks/useAuth';

export default function Feed() {
  const { user } = useAuth();
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchPosts();
  }, []);

  const fetchPosts = async () => {
    try {
      const postsData = await db.getPosts(20);
      setPosts(postsData || []);
    } catch (error) {
      console.error('Error fetching posts:', error);
    } finally {
      setLoading(false);
    }
  };

  const [newPost, setNewPost] = useState('');
  const [showCreatePost, setShowCreatePost] = useState(false);

  const handleLike = async (postId) => {
    try {
      // Toggle like locally for immediate feedback
      setPosts(posts.map(post => 
        post.id === postId 
          ? { ...post, liked: !post.liked, likes: post.liked ? post.likes - 1 : post.likes + 1 }
          : post
      ));
      
      // Here you would implement actual like functionality with Supabase
      // For now, just handling the UI update
    } catch (error) {
      console.error('Error liking post:', error);
    }
  };

  const handleCreatePost = async () => {
    if (newPost.trim() && user) {
      try {
        const newPostData = await db.createPost(user.id, 'text', null, newPost, null);
        if (newPostData) {
          // Add the new post to the top of the feed
          setPosts([newPostData, ...posts]);
          setNewPost('');
          setShowCreatePost(false);
        }
      } catch (error) {
        console.error('Error creating post:', error);
      }
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
      {/* Create Post Section */}
      {user && (
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
          <div className="flex items-start space-x-3">
            <div className="h-10 w-10 rounded-full bg-purple-600 flex items-center justify-center">
              <span className="text-white font-medium">
                {user.first_name ? user.first_name[0] : 'Y'}
              </span>
            </div>
            <div className="flex-1">
              <button
                onClick={() => setShowCreatePost(!showCreatePost)}
                className="w-full text-left p-3 bg-gray-50 rounded-lg text-gray-500 hover:bg-gray-100 transition-colors"
              >
                What's on your mind?
              </button>
            
            {showCreatePost && (
              <div className="mt-3 space-y-3">
                <textarea
                  value={newPost}
                  onChange={(e) => setNewPost(e.target.value)}
                  placeholder="Share your thoughts..."
                  className="w-full p-3 border border-gray-300 rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-purple-500"
                  rows={4}
                />
                <div className="flex justify-end space-x-3">
                  <button
                    onClick={() => {
                      setShowCreatePost(false);
                      setNewPost('');
                    }}
                    className="px-4 py-2 text-gray-600 hover:text-gray-800"
                  >
                    Cancel
                  </button>
                  <button
                    onClick={handleCreatePost}
                    className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700"
                  >
                    Post
                  </button>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
      )}

      {/* Feed Posts */}
      <div className="space-y-4">
        {posts.length === 0 ? (
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-8 text-center">
            <p className="text-gray-600">No posts yet. Be the first to share something!</p>
          </div>
        ) : (
          posts.map(post => (
            <div key={post.id} className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
              {/* Post Header */}
              <div className="flex items-start justify-between mb-4">
                <div className="flex items-start space-x-3">
                  <div className="h-10 w-10 rounded-full bg-purple-600 flex items-center justify-center">
                    <span className="text-white font-medium">
                      {post.user ? `${post.user.first_name[0]}${post.user.last_name[0]}` : 'U'}
                    </span>
                  </div>
                  <div>
                    <h3 className="font-semibold text-gray-900">
                      {post.user ? `${post.user.first_name} ${post.user.last_name}` : 'Unknown User'}
                    </h3>
                    <p className="text-sm text-gray-500">
                      {post.user?.current_company_id ? `Works at Company` : 'Alumni'}
                    </p>
                    <p className="text-xs text-gray-400 mt-1">
                      {new Date(post.created_at).toLocaleDateString()} • {new Date(post.created_at).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}
                    </p>
                  </div>
                </div>
              <button className="text-gray-400 hover:text-gray-600">
                <svg className="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"/>
                </svg>
              </button>
            </div>

            {/* Post Content */}
            <div className="mb-4">
              <p className="text-gray-800 whitespace-pre-wrap">{post.content}</p>
              {post.file_url && (
                <div className="mt-3 rounded-lg overflow-hidden">
                  <img src={post.file_url} alt="Post image" className="w-full" />
                </div>
              )}
              {post.job && (
                <div className="mt-3 p-3 bg-gray-50 rounded-lg">
                  <p className="text-sm font-medium text-gray-700">📋 Related Job: {post.job.title}</p>
                  <p className="text-sm text-gray-600">{post.job.location}</p>
                </div>
              )}
            </div>

            {/* Post Actions */}
            <div className="flex items-center space-x-6 pt-4 border-t border-gray-100">
              <button
                onClick={() => handleLike(post.id)}
                className={`flex items-center space-x-2 ${
                  post.liked ? 'text-red-600' : 'text-gray-500 hover:text-red-600'
                }`}
              >
                {post.liked ? (
                  <HeartSolidIcon className="h-5 w-5" />
                ) : (
                  <HeartIcon className="h-5 w-5" />
                )}
                <span className="text-sm">{post.likes || 0}</span>
              </button>
              
              <button className="flex items-center space-x-2 text-gray-500 hover:text-blue-600">
                <ChatBubbleLeftIcon className="h-5 w-5" />
                <span className="text-sm">{post.comments || 0}</span>
              </button>
              
              <button className="flex items-center space-x-2 text-gray-500 hover:text-green-600">
                <ShareIcon className="h-5 w-5" />
                <span className="text-sm">Share</span>
              </button>
            </div>
          </div>
        ))}
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
