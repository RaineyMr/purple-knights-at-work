import React from 'react';
import { useAnalytics } from '../../hooks/useAnalytics';
import { BookmarkIcon, EyeIcon } from '@heroicons/react/24/outline';

export default function JobCard({ job }) {
  const analytics = useAnalytics();

  const handleJobView = async () => {
    await analytics.trackJobView(job.id, job.title);
    // Navigate to job details or perform other actions
  };

  const handleJobSave = async (e) => {
    e.preventDefault();
    e.stopPropagation();
    await analytics.trackJobSave(job.id, job.title);
    // Implement save logic
  };

  return (
    <div 
      className="bg-white rounded-lg shadow-sm p-6 hover:shadow-md transition-shadow cursor-pointer"
      onClick={handleJobView}
    >
      <div className="flex justify-between items-start mb-4">
        <div>
          <h3 className="text-lg font-semibold text-gray-900 mb-2">{job.title}</h3>
          <p className="text-sm text-gray-600">{job.company_name}</p>
        </div>
        <button
          onClick={handleJobSave}
          className="p-2 text-gray-400 hover:text-amber-500 transition-colors"
          title="Save job"
        >
          <BookmarkIcon className="h-5 w-5" />
        </button>
      </div>
      
      <div className="flex items-center gap-4 text-sm text-gray-500 mb-3">
        <span>{job.location}</span>
        <span>•</span>
        <span>{job.job_type}</span>
        {job.salary_min && job.salary_max && (
          <>
            <span>•</span>
            <span>${job.salary_min.toLocaleString()} - ${job.salary_max.toLocaleString()}</span>
          </>
        )}
      </div>
      
      <p className="text-gray-700 text-sm line-clamp-2 mb-4">
        {job.description}
      </p>
      
      <div className="flex items-center justify-between">
        <div className="flex gap-2">
          {job.required_skills?.slice(0, 3).map((skill, index) => (
            <span 
              key={index}
              className="px-2 py-1 bg-purple-100 text-purple-700 text-xs rounded-full"
            >
              {skill}
            </span>
          ))}
        </div>
        
        <div className="flex items-center gap-1 text-xs text-gray-400">
          <EyeIcon className="h-4 w-4" />
          <span>View details</span>
        </div>
      </div>
    </div>
  );
}
