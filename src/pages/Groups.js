import React, { useState } from 'react';
import { MagnifyingGlassIcon, PlusIcon, UserGroupIcon, CalendarIcon, MapPinIcon } from '@heroicons/react/24/outline';

export default function Groups() {
  const [searchTerm, setSearchTerm] = useState('');
  const [activeTab, setActiveTab] = useState('discover');

  const groups = [
    {
      id: 1,
      name: 'Software Engineering Alumni',
      description: 'Connect with fellow software engineers and share career opportunities, tech trends, and industry insights.',
      members: 342,
      category: 'Career',
      isJoined: false,
      image: 'SE',
      isPrivate: false,
      tags: ['Tech', 'Engineering', 'Career']
    },
    {
      id: 2,
      name: 'NYC Purple Knights Network',
      description: 'Local network for Purple Knights in the New York City area. Meetups, networking events, and job opportunities.',
      members: 128,
      category: 'Regional',
      isJoined: true,
      image: 'NYC',
      isPrivate: false,
      tags: ['NYC', 'Networking', 'Local']
    },
    {
      id: 3,
      name: 'Entrepreneurship & Startups',
      description: 'For alumni interested in entrepreneurship, startups, and innovation. Share resources and experiences.',
      members: 89,
      category: 'Interest',
      isJoined: false,
      image: 'ES',
      isPrivate: false,
      tags: ['Startup', 'Business', 'Innovation']
    },
    {
      id: 4,
      name: 'Class of 2020',
      description: 'Private group for the Class of 2020 graduates. Stay connected and share life updates.',
      members: 156,
      category: 'Class Year',
      isJoined: true,
      image: '20',
      isPrivate: true,
      tags: ['Class of 2020', 'Alumni']
    },
    {
      id: 5,
      name: 'Women in Tech',
      description: 'Supporting and empowering women in technology. Mentorship, career advice, and networking.',
      members: 203,
      category: 'Diversity',
      isJoined: false,
      image: 'WT',
      isPrivate: false,
      tags: ['Women', 'Tech', 'Diversity']
    },
    {
      id: 6,
      name: 'Marketing & Creative Professionals',
      description: 'Network for marketing, design, and creative professionals. Share portfolio work and opportunities.',
      members: 67,
      category: 'Career',
      isJoined: false,
      image: 'MC',
      isPrivate: false,
      tags: ['Marketing', 'Design', 'Creative']
    }
  ];

  const filteredGroups = groups.filter(group =>
    group.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    group.description.toLowerCase().includes(searchTerm.toLowerCase()) ||
    group.tags.some(tag => tag.toLowerCase().includes(searchTerm.toLowerCase()))
  );

  const joinedGroups = groups.filter(group => group.isJoined);
  const discoverGroups = groups.filter(group => !group.isJoined);

  const handleJoinGroup = (groupId) => {
    // In a real app, this would make an API call
    console.log('Joining group:', groupId);
  };

  const handleLeaveGroup = (groupId) => {
    // In a real app, this would make an API call
    console.log('Leaving group:', groupId);
  };

  const GroupCard = ({ group, showJoinButton = true }) => (
    <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
      <div className="flex items-start justify-between mb-4">
        <div className="flex items-start space-x-4">
          <div className="h-12 w-12 rounded-lg bg-purple-600 flex items-center justify-center flex-shrink-0">
            <span className="text-white font-bold text-lg">{group.image}</span>
          </div>
          <div className="flex-1">
            <div className="flex items-center space-x-2 mb-1">
              <h3 className="font-semibold text-gray-900">{group.name}</h3>
              {group.isPrivate && (
                <span className="px-2 py-1 text-xs bg-gray-100 text-gray-600 rounded-full">Private</span>
              )}
            </div>
            <p className="text-sm text-gray-500 mb-2">{group.category} • {group.members} members</p>
            <p className="text-gray-700 text-sm">{group.description}</p>
            <div className="flex flex-wrap gap-2 mt-3">
              {group.tags.map(tag => (
                <span key={tag} className="px-2 py-1 text-xs bg-purple-50 text-purple-700 rounded-full">
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>
      </div>
      
      <div className="flex items-center justify-between mt-4 pt-4 border-t border-gray-100">
        <div className="flex items-center space-x-4 text-sm text-gray-500">
          <div className="flex items-center space-x-1">
            <UserGroupIcon className="h-4 w-4" />
            <span>{group.members}</span>
          </div>
          <div className="flex items-center space-x-1">
            <CalendarIcon className="h-4 w-4" />
            <span>Active</span>
          </div>
        </div>
        
        {showJoinButton ? (
          <button
            onClick={() => handleJoinGroup(group.id)}
            className="px-4 py-2 bg-purple-600 text-white text-sm rounded-lg hover:bg-purple-700"
          >
            Join Group
          </button>
        ) : (
          <button
            onClick={() => handleLeaveGroup(group.id)}
            className="px-4 py-2 border border-gray-300 text-gray-700 text-sm rounded-lg hover:bg-gray-50"
          >
            Leave Group
          </button>
        )}
      </div>
    </div>
  );

  return (
    <div className="max-w-6xl mx-auto">
      {/* Header */}
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">Groups</h1>
        <p className="text-gray-600 mt-1">Connect with Purple Knights communities</p>
      </div>

      {/* Search and Create */}
      <div className="flex flex-col sm:flex-row gap-4 mb-6">
        <div className="flex-1 relative">
          <MagnifyingGlassIcon className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
          <input
            type="text"
            placeholder="Search groups..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
          />
        </div>
        <button className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 flex items-center space-x-2">
          <PlusIcon className="h-5 w-5" />
          <span>Create Group</span>
        </button>
      </div>

      {/* Tabs */}
      <div className="border-b border-gray-200 mb-6">
        <nav className="flex space-x-8">
          <button
            onClick={() => setActiveTab('discover')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'discover'
                ? 'border-purple-500 text-purple-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Discover Groups
          </button>
          <button
            onClick={() => setActiveTab('joined')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'joined'
                ? 'border-purple-500 text-purple-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            My Groups ({joinedGroups.length})
          </button>
        </nav>
      </div>

      {/* Groups Grid */}
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {activeTab === 'discover' ? (
          discoverGroups.length > 0 ? (
            discoverGroups.map(group => (
              <GroupCard key={group.id} group={group} showJoinButton={true} />
            ))
          ) : (
            <div className="col-span-full text-center py-12">
              <UserGroupIcon className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-medium text-gray-900 mb-2">No groups found</h3>
              <p className="text-gray-500">Try adjusting your search or create a new group</p>
            </div>
          )
        ) : (
          joinedGroups.length > 0 ? (
            joinedGroups.map(group => (
              <GroupCard key={group.id} group={group} showJoinButton={false} />
            ))
          ) : (
            <div className="col-span-full text-center py-12">
              <UserGroupIcon className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-medium text-gray-900 mb-2">No joined groups yet</h3>
              <p className="text-gray-500">Discover and join groups to connect with fellow Purple Knights</p>
            </div>
          )
        )}
      </div>
    </div>
  );
}
