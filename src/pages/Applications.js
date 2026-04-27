import React, { useState, useEffect } from 'react';
import { db } from '../lib/supabase';
import { useAuth } from '../hooks/useAuth';

export default function Applications() {
  const { user } = useAuth();
  const [applications, setApplications] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchApplications();
    }
  }, [user]);

  const fetchApplications = async () => {
    try {
      const applicationData = await db.getApplications(user.id);
      setApplications(applicationData);
    } catch (error) {
      console.error('Error fetching applications:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto p-6">
        <div className="text-center py-8">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading applications...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto p-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">My Applications</h1>
      
      <div className="space-y-4">
        {applications.length === 0 ? (
          <div className="bg-white rounded-lg shadow-md p-8 text-center">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">No Applications Yet</h2>
            <p className="text-gray-600 mb-6">Start applying for jobs to see your applications here.</p>
            <a
              href="/jobs"
              className="inline-block px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
            >
              Browse Jobs
            </a>
          </div>
        ) : (
          applications.map((application) => (
            <div key={application.id} className="bg-white rounded-lg shadow-md p-6">
              <div className="flex justify-between items-start mb-4">
                <div>
                  <h3 className="text-xl font-semibold text-gray-900 mb-2">
                    {application.job?.title || 'Job Title'}
                  </h3>
                  <div className="flex items-center gap-4 text-sm text-gray-600">
                    {application.job?.company && (
                      <span className="font-medium">{application.job.company.name}</span>
                    )}
                    <span>•</span>
                    <span>{application.job?.location || 'Location'}</span>
                    <span>•</span>
                    <span className="capitalize">{application.job?.job_type?.replace('_', ' ') || 'Job Type'}</span>
                  </div>
                </div>
                <div className="text-right">
                  <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                    application.status === 'applied' ? 'bg-blue-100 text-blue-800' :
                    application.status === 'reviewing' ? 'bg-yellow-100 text-yellow-800' :
                    application.status === 'interviewing' ? 'bg-purple-100 text-purple-800' :
                    application.status === 'offer_extended' ? 'bg-green-100 text-green-800' :
                    application.status === 'rejected' ? 'bg-red-100 text-red-800' :
                    'bg-gray-100 text-gray-800'
                  }`}>
                    {application.status?.replace('_', ' ').toUpperCase() || 'UNKNOWN'}
                  </span>
                </div>
              </div>

              <div className="flex items-center justify-between">
                <div className="text-sm text-gray-500">
                  Applied on {new Date(application.applied_at).toLocaleDateString()}
                </div>
                {application.job?.id && (
                  <a
                    href={`/jobs/${application.job.id}`}
                    className="text-blue-600 hover:text-blue-700 text-sm font-medium"
                  >
                    View Job Details →
                  </a>
                )}
              </div>

              {application.cover_note && (
                <div className="mt-4 p-4 bg-gray-50 rounded-lg">
                  <h4 className="text-sm font-medium text-gray-700 mb-2">Cover Note:</h4>
                  <p className="text-sm text-gray-600">{application.cover_note}</p>
                </div>
              )}
            </div>
          ))
        )}
      </div>
    </div>
  );
}
