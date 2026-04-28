import React, { useState } from 'react';
import { MagnifyingGlassIcon, PaperAirplaneIcon, PhoneIcon, VideoCameraIcon, EllipsisHorizontalIcon } from '@heroicons/react/24/outline';
import { PaperAirplaneIcon as PaperAirplaneSolidIcon } from '@heroicons/react/24/solid';

export default function Messages() {
  const [selectedConversation, setSelectedConversation] = useState(null);
  const [messageInput, setMessageInput] = useState('');
  const [searchTerm, setSearchTerm] = useState('');

  const conversations = [
    {
      id: 1,
      name: 'Sarah Johnson',
      avatar: 'SJ',
      role: 'Software Engineer at Google',
      lastMessage: 'That sounds great! Let me know when you\'re free to chat more.',
      time: '2 hours ago',
      unread: 2,
      online: true,
      messages: [
        { id: 1, sender: 'other', text: 'Hey! I saw your post about the software engineering position', time: '3 hours ago' },
        { id: 2, sender: 'me', text: 'Hi Sarah! Yes, I\'m really interested in learning more about it', time: '3 hours ago' },
        { id: 3, sender: 'other', text: 'That sounds great! Let me know when you\'re free to chat more.', time: '2 hours ago' }
      ]
    },
    {
      id: 2,
      name: 'Michael Chen',
      avatar: 'MC',
      role: 'Class of 2020',
      lastMessage: 'Thanks for connecting! Looking forward to collaborating.',
      time: '1 day ago',
      unread: 0,
      online: false,
      messages: [
        { id: 1, sender: 'other', text: 'Hi! I\'m Michael from the Class of 2020', time: '2 days ago' },
        { id: 2, sender: 'me', text: 'Nice to meet you Michael! What are you up to these days?', time: '2 days ago' },
        { id: 3, sender: 'other', text: 'I\'m working at a fintech startup. How about you?', time: '2 days ago' },
        { id: 4, sender: 'me', text: 'That\'s awesome! I\'m still in school, studying computer science', time: '1 day ago' },
        { id: 5, sender: 'other', text: 'Thanks for connecting! Looking forward to collaborating.', time: '1 day ago' }
      ]
    },
    {
      id: 3,
      name: 'Emily Rodriguez',
      avatar: 'ER',
      role: 'Product Manager at Microsoft',
      lastMessage: 'The meetup was amazing! Let\'s do it again soon.',
      time: '3 days ago',
      unread: 0,
      online: true,
      messages: [
        { id: 1, sender: 'other', text: 'Are you coming to the Seattle meetup next week?', time: '4 days ago' },
        { id: 2, sender: 'me', text: 'Yes! I\'ll be there. Looking forward to it!', time: '4 days ago' },
        { id: 3, sender: 'other', text: 'Great! See you there!', time: '3 days ago' },
        { id: 4, sender: 'me', text: 'The meetup was amazing! So many great connections', time: '3 days ago' },
        { id: 5, sender: 'other', text: 'The meetup was amazing! Let\'s do it again soon.', time: '3 days ago' }
      ]
    },
    {
      id: 4,
      name: 'David Kim',
      avatar: 'DK',
      role: 'Entrepreneur & Startup Founder',
      lastMessage: 'Would love to get your feedback on our new product',
      time: '1 week ago',
      unread: 1,
      online: false,
      messages: [
        { id: 1, sender: 'other', text: 'Hi! I heard you\'re interested in startups', time: '1 week ago' },
        { id: 2, sender: 'me', text: 'Yes! I\'m always excited to learn about new ventures', time: '1 week ago' },
        { id: 3, sender: 'other', text: 'Would love to get your feedback on our new product', time: '1 week ago' }
      ]
    },
    {
      id: 5,
      name: 'Lisa Thompson',
      avatar: 'LT',
      role: 'Marketing Director',
      lastMessage: 'Let me know if you need any career advice!',
      time: '2 weeks ago',
      unread: 0,
      online: true,
      messages: [
        { id: 1, sender: 'other', text: 'Welcome to the Purple Knights network!', time: '2 weeks ago' },
        { id: 2, sender: 'me', text: 'Thank you! Excited to be here', time: '2 weeks ago' },
        { id: 3, sender: 'other', text: 'Let me know if you need any career advice!', time: '2 weeks ago' }
      ]
    }
  ];

  const filteredConversations = conversations.filter(conv =>
    conv.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    conv.role.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const currentConversation = conversations.find(conv => conv.id === selectedConversation) || conversations[0];

  const handleSendMessage = () => {
    if (messageInput.trim() && selectedConversation) {
      // In a real app, this would send the message to the server
      console.log('Sending message:', messageInput);
      setMessageInput('');
    }
  };

  const formatTime = (timeString) => {
    return timeString;
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
          {filteredConversations.map(conversation => (
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
          ))}
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
              {currentConversation.messages.map(message => (
                <div
                  key={message.id}
                  className={`flex ${message.sender === 'me' ? 'justify-end' : 'justify-start'}`}
                >
                  <div
                    className={`max-w-xs lg:max-w-md px-4 py-2 rounded-lg ${
                      message.sender === 'me'
                        ? 'bg-purple-600 text-white'
                        : 'bg-gray-100 text-gray-800'
                    }`}
                  >
                    <p className="text-sm">{message.text}</p>
                    <p className={`text-xs mt-1 ${
                      message.sender === 'me' ? 'text-purple-200' : 'text-gray-500'
                    }`}>
                      {formatTime(message.time)}
                    </p>
                  </div>
                </div>
              ))}
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
