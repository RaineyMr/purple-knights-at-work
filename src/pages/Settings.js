import React, { useState } from 'react';
import { 
  UserIcon, 
  BellIcon, 
  ShieldCheckIcon, 
  CreditCardIcon,
  GlobeAltIcon,
  QuestionMarkCircleIcon,
  ArrowRightOnRectangleIcon,
  TrashIcon
} from '@heroicons/react/24/outline';

export default function Settings() {
  const [activeSection, setActiveSection] = useState('profile');
  const [notifications, setNotifications] = useState({
    email: true,
    push: true,
    jobAlerts: true,
    messages: true,
    groups: false,
    events: true
  });
  const [privacy, setPrivacy] = useState({
    profileVisibility: 'public',
    showEmail: false,
    showPhone: false,
    allowMessages: 'everyone'
  });

  const handleNotificationChange = (key) => {
    setNotifications(prev => ({
      ...prev,
      [key]: !prev[key]
    }));
  };

  const handlePrivacyChange = (key, value) => {
    setPrivacy(prev => ({
      ...prev,
      [key]: value
    }));
  };

  const sections = [
    { id: 'profile', label: 'Profile Settings', icon: UserIcon },
    { id: 'notifications', label: 'Notifications', icon: BellIcon },
    { id: 'privacy', label: 'Privacy & Security', icon: ShieldCheckIcon },
    { id: 'account', label: 'Account Management', icon: CreditCardIcon },
    { id: 'preferences', label: 'Preferences', icon: GlobeAltIcon },
    { id: 'help', label: 'Help & Support', icon: QuestionMarkCircleIcon }
  ];

  const SectionButton = ({ id, label, icon: Icon }) => (
    <button
      onClick={() => setActiveSection(id)}
      className={`w-full flex items-center space-x-3 px-4 py-3 rounded-lg font-medium transition-colors text-left ${
        activeSection === id
          ? 'bg-purple-100 text-purple-700'
          : 'text-gray-700 hover:bg-gray-100'
      }`}
    >
      <Icon className="h-5 w-5" />
      <span>{label}</span>
    </button>
  );

  return (
    <div className="max-w-6xl mx-auto">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Settings</h1>
      
      <div className="flex gap-6">
        {/* Sidebar */}
        <div className="w-64 flex-shrink-0">
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-2">
            {sections.map(section => (
              <SectionButton key={section.id} {...section} />
            ))}
          </div>
        </div>

        {/* Content */}
        <div className="flex-1">
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            {activeSection === 'profile' && (
              <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-900">Profile Settings</h2>
                
                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      First Name
                    </label>
                    <input
                      type="text"
                      defaultValue="Alex"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                    />
                  </div>
                  
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Last Name
                    </label>
                    <input
                      type="text"
                      defaultValue="Thompson"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                    />
                  </div>
                  
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Email
                    </label>
                    <input
                      type="email"
                      defaultValue="alex.thompson@purpleknights.edu"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                    />
                  </div>
                  
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Phone Number
                    </label>
                    <input
                      type="tel"
                      defaultValue="(555) 123-4567"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                    />
                  </div>
                  
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Bio
                    </label>
                    <textarea
                      rows={4}
                      defaultValue="Passionate computer science student with a focus on machine learning and web development."
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                    />
                  </div>
                </div>
                
                <div className="flex justify-end space-x-3">
                  <button className="px-4 py-2 text-gray-600 hover:text-gray-800">
                    Cancel
                  </button>
                  <button className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700">
                    Save Changes
                  </button>
                </div>
              </div>
            )}

            {activeSection === 'notifications' && (
              <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-900">Notification Preferences</h2>
                
                <div className="space-y-4">
                  <div className="flex items-center justify-between py-3">
                    <div>
                      <h3 className="font-medium text-gray-900">Email Notifications</h3>
                      <p className="text-sm text-gray-500">Receive notifications via email</p>
                    </div>
                    <button
                      onClick={() => handleNotificationChange('email')}
                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                        notifications.email ? 'bg-purple-600' : 'bg-gray-200'
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                          notifications.email ? 'translate-x-6' : 'translate-x-1'
                        }`}
                      />
                    </button>
                  </div>
                  
                  <div className="flex items-center justify-between py-3">
                    <div>
                      <h3 className="font-medium text-gray-900">Push Notifications</h3>
                      <p className="text-sm text-gray-500">Receive push notifications in your browser</p>
                    </div>
                    <button
                      onClick={() => handleNotificationChange('push')}
                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                        notifications.push ? 'bg-purple-600' : 'bg-gray-200'
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                          notifications.push ? 'translate-x-6' : 'translate-x-1'
                        }`}
                      />
                    </button>
                  </div>
                  
                  <div className="flex items-center justify-between py-3">
                    <div>
                      <h3 className="font-medium text-gray-900">Job Alerts</h3>
                      <p className="text-sm text-gray-500">Get notified about new job opportunities</p>
                    </div>
                    <button
                      onClick={() => handleNotificationChange('jobAlerts')}
                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                        notifications.jobAlerts ? 'bg-purple-600' : 'bg-gray-200'
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                          notifications.jobAlerts ? 'translate-x-6' : 'translate-x-1'
                        }`}
                      />
                    </button>
                  </div>
                  
                  <div className="flex items-center justify-between py-3">
                    <div>
                      <h3 className="font-medium text-gray-900">Messages</h3>
                      <p className="text-sm text-gray-500">Get notified when someone messages you</p>
                    </div>
                    <button
                      onClick={() => handleNotificationChange('messages')}
                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                        notifications.messages ? 'bg-purple-600' : 'bg-gray-200'
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                          notifications.messages ? 'translate-x-6' : 'translate-x-1'
                        }`}
                      />
                    </button>
                  </div>
                  
                  <div className="flex items-center justify-between py-3">
                    <div>
                      <h3 className="font-medium text-gray-900">Group Activity</h3>
                      <p className="text-sm text-gray-500">Get notified about group updates</p>
                    </div>
                    <button
                      onClick={() => handleNotificationChange('groups')}
                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                        notifications.groups ? 'bg-purple-600' : 'bg-gray-200'
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                          notifications.groups ? 'translate-x-6' : 'translate-x-1'
                        }`}
                      />
                    </button>
                  </div>
                  
                  <div className="flex items-center justify-between py-3">
                    <div>
                      <h3 className="font-medium text-gray-900">Events</h3>
                      <p className="text-sm text-gray-500">Get notified about upcoming events</p>
                    </div>
                    <button
                      onClick={() => handleNotificationChange('events')}
                      className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                        notifications.events ? 'bg-purple-600' : 'bg-gray-200'
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                          notifications.events ? 'translate-x-6' : 'translate-x-1'
                        }`}
                      />
                    </button>
                  </div>
                </div>
              </div>
            )}

            {activeSection === 'privacy' && (
              <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-900">Privacy & Security</h2>
                
                <div className="space-y-6">
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Profile Visibility</h3>
                    <div className="space-y-2">
                      {['public', 'purpleknights', 'private'].map(option => (
                        <label key={option} className="flex items-center space-x-3">
                          <input
                            type="radio"
                            name="profileVisibility"
                            value={option}
                            checked={privacy.profileVisibility === option}
                            onChange={(e) => handlePrivacyChange('profileVisibility', e.target.value)}
                            className="text-purple-600 focus:ring-purple-500"
                          />
                          <span className="text-gray-700">
                            {option === 'public' && 'Public - Anyone can view your profile'}
                            {option === 'purpleknights' && 'Purple Knights Only - Only verified members can view your profile'}
                            {option === 'private' && 'Private - Only people you connect with can view your profile'}
                          </span>
                        </label>
                      ))}
                    </div>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Contact Information</h3>
                    <div className="space-y-3">
                      <div className="flex items-center justify-between">
                        <span className="text-gray-700">Show email address</span>
                        <button
                          onClick={() => handlePrivacyChange('showEmail', !privacy.showEmail)}
                          className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                            privacy.showEmail ? 'bg-purple-600' : 'bg-gray-200'
                          }`}
                        >
                          <span
                            className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                              privacy.showEmail ? 'translate-x-6' : 'translate-x-1'
                            }`}
                          />
                        </button>
                      </div>
                      
                      <div className="flex items-center justify-between">
                        <span className="text-gray-700">Show phone number</span>
                        <button
                          onClick={() => handlePrivacyChange('showPhone', !privacy.showPhone)}
                          className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                            privacy.showPhone ? 'bg-purple-600' : 'bg-gray-200'
                          }`}
                        >
                          <span
                            className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                              privacy.showPhone ? 'translate-x-6' : 'translate-x-1'
                            }`}
                          />
                        </button>
                      </div>
                    </div>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Messaging</h3>
                    <div className="space-y-2">
                      {['everyone', 'purpleknights', 'connections'].map(option => (
                        <label key={option} className="flex items-center space-x-3">
                          <input
                            type="radio"
                            name="allowMessages"
                            value={option}
                            checked={privacy.allowMessages === option}
                            onChange={(e) => handlePrivacyChange('allowMessages', e.target.value)}
                            className="text-purple-600 focus:ring-purple-500"
                          />
                          <span className="text-gray-700">
                            {option === 'everyone' && 'Everyone can message you'}
                            {option === 'purpleknights' && 'Only Purple Knights members can message you'}
                            {option === 'connections' && 'Only your connections can message you'}
                          </span>
                        </label>
                      ))}
                    </div>
                  </div>
                  
                  <div className="pt-6 border-t border-gray-200">
                    <h3 className="font-medium text-gray-900 mb-3">Password</h3>
                    <button className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700">
                      Change Password
                    </button>
                  </div>
                  
                  <div className="pt-6 border-t border-gray-200">
                    <h3 className="font-medium text-gray-900 mb-3">Two-Factor Authentication</h3>
                    <p className="text-sm text-gray-500 mb-3">Add an extra layer of security to your account</p>
                    <button className="px-4 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50">
                      Enable 2FA
                    </button>
                  </div>
                </div>
              </div>
            )}

            {activeSection === 'account' && (
              <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-900">Account Management</h2>
                
                <div className="space-y-6">
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Subscription</h3>
                    <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
                      <div className="flex items-center justify-between">
                        <div>
                          <h4 className="font-medium text-purple-900">Purple Knights Premium</h4>
                          <p className="text-sm text-purple-700">Free - Student Account</p>
                        </div>
                        <button className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700">
                          Upgrade
                        </button>
                      </div>
                    </div>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Data & Storage</h3>
                    <div className="space-y-3">
                      <div className="flex items-center justify-between py-2">
                        <span className="text-gray-700">Download your data</span>
                        <button className="px-3 py-1 text-purple-600 hover:text-purple-700 text-sm">
                          Request
                        </button>
                      </div>
                      <div className="flex items-center justify-between py-2">
                        <span className="text-gray-700">Clear cache</span>
                        <button className="px-3 py-1 text-purple-600 hover:text-purple-700 text-sm">
                          Clear
                        </button>
                      </div>
                    </div>
                  </div>
                  
                  <div className="pt-6 border-t border-gray-200">
                    <h3 className="font-medium text-red-600 mb-3">Danger Zone</h3>
                    <div className="space-y-3">
                      <button className="px-4 py-2 border border-red-300 text-red-600 rounded-lg hover:bg-red-50 flex items-center space-x-2">
                        <ArrowRightOnRectangleIcon className="h-4 w-4" />
                        <span>Sign Out</span>
                      </button>
                      <button className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 flex items-center space-x-2">
                        <TrashIcon className="h-4 w-4" />
                        <span>Delete Account</span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            )}

            {activeSection === 'preferences' && (
              <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-900">Preferences</h2>
                
                <div className="space-y-6">
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Language</h3>
                    <select className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500">
                      <option>English</option>
                      <option>Spanish</option>
                      <option>French</option>
                      <option>German</option>
                    </select>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Timezone</h3>
                    <select className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500">
                      <option>Eastern Time (ET)</option>
                      <option>Central Time (CT)</option>
                      <option>Mountain Time (MT)</option>
                      <option>Pacific Time (PT)</option>
                    </select>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Theme</h3>
                    <div className="space-y-2">
                      {['light', 'dark', 'auto'].map(theme => (
                        <label key={theme} className="flex items-center space-x-3">
                          <input
                            type="radio"
                            name="theme"
                            value={theme}
                            defaultChecked={theme === 'light'}
                            className="text-purple-600 focus:ring-purple-500"
                          />
                          <span className="text-gray-700 capitalize">
                            {theme === 'light' && 'Light Mode'}
                            {theme === 'dark' && 'Dark Mode'}
                            {theme === 'auto' && 'Auto (System Preference)'}
                          </span>
                        </label>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            )}

            {activeSection === 'help' && (
              <div className="space-y-6">
                <h2 className="text-xl font-semibold text-gray-900">Help & Support</h2>
                
                <div className="space-y-6">
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Frequently Asked Questions</h3>
                    <div className="space-y-3">
                      <div className="p-4 bg-gray-50 rounded-lg">
                        <h4 className="font-medium text-gray-900 mb-2">How do I update my profile?</h4>
                        <p className="text-sm text-gray-600">Go to Settings > Profile Settings to update your personal information.</p>
                      </div>
                      <div className="p-4 bg-gray-50 rounded-lg">
                        <h4 className="font-medium text-gray-900 mb-2">How do I change my password?</h4>
                        <p className="text-sm text-gray-600">Navigate to Settings > Privacy & Security and click "Change Password".</p>
                      </div>
                      <div className="p-4 bg-gray-50 rounded-lg">
                        <h4 className="font-medium text-gray-900 mb-2">How do I report inappropriate content?</h4>
                        <p className="text-sm text-gray-600">Use the report button on any post or message, or contact support directly.</p>
                      </div>
                    </div>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Contact Support</h3>
                    <div className="space-y-3">
                      <button className="w-full px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700">
                        Email Support
                      </button>
                      <button className="w-full px-4 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50">
                        Schedule a Call
                      </button>
                    </div>
                  </div>
                  
                  <div>
                    <h3 className="font-medium text-gray-900 mb-3">Resources</h3>
                    <div className="space-y-2">
                      <a href="#" className="block text-purple-600 hover:text-purple-700">User Guide</a>
                      <a href="#" className="block text-purple-600 hover:text-purple-700">Community Guidelines</a>
                      <a href="#" className="block text-purple-600 hover:text-purple-700">Terms of Service</a>
                      <a href="#" className="block text-purple-600 hover:text-purple-700">Privacy Policy</a>
                    </div>
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
