import React from 'react';

export default function AuthLayout({ children }) {
  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 to-amber-50 flex">
      <div className="flex-1 flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div className="max-w-md w-full space-y-8">
          {/* Header */}
          <div className="text-center">
            <div className="mx-auto h-12 w-12 flex items-center justify-center rounded-full bg-purple-600">
              <span className="text-white font-bold text-lg">PK</span>
            </div>
            <h2 className="mt-6 text-3xl font-bold text-gray-900">
              Purple Knights at Work
            </h2>
            <p className="mt-2 text-sm text-gray-600">
              St. Augustine High School Alumni Network
            </p>
          </div>

          {/* Auth Form */}
          <div className="mt-8">
            {children}
          </div>

          {/* Footer */}
          <div className="mt-6 text-center">
            <p className="text-xs text-gray-500">
              2026 St. Augustine High School Alumni Association
            </p>
            <div className="mt-2 space-x-4">
              <a href="#" className="text-xs text-purple-600 hover:text-purple-500">
                Privacy Policy
              </a>
              <a href="#" className="text-xs text-purple-600 hover:text-purple-500">
                Terms of Service
              </a>
            </div>
          </div>
        </div>
      </div>

      {/* Right side - Branding */}
      <div className="hidden lg:block lg:w-0 lg:flex-1 bg-gradient-to-br from-purple-600 to-amber-500 relative">
        <div className="absolute inset-0 flex flex-col justify-center items-center text-white p-12">
          <div className="text-center">
            <h1 className="text-4xl font-bold mb-4">
              Join the Purple Knights Network
            </h1>
            <p className="text-xl mb-8 max-w-md">
              Connect with fellow St. Augustine alumni for career opportunities, mentorship, and professional growth.
            </p>
            <div className="grid grid-cols-3 gap-8 max-w-sm">
              <div className="text-center">
                <div className="text-3xl font-bold mb-2">500+</div>
                <div className="text-sm opacity-90">Alumni Members</div>
              </div>
              <div className="text-center">
                <div className="text-3xl font-bold mb-2">50+</div>
                <div className="text-sm opacity-90">Job Opportunities</div>
              </div>
              <div className="text-center">
                <div className="text-3xl font-bold mb-2">100+</div>
                <div className="text-sm opacity-90">Mentors</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
