import React, { useState, useEffect } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { clearAllAuthData, isAuthError } from '../../utils/authCleanup';

export const AuthErrorHandler = ({ children }) => {
  const { clearCorruptedSession } = useAuth();
  const [showError, setShowError] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    // Listen for Supabase auth errors
    const handleAuthError = (event) => {
      if (isAuthError(event.detail)) {
        setErrorMessage('Your session has expired. Please sign in again.');
        setShowError(true);
      }
    };

    // Listen for unhandled promise rejections
    const handleUnhandledRejection = (event) => {
      if (isAuthError(event.reason)) {
        setErrorMessage('Your session has expired. Please sign in again.');
        setShowError(true);
        event.preventDefault();
      }
    };

    // Listen for console errors (catch any missed auth errors)
    const originalError = console.error;
    console.error = (...args) => {
      const errorString = args.join(' ');
      if (isAuthError({ message: errorString })) {
        setErrorMessage('Your session has expired. Please sign in again.');
        setShowError(true);
      }
      originalError.apply(console, args);
    };

    window.addEventListener('supabase.auth.error', handleAuthError);
    window.addEventListener('unhandledrejection', handleUnhandledRejection);

    return () => {
      window.removeEventListener('supabase.auth.error', handleAuthError);
      window.removeEventListener('unhandledrejection', handleUnhandledRejection);
      console.error = originalError;
    };
  }, []);

  const handleClearSession = async () => {
    clearAllAuthData();
    await clearCorruptedSession();
    setShowError(false);
    setErrorMessage('');
    // Reload the page to clear any remaining auth state
    window.location.reload();
  };

  if (!showError) {
    return <>{children}</>;
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-lg shadow-lg p-6 max-w-md w-full">
        <div className="text-center">
          <div className="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 mb-4">
            <svg className="h-6 w-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z" />
            </svg>
          </div>
          <h3 className="text-lg font-medium text-gray-900 mb-2">Session Expired</h3>
          <p className="text-sm text-gray-600 mb-6">{errorMessage}</p>
          <div className="space-y-3">
            <button
              onClick={handleClearSession}
              className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
            >
              Clear Session & Continue
            </button>
            <button
              onClick={() => window.location.href = '/login'}
              className="w-full flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
            >
              Sign In Again
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
