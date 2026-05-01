import React, { useState, useEffect } from 'react';
import { MagnifyingGlassIcon, PaperAirplaneIcon, PhoneIcon, VideoCameraIcon, EllipsisHorizontalIcon, ChatBubbleLeftIcon } from '@heroicons/react/24/outline';
import { PaperAirplaneIcon as PaperAirplaneSolidIcon } from '@heroicons/react/24/solid';
import { useAuth } from '../hooks/useAuth';
import { db, supabase } from '../lib/supabase';
import { useAnalytics } from '../hooks/useAnalytics';

export default function Messages() {
  const { user } = useAuth();
  const analytics = useAnalytics();
  const [selectedConversation, setSelectedConversation] = useState(null);
  const [messageInput, setMessageInput] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const [conversations, setConversations] = useState([]);
  const [messages, setMessages] = useState([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    let channel;
    
    if (user) {
      fetchConversations();
      channel = setupRealtimeSubscription();
    }
    
    return () => {
      if (channel) {
        channel.unsubscribe();
      }
    };
  }, [user]);

  useEffect(() => {
    if (selectedConversation) {
      fetchMessages(selectedConversation);
    }
  }, [selectedConversation]);

  const fetchConversations = async () => {
    try {
      setLoading(true);
      
      // Mock conversation data for demo purposes since database schema doesn't match
      const mockConversations = [
        {
          id: 'demo-user-1',
          name: 'Sarah Johnson',
          avatar: 'SJ',
          role: 'Software Engineer at Tech Corp',
          lastMessage: 'Hey! Are you available for a quick call this afternoon?',
          time: '2:30 PM',
          unread: 2,
          online: true,
          messages: []
        },
        {
          id: 'demo-user-2',
          name: 'Michael Chen',
          avatar: 'MC',
          role: 'Product Manager at StartupXYZ',
          lastMessage: 'Thanks for your help with the project!',
          time: '11:45 AM',
          unread: 0,
          online: false,
          messages: []
        },
        {
          id: 'demo-user-3',
          name: 'Emily Davis',
          avatar: 'ED',
          role: 'UX Designer',
          lastMessage: 'I reviewed your portfolio, looks great!',
          time: 'Yesterday',
          unread: 1,
          online: true,
          messages: []
        }
      ];
      
      setConversations(mockConversations);
    } catch (error) {
      console.error('Error fetching conversations:', error);
    } finally {
      setLoading(false);
    }
  };

  const fetchMessages = async (conversationId) => {
    try {
      // Mock messages for demo purposes
      const mockMessages = [
        {
          id: '1',
          body: 'Hey! How are you doing?',
          created_at: new Date(Date.now() - 3600000).toISOString(),
          from_user_id: conversationId,
          to_user_id: user.id
        },
        {
          id: '2',
          body: 'I\'m doing great! Just working on some new features.',
          created_at: new Date(Date.now() - 3000000).toISOString(),
          from_user_id: user.id,
          to_user_id: conversationId
        },
        {
          id: '3',
          body: 'That\'s awesome! What are you working on?',
          created_at: new Date(Date.now() - 2400000).toISOString(),
          from_user_id: conversationId,
          to_user_id: user.id
        }
      ];
      
      setMessages(mockMessages);
    } catch (error) {
      console.error('Error fetching messages:', error);
    }
  };

  const setupRealtimeSubscription = () => {
    // Subscribe to new messages with unique channel name
    const channel = supabase
      .channel(`messages_chat_${user.id}`)
      .on(
        'postgres_changes',
        {
          event: 'INSERT',
          schema: 'public',
          table: 'messages',
          filter: `to_user_id=eq.${user.id}`
        },
        (payload) => {
          console.log('New message received:', payload);
          fetchConversations();
          if (selectedConversation) {
            fetchMessages(selectedConversation);
          }
        }
      )
      .subscribe((status) => {
        if (status === 'SUBSCRIBED') {
          console.log('Realtime subscription established');
        } else if (status === 'CHANNEL_ERROR') {
          console.error('Realtime subscription error');
        }
      });

    return channel;
  };

  const filteredConversations = conversations.filter(conv =>
    conv.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    conv.role.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const currentConversation = conversations.find(conv => conv.id === selectedConversation) || conversations[0];

  const handleSendMessage = async () => {
    if (messageInput.trim() && selectedConversation && user) {
      try {
        // Mock sending a message
        const newMessage = {
          id: Date.now().toString(),
          body: messageInput.trim(),
          created_at: new Date().toISOString(),
          from_user_id: user.id,
          to_user_id: selectedConversation
        };
        
        // Add message to current messages
        setMessages(prev => [...prev, newMessage]);
        
        // Clear input and refresh conversations
        setMessageInput('');
        fetchConversations();
      } catch (error) {
        console.error('Error sending message:', error);
      }
    }
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

  return (
    <div className="h-[calc(100vh-8rem)] flex">
      {/* Conversations List */}
      <div className="w-80 border-r border-gray-200 bg-white">
        <div className="p-4 border-b border-gray-200">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Messages</h2>
          <div className="relative">
            <MagnifyingGlassIcon className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
            <input
              type="text"
              placeholder="Search conversations..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
            />
          </div>
        </div>

        <div className="overflow-y-auto h-[calc(100%-8rem)]">
          {loading ? (
            <div className="p-4 text-center">
              <div className="inline-block animate-spin rounded-full h-6 w-6 border-b-2 border-purple-600"></div>
              <p className="mt-2 text-sm text-gray-500">Loading conversations...</p>
            </div>
          ) : filteredConversations.length === 0 ? (
            <div className="p-4 text-center">
              <p className="text-gray-500">No conversations found</p>
            </div>
          ) : (
            filteredConversations.map(conversation => (
            <div
              key={conversation.id}
              onClick={() => setSelectedConversation(conversation.id)}
              className={`p-4 border-b border-gray-100 cursor-pointer hover:bg-gray-50 ${
                selectedConversation === conversation.id ? 'bg-purple-50 border-l-4 border-l-purple-600' : ''
              }`}
            >
              <div className="flex items-start space-x-3">
                <div className="relative">
                  <div className="h-12 w-12 rounded-full bg-purple-600 flex items-center justify-center">
                    <span className="text-white font-medium">{conversation.avatar}</span>
                  </div>
                  {conversation.online && (
                    <div className="absolute bottom-0 right-0 h-3 w-3 bg-green-500 rounded-full border-2 border-white"></div>
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between mb-1">
                    <h3 className="font-semibold text-gray-900 truncate">{conversation.name}</h3>
                    <span className="text-xs text-gray-500">{conversation.time}</span>
                  </div>
                  <p className="text-sm text-gray-500 truncate">{conversation.role}</p>
                  <p className="text-sm text-gray-600 truncate mt-1">{conversation.lastMessage}</p>
                </div>
                {conversation.unread > 0 && (
                  <div className="h-6 w-6 bg-purple-600 rounded-full flex items-center justify-center">
                    <span className="text-white text-xs font-medium">{conversation.unread}</span>
                  </div>
                )}
              </div>
            </div>
            ))
          )}
        </div>
      </div>

      {/* Chat Area */}
      <div className="flex-1 flex flex-col bg-white">
        {currentConversation ? (
          <>
            {/* Chat Header */}
            <div className="p-4 border-b border-gray-200 bg-white">
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-3">
                  <div className="relative">
                    <div className="h-10 w-10 rounded-full bg-purple-600 flex items-center justify-center">
                      <span className="text-white font-medium">{currentConversation.avatar}</span>
                    </div>
                    {currentConversation.online && (
                      <div className="absolute bottom-0 right-0 h-3 w-3 bg-green-500 rounded-full border-2 border-white"></div>
                    )}
                  </div>
                  <div>
                    <h3 className="font-semibold text-gray-900">{currentConversation.name}</h3>
                    <p className="text-sm text-gray-500">
                      {currentConversation.online ? 'Active now' : 'Offline'} • {currentConversation.role}
                    </p>
                  </div>
                </div>
                <div className="flex items-center space-x-2">
                  <button className="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg">
                    <PhoneIcon className="h-5 w-5" />
                  </button>
                  <button className="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg">
                    <VideoCameraIcon className="h-5 w-5" />
                  </button>
                  <button className="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg">
                    <EllipsisHorizontalIcon className="h-5 w-5" />
                  </button>
                </div>
              </div>
            </div>

            {/* Messages */}
            <div className="flex-1 overflow-y-auto p-4 space-y-4">
              {messages.length === 0 ? (
                <div className="text-center py-8">
                  <p className="text-gray-500">No messages yet. Start the conversation!</p>
                </div>
              ) : (
                messages.map(message => (
                  <div
                    key={message.id}
                    className={`flex ${message.from_user_id === user.id ? 'justify-end' : 'justify-start'}`}
                  >
                    <div
                      className={`max-w-xs lg:max-w-md px-4 py-2 rounded-lg ${
                        message.from_user_id === user.id
                          ? 'bg-purple-600 text-white'
                          : 'bg-gray-100 text-gray-800'
                      }`}
                    >
                      <p className="text-sm">{message.body}</p>
                      <p className={`text-xs mt-1 ${
                        message.from_user_id === user.id ? 'text-purple-200' : 'text-gray-500'
                      }`}>
                        {formatTime(message.created_at)}
                      </p>
                    </div>
                  </div>
                ))
              )}
            </div>

            {/* Message Input */}
            <div className="p-4 border-t border-gray-200 bg-white">
              <div className="flex items-center space-x-3">
                <input
                  type="text"
                  value={messageInput}
                  onChange={(e) => setMessageInput(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleSendMessage()}
                  placeholder="Type a message..."
                  className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                />
                <button
                  onClick={handleSendMessage}
                  className="p-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 disabled:opacity-50"
                  disabled={!messageInput.trim()}
                >
                  <PaperAirplaneIcon className="h-5 w-5" />
                </button>
              </div>
            </div>
          </>
        ) : (
          <div className="flex-1 flex items-center justify-center">
            <div className="text-center">
              <div className="h-16 w-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <ChatBubbleLeftIcon className="h-8 w-8 text-gray-400" />
              </div>
              <h3 className="text-lg font-medium text-gray-900 mb-2">Select a conversation</h3>
              <p className="text-gray-500">Choose a conversation from the list to start messaging</p>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
