import React, { useState } from 'react';
import { Outlet, Link, useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';
import toast from 'react-hot-toast';
import {
  HomeIcon,
  UserIcon,
  BriefcaseIcon,
  DocumentTextIcon,
  ChatBubbleLeftRightIcon,
  ChartBarIcon,
  Cog6ToothIcon,
  ArrowRightOnRectangleIcon,
  BuildingOfficeIcon,
  AcademicCapIcon,
  UsersIcon,
  BellIcon,
  MagnifyingGlassIcon,
} from '@heroicons/react/24/outline';

const Layout = () => {
  const { user, profile, signOut, isAlumni, isEmployer, isMentor, isAdmin } = useAuth();
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const navigate = useNavigate();
  const location = useLocation();

  const handleSignOut = async () => {
    try {
      await signOut();
      toast.success('Signed out successfully');
      navigate('/login');
    } catch (error) {
      toast.error('Failed to sign out');
    }
  };

  const getNavigationItems = () => {
    const baseItems = [
      { name: 'Dashboard', href: '/dashboard', icon: HomeIcon, current: location.pathname === '/dashboard' },
      { name: 'Profile', href: '/profile', icon: UserIcon, current: location.pathname === '/profile' },
      { name: 'Jobs', href: '/jobs', icon: BriefcaseIcon, current: location.pathname.startsWith('/jobs') },
      { name: 'Applications', href: '/applications', icon: DocumentTextIcon, current: location.pathname === '/applications' },
      { name: 'Messages', href: '/messages', icon: ChatBubbleLeftRightIcon, current: location.pathname === '/messages' },
      { name: 'Career Progress', href: '/career-progress', icon: ChartBarIcon, current: location.pathname === '/career-progress' },
    ];

    if (isEmployer) {
      return [
        { name: 'Dashboard', href: '/employer-dashboard', icon: HomeIcon, current: location.pathname === '/employer-dashboard' },
        { name: 'Company Profile', href: '/employer-profile', icon: BuildingOfficeIcon, current: location.pathname === '/employer-profile' },
        { name: 'Post Job', href: '/post-job', icon: BriefcaseIcon, current: location.pathname === '/post-job' },
        { name: 'Candidates', href: '/pipeline', icon: UsersIcon, current: location.pathname === '/pipeline' },
        { name: 'Messages', href: '/messages', icon: ChatBubbleLeftRightIcon, current: location.pathname === '/messages' },
      ];
    }

    if (isMentor) {
      return [
        { name: 'Dashboard', href: '/mentor-dashboard', icon: HomeIcon, current: location.pathname === '/mentor-dashboard' },
        { name: 'Profile', href: '/mentor-profile', icon: UserIcon, current: location.pathname === '/mentor-profile' },
        { name: 'Mentees', href: '/mentees', icon: AcademicCapIcon, current: location.pathname === '/mentees' },
        { name: 'Messages', href: '/messages', icon: ChatBubbleLeftRightIcon, current: location.pathname === '/messages' },
      ];
    }

    if (isAdmin) {
      return [
        { name: 'Admin Dashboard', href: '/admin', icon: HomeIcon, current: location.pathname === '/admin' },
        { name: 'User Management', href: '/admin/users', icon: UsersIcon, current: location.pathname === '/admin/users' },
        { name: 'Job Moderation', href: '/admin/jobs', icon: BriefcaseIcon, current: location.pathname === '/admin/jobs' },
        { name: 'Alumni Verification', href: '/admin/alumni-verification', icon: UserIcon, current: location.pathname === '/admin/alumni-verification' },
        { name: 'Mentor Matching', href: '/admin/mentor-matching', icon: AcademicCapIcon, current: location.pathname === '/admin/mentor-matching' },
      ];
    }

    return baseItems;
  };

  const navigation = getNavigationItems();

  const getGreeting = () => {
    const hour = new Date().getHours();
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Mobile sidebar backdrop */}
      {sidebarOpen && (
        <div className="fixed inset-0 z-40 lg:hidden">
          <div className="fixed inset-0 bg-gray-600 bg-opacity-75" onClick={() => setSidebarOpen(false)} />
        </div>
      )}

      {/* Sidebar */}
      <div className={`
        fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-lg transform transition-transform duration-300 ease-in-out
        lg:translate-x-0 lg:fixed lg:inset-0
        ${sidebarOpen ? 'translate-x-0' : '-translate-x-full'}
      `}>
        <div className="flex items-center justify-between h-16 px-6 border-b border-gray-200">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <div className="h-8 w-8 rounded-lg bg-purple-600 flex items-center justify-center">
                <span className="text-white font-bold text-sm">PK</span>
              </div>
            </div>
            <div className="ml-3">
              <h1 className="text-lg font-semibold text-gray-900">Purple Knights</h1>
            </div>
          </div>
          <button
            onClick={() => setSidebarOpen(false)}
            className="lg:hidden"
          >
            <span className="sr-only">Close sidebar</span>
            <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <nav className="mt-6 px-3">
          <div className="space-y-1">
            {navigation.map((item) => (
              <Link
                key={item.name}
                to={item.href}
                className={`
                  group flex items-center px-3 py-2 text-sm font-medium rounded-md transition-colors whitespace-nowrap
                  ${item.current
                    ? 'bg-purple-100 text-purple-700'
                    : 'text-gray-700 hover:bg-gray-100 hover:text-gray-900'
                  }
                `}
              >
                <item.icon
                  className={`
                    mr-3 h-5 w-5 flex-shrink-0
                    ${item.current ? 'text-purple-500' : 'text-gray-400 group-hover:text-gray-500'}
                  `}
                  aria-hidden="true"
                />
                {item.name}
              </Link>
            ))}
          </div>
        </nav>

        <div className="absolute bottom-0 left-0 right-0 p-3 border-t border-gray-200">
          <button
            onClick={() => navigate('/settings')}
            className="w-full group flex items-center px-3 py-2 text-sm font-medium text-gray-700 rounded-md hover:bg-gray-100 hover:text-gray-900 whitespace-nowrap"
          >
            <Cog6ToothIcon className="mr-3 h-5 w-5 text-gray-400 group-hover:text-gray-500" />
            Settings
          </button>
          <button
            onClick={handleSignOut}
            className="w-full group flex items-center px-3 py-2 text-sm font-medium text-red-600 rounded-md hover:bg-red-50 whitespace-nowrap"
          >
            <ArrowRightOnRectangleIcon className="mr-3 h-5 w-5 text-red-500" />
            Sign Out
          </button>
        </div>
      </div>

      {/* Main content */}
      <div className="lg:ml-64">
        {/* Top bar */}
        <div className="bg-white shadow-sm border-b border-gray-200">
          <div className="flex items-center justify-between h-16 px-6">
            <div className="flex items-center">
              <button
                onClick={() => setSidebarOpen(true)}
                className="lg:hidden"
              >
                <span className="sr-only">Open sidebar</span>
                <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                </svg>
              </button>
              
              <div className="ml-4 lg:ml-0">
                <div className="flex items-center space-x-4">
                  <div className="relative">
                    <input
                      type="text"
                      placeholder="Search jobs, alumni..."
                      className="w-64 pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                    />
                    <MagnifyingGlassIcon className="absolute left-3 top-2.5 h-5 w-5 text-gray-400" />
                  </div>
                </div>
              </div>
            </div>

            <div className="flex items-center space-x-4">
              <button className="relative p-2 text-gray-600 hover:text-gray-900">
                <BellIcon className="h-6 w-6" />
                <span className="absolute top-0 right-0 h-2 w-2 bg-red-500 rounded-full"></span>
              </button>
              
              <div className="flex items-center space-x-3">
                <div className="text-right">
                  <div className="text-sm font-medium text-gray-900">
                    {getGreeting()}, {profile?.first_name || 'Purple Knight'}
                  </div>
                  <div className="text-xs text-gray-500">
                    {profile?.role === 'alumni' && `Class of ${profile?.graduation_year}`}
                    {profile?.role === 'employer' && profile?.company_name}
                    {profile?.role === 'mentor' && 'Mentor'}
                    {profile?.role === 'admin' && 'Administrator'}
                  </div>
                </div>
                <div className="h-8 w-8 rounded-full bg-purple-600 flex items-center justify-center">
                  <span className="text-white text-sm font-medium">
                    {profile?.first_name?.[0] || 'P'}{profile?.last_name?.[0] || 'K'}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Page content */}
        <main className="py-6">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <Outlet />
          </div>
        </main>
      </div>
    </div>
  );
};

export default Layout;
