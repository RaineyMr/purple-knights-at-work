import React, { useState, useEffect } from 'react';
import { adminUserManagement, userOperations } from '../../lib/admin';

export default function UserManagement() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);
  const [newPassword, setNewPassword] = useState('');
  const [message, setMessage] = useState('');
  const [activeTab, setActiveTab] = useState('list');

  useEffect(() => {
    fetchUsers();
  }, []);

  const fetchUsers = async () => {
    setLoading(true);
    try {
      const userData = await adminUserManagement.getAllUsers();
      setUsers(userData.users || []);
    } catch (error) {
      setMessage('Error fetching users: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleUpdatePassword = async (userId) => {
    if (!newPassword) {
      setMessage('Please enter a new password');
      return;
    }

    setLoading(true);
    try {
      await adminUserManagement.updateUserPassword(userId, newPassword);
      setMessage('Password updated successfully!');
      setNewPassword('');
    } catch (error) {
      setMessage('Error updating password: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleUpdateKevinPassword = async () => {
    setLoading(true);
    try {
      await userOperations.updateKevinPassword(newPassword || 'PK123');
      setMessage('Kevin\'s password updated successfully!');
      setNewPassword('');
    } catch (error) {
      setMessage('Error updating Kevin\'s password: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleSeedDemoUser = async () => {
    setLoading(true);
    try {
      await userOperations.seedDemoUser();
      setMessage('Demo user test@staug.com seeded successfully!');
      fetchUsers(); // Refresh user list
    } catch (error) {
      setMessage('Error seeding demo user: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleUpdateDemoUserPassword = async () => {
    setLoading(true);
    try {
      await userOperations.updateDemoUserPassword(newPassword || 'M0llySplaind#1');
      setMessage('Demo user password updated successfully!');
      setNewPassword('');
    } catch (error) {
      setMessage('Error updating demo user password: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleGetDemoUserInfo = async () => {
    setLoading(true);
    try {
      const demoInfo = await userOperations.getDemoUserInfo();
      setSelectedUser(demoInfo);
      setActiveTab('details');
      setMessage('Demo user information retrieved successfully!');
    } catch (error) {
      setMessage('Error fetching demo user info: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleDeleteUser = async (userId) => {
    if (!confirm('Are you sure you want to delete this user? This action cannot be undone.')) {
      return;
    }

    setLoading(true);
    try {
      await adminUserManagement.deleteUser(userId);
      setMessage('User deleted successfully!');
      fetchUsers();
    } catch (error) {
      setMessage('Error deleting user: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleResetPassword = async (email) => {
    setLoading(true);
    try {
      await adminUserManagement.resetUserPassword(email);
      setMessage('Password reset email sent successfully!');
    } catch (error) {
      setMessage('Error sending password reset: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleGetKevinInfo = async () => {
    setLoading(true);
    try {
      const kevinInfo = await userOperations.getKevinInfo();
      setSelectedUser(kevinInfo);
      setActiveTab('details');
      setMessage('Kevin information retrieved successfully!');
    } catch (error) {
      setMessage('Error fetching Kevin info: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-6xl mx-auto p-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">User Management</h1>

      {/* Message Display */}
      {message && (
        <div className={`mb-6 p-4 rounded-lg ${
          message.includes('Error') ? 'bg-red-100 text-red-700' : 'bg-green-100 text-green-700'
        }`}>
          {message}
        </div>
      )}

      {/* Tab Navigation */}
      <div className="border-b border-gray-200 mb-6">
        <nav className="-mb-px flex space-x-8">
          <button
            onClick={() => setActiveTab('list')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'list'
                ? 'border-blue-500 text-blue-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            User List
          </button>
          <button
            onClick={() => setActiveTab('kevin')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'kevin'
                ? 'border-blue-500 text-blue-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Kevin Management
          </button>
          <button
            onClick={() => setActiveTab('demo')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'demo'
                ? 'border-blue-500 text-blue-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Demo User
          </button>
          {selectedUser && (
            <button
              onClick={() => setActiveTab('details')}
              className={`py-2 px-1 border-b-2 font-medium text-sm ${
                activeTab === 'details'
                  ? 'border-blue-500 text-blue-600'
                  : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
              }`}
            >
              User Details
            </button>
          )}
        </nav>
      </div>

      {/* User List Tab */}
      {activeTab === 'list' && (
        <div className="bg-white rounded-lg shadow-md">
          <div className="p-6 border-b border-gray-200">
            <h2 className="text-xl font-semibold text-gray-900">All Users</h2>
          </div>
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    User
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Email
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Created
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Last Sign In
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Actions
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {loading ? (
                  <tr>
                    <td colSpan="5" className="px-6 py-4 text-center">
                      <div className="inline-block animate-spin rounded-full h-6 w-6 border-b-2 border-blue-600"></div>
                    </td>
                  </tr>
                ) : users.length === 0 ? (
                  <tr>
                    <td colSpan="5" className="px-6 py-4 text-center text-gray-500">
                      No users found
                    </td>
                  </tr>
                ) : (
                  users.map((user) => (
                    <tr key={user.id}>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="flex items-center">
                          <div className="flex-shrink-0 h-10 w-10">
                            <div className="h-10 w-10 rounded-full bg-gray-300 flex items-center justify-center">
                              <span className="text-sm font-medium text-gray-700">
                                {user.email?.charAt(0).toUpperCase()}
                              </span>
                            </div>
                          </div>
                          <div className="ml-4">
                            <div className="text-sm font-medium text-gray-900">
                              {user.user_metadata?.first_name || 'Unknown'} {user.user_metadata?.last_name || ''}
                            </div>
                          </div>
                        </div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {user.email}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {new Date(user.created_at).toLocaleDateString()}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {user.last_sign_in_at ? new Date(user.last_sign_in_at).toLocaleDateString() : 'Never'}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div className="flex space-x-2">
                          <button
                            onClick={() => {
                              setSelectedUser(user);
                              setActiveTab('details');
                            }}
                            className="text-blue-600 hover:text-blue-900"
                          >
                            View
                          </button>
                          <button
                            onClick={() => handleResetPassword(user.email)}
                            className="text-green-600 hover:text-green-900"
                          >
                            Reset
                          </button>
                          <button
                            onClick={() => handleDeleteUser(user.id)}
                            className="text-red-600 hover:text-red-900"
                          >
                            Delete
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {/* Demo User Management Tab */}
      {activeTab === 'demo' && (
        <div className="space-y-6">
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Demo User (test@staug.com) Management</h2>
            
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  New Password (optional, defaults to "M0llySplaind#1")
                </label>
                <input
                  type="password"
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  placeholder="Enter new password or leave empty for default"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>
              
              <div className="flex space-x-4">
                <button
                  onClick={handleSeedDemoUser}
                  disabled={loading}
                  className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:opacity-50"
                >
                  {loading ? 'Seeding...' : 'Seed Demo User'}
                </button>
                
                <button
                  onClick={handleUpdateDemoUserPassword}
                  disabled={loading}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50"
                >
                  {loading ? 'Updating...' : 'Update Demo Password'}
                </button>
                
                <button
                  onClick={handleGetDemoUserInfo}
                  disabled={loading}
                  className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 disabled:opacity-50"
                >
                  {loading ? 'Loading...' : 'Get Demo Info'}
                </button>
              </div>
            </div>
          </div>

          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <h3 className="text-sm font-medium text-blue-800 mb-2">Demo User Details</h3>
            <p className="text-sm text-blue-700">
              Email: test@staug.com<br />
              Password: M0llySplaind#1<br />
              Name: Molly Splaind<br />
              Role: alumni<br />
              Graduation: 2020<br />
              Major: Computer Science<br />
              Company: Tech Corp<br />
              Position: Software Engineer
            </p>
          </div>
        </div>
      )}

      {/* Kevin Management Tab */}
      {activeTab === 'kevin' && (
        <div className="space-y-6">
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Kevin (kevin@staug.com) Management</h2>
            
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  New Password (optional, defaults to "PK12345")
                </label>
                <input
                  type="password"
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  placeholder="Enter new password or leave empty for default"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>
              
              <div className="flex space-x-4">
                <button
                  onClick={handleUpdateKevinPassword}
                  disabled={loading}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50"
                >
                  {loading ? 'Updating...' : 'Update Kevin\'s Password'}
                </button>
                
                <button
                  onClick={handleGetKevinInfo}
                  disabled={loading}
                  className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:opacity-50"
                >
                  {loading ? 'Loading...' : 'Get Kevin\'s Info'}
                </button>
              </div>
            </div>
          </div>

          <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
            <h3 className="text-sm font-medium text-yellow-800 mb-2">Quick Actions</h3>
            <p className="text-sm text-yellow-700">
              User ID: a7893656-1eac-42b8-aeb0-d009209bc1ad<br />
              Email: kevin@staug.com<br />
              Default password will be set to "PK12345" if no custom password is provided.
            </p>
          </div>
        </div>
      )}

      {/* User Details Tab */}
      {activeTab === 'details' && selectedUser && (
        <div className="bg-white rounded-lg shadow-md p-6">
          <h2 className="text-xl font-semibold text-gray-900 mb-6">User Details</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <h3 className="text-lg font-medium text-gray-900 mb-4">Basic Information</h3>
              <dl className="space-y-2">
                <div>
                  <dt className="text-sm font-medium text-gray-500">Email</dt>
                  <dd className="text-sm text-gray-900">{selectedUser.email}</dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-500">User ID</dt>
                  <dd className="text-sm text-gray-900 font-mono">{selectedUser.id}</dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-500">Name</dt>
                  <dd className="text-sm text-gray-900">
                    {selectedUser.user_metadata?.first_name || 'N/A'} {selectedUser.user_metadata?.last_name || ''}
                  </dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-500">Email Confirmed</dt>
                  <dd className="text-sm text-gray-900">{selectedUser.email_confirmed_at ? 'Yes' : 'No'}</dd>
                </div>
              </dl>
            </div>
            
            <div>
              <h3 className="text-lg font-medium text-gray-900 mb-4">Activity</h3>
              <dl className="space-y-2">
                <div>
                  <dt className="text-sm font-medium text-gray-500">Created</dt>
                  <dd className="text-sm text-gray-900">
                    {selectedUser.created_at ? new Date(selectedUser.created_at).toLocaleString() : 'N/A'}
                  </dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-500">Last Sign In</dt>
                  <dd className="text-sm text-gray-900">
                    {selectedUser.last_sign_in_at ? new Date(selectedUser.last_sign_in_at).toLocaleString() : 'Never'}
                  </dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-500">Phone</dt>
                  <dd className="text-sm text-gray-900">{selectedUser.phone || 'N/A'}</dd>
                </div>
              </dl>
            </div>
          </div>
          
          <div className="mt-6 pt-6 border-t border-gray-200">
            <h3 className="text-lg font-medium text-gray-900 mb-4">Actions</h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Update Password
                </label>
                <div className="flex space-x-2">
                  <input
                    type="password"
                    value={newPassword}
                    onChange={(e) => setNewPassword(e.target.value)}
                    placeholder="Enter new password"
                    className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                  <button
                    onClick={() => handleUpdatePassword(selectedUser.id)}
                    disabled={loading}
                    className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50"
                  >
                    {loading ? 'Updating...' : 'Update'}
                  </button>
                </div>
              </div>
              
              <div className="flex space-x-4">
                <button
                  onClick={() => handleResetPassword(selectedUser.email)}
                  disabled={loading}
                  className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:opacity-50"
                >
                  Send Password Reset Email
                </button>
                
                <button
                  onClick={() => handleDeleteUser(selectedUser.id)}
                  disabled={loading}
                  className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:opacity-50"
                >
                  Delete User
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
