import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { db } from '../lib/supabase';
import { useAuth } from '../hooks/useAuth';

export default function JobDetail() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [job, setJob] = useState(null);
  const [loading, setLoading] = useState(true);
  const [applying, setApplying] = useState(false);

  useEffect(() => {
    fetchJob();
  }, [id]);

  const fetchJob = async () => {
    try {
      const jobData = await db.getJob(id);
      setJob(jobData);
    } catch (error) {
      console.error('Error fetching job:', error);
    } finally {
      setLoading(false);
    }
  };

  const applyForJob = async () => {
    if (!user) {
      alert('Please log in to apply for jobs');
      navigate('/login');
      return;
    }

    setApplying(true);
    try {
      await db.createApplication(id, user.id);
      alert('Application submitted successfully!');
    } catch (error) {
      console.error('Error applying for job:', error);
      alert('Failed to submit application');
    } finally {
      setApplying(false);
    }
  };

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto p-6">
        <div className="text-center py-8">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading job details...</p>
        </div>
      </div>
    );
  }

  if (!job) {
    return (
      <div className="max-w-4xl mx-auto p-6">
        <div className="bg-white rounded-lg shadow-md p-8 text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">Job Not Found</h1>
          <p className="text-gray-600 mb-6">The job you're looking for doesn't exist or has been removed.</p>
          <button
            onClick={() => navigate('/jobs')}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            Back to Job Board
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto p-6">
      <button
        onClick={() => navigate('/jobs')}
        className="mb-6 text-blue-600 hover:text-blue-700 flex items-center gap-2"
      >
        ← Back to Job Board
      </button>

      <div className="bg-white rounded-lg shadow-md p-8">
        {/* Job Header */}
        <div className="border-b pb-6 mb-6">
          <div className="flex justify-between items-start mb-4">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 mb-2">{job.title}</h1>
              <div className="flex items-center gap-4 text-lg text-gray-700">
                {job.company && (
                  <span className="font-semibold">{job.company.name}</span>
                )}
                <span>•</span>
                <span>{job.location}</span>
                <span>•</span>
                <span className="capitalize">{job.job_type.replace('_', ' ')}</span>
              </div>
            </div>
            <div className="text-right">
              {job.salary_range && (
                <p className="text-2xl font-bold text-green-600">
                  {job.salary_range}
                </p>
              )}
              {job.salary_min && job.salary_max && !job.salary_range && (
                <p className="text-2xl font-bold text-green-600">
                  ${job.salary_min.toLocaleString()} - ${job.salary_max.toLocaleString()}
                </p>
              )}
              {job.salary_min && !job.salary_max && !job.salary_range && (
                <p className="text-2xl font-bold text-green-600">
                  ${job.salary_min.toLocaleString()}+
                </p>
              )}
              <div className="text-sm text-gray-500 mt-1">
                Posted {new Date(job.created_at).toLocaleDateString()}
              </div>
            </div>
          </div>

          <div className="flex gap-2">
            {job.remote_option && (
              <span className="px-3 py-1 bg-blue-100 text-blue-800 text-sm rounded-full capitalize">
                {job.remote_option.replace('_', ' ')}
              </span>
            )}
            {job.experience_level && (
              <span className="px-3 py-1 bg-purple-100 text-purple-800 text-sm rounded-full capitalize">
                {job.experience_level.replace('_', ' ')}
              </span>
            )}
            {job.alumni_preferred && (
              <span className="px-3 py-1 bg-yellow-100 text-yellow-800 text-sm rounded-full">
                🎓 Purple Knights Alumni Preferred
              </span>
            )}
          </div>
        </div>

        {/* Job Description */}
        <div className="mb-8">
          <h2 className="text-xl font-semibold text-gray-900 mb-4">Job Description</h2>
          <div className="prose max-w-none text-gray-700 whitespace-pre-wrap">
            {job.description}
          </div>
        </div>

        {/* Skills */}
        {job.skills && job.skills.length > 0 && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Skills</h2>
            <div className="flex flex-wrap gap-2">
              {job.skills.map((skill, index) => (
                <span key={index} className="px-3 py-1 bg-blue-100 text-blue-800 text-sm rounded">
                  {skill}
                </span>
              ))}
            </div>
          </div>
        )}

        {/* Responsibilities */}
        {job.responsibilities && job.responsibilities.length > 0 && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Responsibilities</h2>
            <div className="flex flex-wrap gap-2">
              {job.responsibilities.map((responsibility, index) => (
                <span key={index} className="px-3 py-1 bg-green-100 text-green-800 text-sm rounded">
                  {responsibility}
                </span>
              ))}
            </div>
          </div>
        )}

        {/* Alumni Affiliation */}
        {job.alumni_affiliation && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Alumni Affiliation</h2>
            <p className="text-gray-700">{job.alumni_affiliation}</p>
          </div>
        )}

        {/* Job URL */}
        {job.url && (
          <div className="mb-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Job Posting URL</h2>
            <a
              href={job.url}
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-600 hover:text-blue-700 font-medium"
            >
              {job.url}
            </a>
          </div>
        )}

        {/* Additional Information */}
        <div className="mb-8">
          <h2 className="text-xl font-semibold text-gray-900 mb-4">Additional Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {job.deadline && (
              <div>
                <span className="font-medium text-gray-700">Application Deadline:</span>
                <p className="text-gray-600">{new Date(job.deadline).toLocaleDateString()}</p>
              </div>
            )}
            <div>
              <span className="font-medium text-gray-700">Posted by:</span>
              <p className="text-gray-600">
                {job.posted_by ? `${job.posted_by.first_name} ${job.posted_by.last_name}` : 'Company Representative'}
              </p>
            </div>
          </div>
        </div>

        {/* Company Information */}
        {job.company && (
          <div className="mb-8 p-6 bg-gray-50 rounded-lg">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">About {job.company.name}</h2>
            {job.company.description && (
              <p className="text-gray-700 mb-4">{job.company.description}</p>
            )}
            {job.company.location && (
              <p className="text-gray-600">
                <span className="font-medium">Location:</span> {job.company.location}
              </p>
            )}
            {job.company.industry && (
              <p className="text-gray-600">
                <span className="font-medium">Industry:</span> {job.company.industry}
              </p>
            )}
            {job.company.website && (
              <p className="text-gray-600">
                <span className="font-medium">Website:</span>{' '}
                <a 
                  href={job.company.website} 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="text-blue-600 hover:text-blue-700"
                >
                  {job.company.website}
                </a>
              </p>
            )}
          </div>
        )}

        {/* Apply Button */}
        <div className="text-center">
          <button
            onClick={applyForJob}
            disabled={applying}
            className="px-8 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50 text-lg font-semibold"
          >
            {applying ? 'Submitting...' : 'Apply for This Job'}
          </button>
          <p className="text-sm text-gray-500 mt-2">
            You'll be redirected to apply with your Purple Knights profile
          </p>
        </div>
      </div>
    </div>
  );
}
