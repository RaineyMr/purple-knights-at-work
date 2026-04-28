import React from 'react';
import { clearAllAuthData, isAuthError } from '../../utils/authCleanup';

class AuthErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null, errorInfo: null };
  }

  static getDerivedStateFromError(error) {
    // Update state so the next render will show the fallback UI
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    // Catch errors in any components below and re-render with error message
    this.setState({
      error: error,
      errorInfo: errorInfo
    });

    // Check if it's an auth-related error
    if (isAuthError(error)) {
      console.log('Auth error caught by boundary:', error);
      
      // Clear corrupted session data
      clearAllAuthData();
    }
  };

  handleRetry = () => {
    this.setState({ hasError: false, error: null, errorInfo: null });
    window.location.reload();
  };

  handleClearAndReload = () => {
    clearAllAuthData();
    setTimeout(() => {
      window.location.href = '/login';
    }, 100);
  };

  render() {
    if (this.state.hasError) {
      const isAuthError = isAuthError(this.state.error);

      if (isAuthError) {
        return (
          <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
            <div className="bg-white rounded-lg shadow-lg p-6 max-w-md w-full">
              <div className="text-center">
                <div className="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 mb-4">
                  <svg className="h-6 w-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z" />
                  </svg>
                </div>
                <h3 className="text-lg font-medium text-gray-900 mb-2">Authentication Error</h3>
                <p className="text-sm text-gray-600 mb-6">
                  Your session has expired or become invalid. Please sign in again to continue.
                </p>
                <div className="space-y-3">
                  <button
                    onClick={this.handleClearAndReload}
                    className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                  >
                    Go to Login
                  </button>
                  <button
                    onClick={this.handleRetry}
                    className="w-full flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                  >
                    Try Again
                  </button>
                </div>
              </div>
            </div>
          </div>
        );
      }

      // For non-auth errors, show a generic error message
      return (
        <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-lg shadow-lg p-6 max-w-md w-full">
            <div className="text-center">
              <h3 className="text-lg font-medium text-gray-900 mb-2">Something went wrong</h3>
              <p className="text-sm text-gray-600 mb-6">
                An unexpected error occurred. Please try again.
              </p>
              <button
                onClick={this.handleRetry}
                className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
              >
                Try Again
              </button>
            </div>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default AuthErrorBoundary;
