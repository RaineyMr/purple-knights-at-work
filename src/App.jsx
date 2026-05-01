import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext.jsx';

// Auth Error Handler
import { AuthErrorHandler } from './components/Auth/AuthErrorHandler.jsx';
import AuthErrorBoundary from './components/Auth/AuthErrorBoundary.jsx';

// Layout Components
import Layout from './components/Layout/Layout.jsx';
import AuthLayout from './components/Layout/AuthLayout.jsx';

// Auth Pages
import Login from './pages/Auth/Login.jsx';
import Signup from './pages/Auth/Signup.jsx';
import ForgotPassword from './pages/Auth/ForgotPassword.jsx';

// Main Pages (unified user experience)
import Dashboard from './pages/Dashboard.jsx';
import JobBoard from './pages/JobBoard.jsx';
import JobDetail from './pages/JobDetail.jsx';
import UserProfile from './pages/UserProfile.jsx';
import CompanyProfile from './pages/CompanyProfile.jsx';
import Groups from './pages/Groups.jsx';
import GroupDetail from './pages/GroupDetail.jsx';
import Messages from './pages/Messages.jsx';
import Applications from './pages/Applications.jsx';
import PostJob from './pages/PostJob.jsx';
import Settings from './pages/Settings.jsx';
import Reports from './pages/Reports.jsx';

// Protected Route Component
import ProtectedRoute from './components/Auth/ProtectedRoute.jsx';

function App() {
  return (
    <AuthErrorBoundary>
      <AuthProvider>
        <AuthErrorHandler>
          <Routes>
            {/* Public Routes */}
            <Route path="/login" element={<AuthLayout><Login /></AuthLayout>} />
            <Route path="/signup" element={<AuthLayout><Signup /></AuthLayout>} />
            <Route path="/forgot-password" element={<AuthLayout><ForgotPassword /></AuthLayout>} />
            
            {/* Protected Routes */}
            <Route path="/" element={<ProtectedRoute><Layout /></ProtectedRoute>}>
              <Route index element={<Navigate to="/login" replace />} />
              
              {/* Main Routes */}
              <Route path="dashboard" element={<Dashboard />} />
              
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
              <Route path="reports" element={<Reports />} />
            </Route>
            
            {/* Fallback */}
            <Route path="*" element={<Navigate to="/dashboard" replace />} />
          </Routes>
        </AuthErrorHandler>
      </AuthProvider>
    </AuthErrorBoundary>
  );
}

export default App;