import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';

// Layout Components
import Layout from './components/Layout/Layout';
import AuthLayout from './components/Layout/AuthLayout';

// Auth Pages
import Login from './pages/Auth/Login';
import Signup from './pages/Auth/Signup';
import ForgotPassword from './pages/Auth/ForgotPassword';

// Main Pages (unified user experience)
import Dashboard from './pages/Dashboard';
import Feed from './pages/Feed';
import JobBoard from './pages/JobBoard';
import JobDetail from './pages/JobDetail';
import UserProfile from './pages/UserProfile';
import CompanyProfile from './pages/CompanyProfile';
import Groups from './pages/Groups';
import GroupDetail from './pages/GroupDetail';
import Messages from './pages/Messages';
import Applications from './pages/Applications';
import PostJob from './pages/PostJob';
import Settings from './pages/Settings';

// Protected Route Component
import ProtectedRoute from './components/Auth/ProtectedRoute';

function App() {
  return (
    <AuthProvider>
      <Routes>
        {/* Public Routes */}
        <Route path="/login" element={<AuthLayout><Login /></AuthLayout>} />
        <Route path="/signup" element={<AuthLayout><Signup /></AuthLayout>} />
        <Route path="/forgot-password" element={<AuthLayout><ForgotPassword /></AuthLayout>} />
        
        {/* Protected Routes */}
        <Route path="/" element={<ProtectedRoute><Layout /></ProtectedRoute>}>
          <Route index element={<Navigate to="/dashboard" replace />} />
          
          {/* Main Routes */}
          <Route path="dashboard" element={<Dashboard />} />
          <Route path="feed" element={<Feed />} />
          
          {/* Job Routes */}
          <Route path="jobs" element={<JobBoard />} />
          <Route path="jobs/:id" element={<JobDetail />} />
          <Route path="post-job" element={<PostJob />} />
          <Route path="applications" element={<Applications />} />
          
          {/* User & Company Routes */}
          <Route path="profile" element={<UserProfile />} />
          <Route path="user/:id" element={<UserProfile />} />
          <Route path="company/:id" element={<CompanyProfile />} />
          
          {/* Groups/Networks Routes */}
          <Route path="groups" element={<Groups />} />
          <Route path="groups/:id" element={<GroupDetail />} />
          
          {/* Messaging & Settings */}
          <Route path="messages" element={<Messages />} />
          <Route path="messages/:userId" element={<Messages />} />
          <Route path="settings" element={<Settings />} />
        </Route>
        
        {/* Fallback */}
        <Route path="*" element={<Navigate to="/dashboard" replace />} />
      </Routes>
    </AuthProvider>
  );
}

export default App;
