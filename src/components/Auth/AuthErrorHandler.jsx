import React, { useState, useEffect, useRef } from 'react';
import { useAuth } from '../../contexts/AuthContext';
import { clearAllAuthData, isAuthError } from '../../utils/authCleanup';

export const AuthErrorHandler = ({ children }) => {
  const { clearCorruptedSession } = useAuth();
  const [showError, setShowError] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');
  const isHandlingError = useRef(false);
  const originalConsoleError = useRef(null);

  useEffect(() => {
    // Prevent recursive error handling
    if (isHandlingError.current) return;
    
    // Listen for Supabase auth errors
    const handleAuthError = (event) => {
      if (isHandlingError.current) return;
      
      if (isAuthError(event.detail)) {
        isHandlingError.current = true;
        setErrorMessage('Your session has expired. Please sign in again.');
        setShowError(true);
      }
    };

    // Listen for unhandled promise rejections
    const handleUnhandledRejection = (event) => {
      if (isHandlingError.current) return;
      
      if (isAuthError(event.reason)) {
        isHandlingError.current = true;
        setErrorMessage('Your session has expired. Please sign in again.');
        setShowError(true);
        event.preventDefault();
      }
    };

    // Safely listen for console errors with better error detection
    const safeConsoleError = (...args) => {
      try {
        const errorString = args.join(' ');
        
        // Only trigger on specific auth-related errors, not all errors
        if (isAuthError({ message: errorString }) && !isHandlingError.current) {
          isHandlingError.current = true;
          setErrorMessage('Your session has expired. Please sign in again.');
          setShowError(true);
        }
      } catch (err) {
        // Prevent errors in the error handler itself
      }
      
      // Always call the original console.error
      if (originalConsoleError.current) {
        originalConsoleError.current.apply(console, args);
      }
    };

    // Store original console.error and replace it safely
    originalConsoleError.current = console.error;
    console.error = safeConsoleError;

    window.addEventListener('supabase.auth.error', handleAuthError);
    window.addEventListener('unhandledrejection', handleUnhandledRejection);

    return () => {
      window.removeEventListener('supabase.auth.error', handleAuthError);
      window.removeEventListener('unhandledrejection', handleUnhandledRejection);
      
      // Restore original console.error
      if (originalConsoleError.current) {
        console.error = originalConsoleError.current;
      }
    };
  }, []);

  const handleClearSession = async () => {
    try {
      clearAllAuthData();
      await clearCorruptedSession();
      setShowError(false);
      setErrorMessage('');
      // Reset error handling flag
      isHandlingError.current = false;
      // Reload the page to clear any remaining auth state
      window.location.reload();
    } catch (error) {
      console.error('Error clearing session:', error);
      // Force reload even if there's an error
      window.location.reload();
    }
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
