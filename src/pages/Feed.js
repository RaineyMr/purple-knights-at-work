import React, { useState } from 'react';
import { HeartIcon, ChatBubbleLeftIcon, ShareIcon, PlusIcon } from '@heroicons/react/24/outline';
import { HeartIcon as HeartSolidIcon } from '@heroicons/react/24/solid';

export default function Feed() {
  const [posts, setPosts] = useState([
    {
      id: 1,
      author: 'Sarah Johnson',
      authorRole: 'Software Engineer at Google',
      authorAvatar: 'SJ',
      time: '2 hours ago',
      content: 'Just landed my dream job! Thanks to the Purple Knights network for all the support and connections. 🎉',
      likes: 24,
      comments: 8,
      liked: false,
      image: null
    },
    {
      id: 2,
      author: 'Michael Chen',
      authorRole: 'Class of 2020',
      authorAvatar: 'MC',
      time: '4 hours ago',
      content: 'Looking for junior developers at my startup! We\'re building something amazing in the fintech space. DM me if you\'re interested!',
      likes: 15,
      comments: 12,
      liked: true,
      image: null
    },
    {
      id: 3,
      author: 'Emily Rodriguez',
      authorRole: 'Product Manager at Microsoft',
      authorAvatar: 'ER',
      time: '6 hours ago',
      content: 'Great meetup with fellow Purple Knights in Seattle! The power of our network never ceases to amaze me. #PurpleKnights #Networking',
      likes: 32,
      comments: 6,
      liked: false,
      image: null
    }
  ]);

  const [newPost, setNewPost] = useState('');
  const [showCreatePost, setShowCreatePost] = useState(false);

  const handleLike = (postId) => {
    setPosts(posts.map(post => 
      post.id === postId 
        ? { ...post, liked: !post.liked, likes: post.liked ? post.likes - 1 : post.likes + 1 }
        : post
    ));
  };

  const handleCreatePost = () => {
    if (newPost.trim()) {
      const post = {
        id: posts.length + 1,
        author: 'You',
        authorRole: 'Current Student',
        authorAvatar: 'Y',
        time: 'Just now',
        content: newPost,
        likes: 0,
        comments: 0,
        liked: false,
        image: null
      };
      setPosts([post, ...posts]);
      setNewPost('');
      setShowCreatePost(false);
    }
  };

  return (
    <div className="max-w-2xl mx-auto">
      {/* Create Post Section */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
        <div className="flex items-start space-x-3">
          <div className="h-10 w-10 rounded-full bg-purple-600 flex items-center justify-center">
            <span className="text-white font-medium">Y</span>
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

      {/* Feed Posts */}
      <div className="space-y-4">
        {posts.map(post => (
          <div key={post.id} className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            {/* Post Header */}
            <div className="flex items-start justify-between mb-4">
              <div className="flex items-start space-x-3">
                <div className="h-10 w-10 rounded-full bg-purple-600 flex items-center justify-center">
                  <span className="text-white font-medium">{post.authorAvatar}</span>
                </div>
                <div>
                  <h3 className="font-semibold text-gray-900">{post.author}</h3>
                  <p className="text-sm text-gray-500">{post.authorRole}</p>
                  <p className="text-xs text-gray-400 mt-1">{post.time}</p>
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
              {post.image && (
                <div className="mt-3 rounded-lg overflow-hidden">
                  <img src={post.image} alt="Post image" className="w-full" />
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
                <span className="text-sm">{post.likes}</span>
              </button>
              
              <button className="flex items-center space-x-2 text-gray-500 hover:text-blue-600">
                <ChatBubbleLeftIcon className="h-5 w-5" />
                <span className="text-sm">{post.comments}</span>
              </button>
              
              <button className="flex items-center space-x-2 text-gray-500 hover:text-green-600">
                <ShareIcon className="h-5 w-5" />
                <span className="text-sm">Share</span>
              </button>
            </div>
          </div>
        ))}
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
