import React, { useState, useEffect } from 'react';
import { db } from '../lib/supabase';
import { useAuth } from '../contexts/AuthContext';
import { BriefcaseIcon } from '@heroicons/react/24/outline';

export default function JobBoard() {
  const { user } = useAuth();
  const [jobs, setJobs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filters, setFilters] = useState({
    company_id: '',
    job_type: '',
    location: ''
  });
  const [pagination, setPagination] = useState({
    currentPage: 1,
    totalPages: 1,
    totalJobs: 0,
    hasNextPage: false,
    hasPreviousPage: false
  });
  const [currentPage, setCurrentPage] = useState(1);

  useEffect(() => {
    fetchJobs();
  }, [filters, currentPage]);

  const fetchJobs = async () => {
    try {
      const activeFilters = {};
      if (filters.company_id) activeFilters.company_id = filters.company_id;
      if (filters.job_type) activeFilters.job_type = filters.job_type;
      if (filters.location) activeFilters.location = filters.location;

      // Fetch all jobs (mock for now)
      const response = await getAllJobs(activeFilters, currentPage, 10);
      
      setJobs(response.jobs);
      setPagination(response.pagination);
    } catch (error) {
      console.error('Error fetching jobs:', error);
    } finally {
      setLoading(false);
    }
  };

  const getAllJobs = async (filters, page, limit) => {
    // Mock all jobs data
    const mockAllJobs = [
      {
        id: 'job-1',
        title: 'Senior Frontend Developer',
        company: { name: 'Tech Innovations Inc.' },
        location: 'New York, NY',
        job_type: 'full_time',
        description: 'We are looking for an experienced frontend developer to join our team and help build amazing user experiences.',
        salary_range: '$120,000 - $160,000',
        remote_option: 'hybrid',
        experience_level: 'senior',
        alumni_preferred: true,
        skills: ['React', 'TypeScript', 'CSS', 'JavaScript'],
        created_at: new Date(Date.now() - 86400000).toISOString(),
        url: 'https://example.com/job1'
      },
      {
        id: 'job-2',
        title: 'Product Manager',
        company: { name: 'Digital Solutions LLC' },
        location: 'San Francisco, CA',
        job_type: 'full_time',
        description: 'Join our product team to help shape the future of our platform and drive product strategy.',
        salary_range: '$130,000 - $180,000',
        remote_option: 'remote',
        experience_level: 'mid_level',
        alumni_preferred: false,
        skills: ['Product Management', 'Agile', 'Analytics'],
        created_at: new Date(Date.now() - 172800000).toISOString(),
        url: 'https://example.com/job2'
      },
      {
        id: 'job-3',
        title: 'UX Designer',
        company: { name: 'Creative Agency' },
        location: 'Austin, TX',
        job_type: 'full_time',
        description: 'Looking for a talented UX designer to create beautiful and intuitive user interfaces.',
        salary_range: '$90,000 - $120,000',
        remote_option: 'onsite',
        experience_level: 'mid_level',
        alumni_preferred: false,
        skills: ['Figma', 'User Research', 'Prototyping'],
        created_at: new Date(Date.now() - 259200000).toISOString(),
        url: 'https://example.com/job3'
      },
      {
        id: 'job-4',
        title: 'Backend Engineer',
        company: { name: 'StartupXYZ' },
        location: 'Remote',
        job_type: 'full_time',
        description: 'Join our backend team to build scalable APIs and services.',
        salary_range: '$110,000 - $150,000',
        remote_option: 'remote',
        experience_level: 'mid_level',
        alumni_preferred: true,
        skills: ['Node.js', 'Python', 'AWS'],
        created_at: new Date(Date.now() - 345600000).toISOString(),
        url: 'https://example.com/job4'
      },
      {
        id: 'job-5',
        title: 'Marketing Coordinator',
        company: { name: 'Global Marketing Corp' },
        location: 'Chicago, IL',
        job_type: 'full_time',
        description: 'Help coordinate marketing campaigns and drive brand awareness.',
        salary_range: '$70,000 - $90,000',
        remote_option: 'hybrid',
        experience_level: 'entry_level',
        alumni_preferred: false,
        skills: ['Marketing', 'Social Media', 'Analytics'],
        created_at: new Date(Date.now() - 432000000).toISOString(),
        url: 'https://example.com/job5'
      },
      {
        id: 'job-6',
        title: 'Data Scientist',
        company: { name: 'Data Analytics Inc' },
        location: 'Boston, MA',
        job_type: 'full_time',
        description: 'Apply machine learning and statistical analysis to solve complex business problems.',
        salary_range: '$130,000 - $170,000',
        remote_option: 'remote',
        experience_level: 'senior',
        alumni_preferred: true,
        skills: ['Python', 'Machine Learning', 'SQL'],
        created_at: new Date(Date.now() - 518400000).toISOString(),
        url: 'https://example.com/job6'
      },
      {
        id: 'job-7',
        title: 'Full Stack Developer',
        company: { name: 'Enterprise Solutions' },
        location: 'Seattle, WA',
        job_type: 'full_time',
        description: 'We need a versatile full stack developer to work on our flagship product.',
        salary_range: '$100,000 - $140,000',
        remote_option: 'hybrid',
        experience_level: 'mid_level',
        alumni_preferred: false,
        skills: ['JavaScript', 'React', 'Node.js', 'PostgreSQL'],
        created_at: new Date(Date.now() - 604800000).toISOString(),
        url: 'https://example.com/job7'
      },
      {
        id: 'job-8',
        title: 'DevOps Engineer',
        company: { name: 'Cloud Infrastructure Co' },
        location: 'Remote',
        job_type: 'full_time',
        description: 'Help us build and maintain scalable cloud infrastructure.',
        salary_range: '$120,000 - $160,000',
        remote_option: 'remote',
        experience_level: 'senior',
        alumni_preferred: true,
        skills: ['Docker', 'Kubernetes', 'AWS', 'CI/CD'],
        created_at: new Date(Date.now() - 691200000).toISOString(),
        url: 'https://example.com/job8'
      }
    ];

    return {
      jobs: mockAllJobs,
      pagination: {
        currentPage: page,
        totalPages: 1,
        totalJobs: mockAllJobs.length,
        hasNextPage: false,
        hasPreviousPage: page > 1
      }
    };
  };

  
  const handleFilterChange = (field, value) => {
    setFilters(prev => ({
      ...prev,
      [field]: value
    }));
    setCurrentPage(1); // Reset to first page when filters change
  };

  const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
  };

  const renderPaginationControls = () => {
    if (pagination.totalPages <= 1) return null;

    const pages = [];
    const maxVisiblePages = 5;
    
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(pagination.totalPages, startPage + maxVisiblePages - 1);
    
    if (endPage - startPage < maxVisiblePages - 1) {
      startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    for (let i = startPage; i <= endPage; i++) {
      pages.push(i);
    }

    return (
      <div className="flex items-center justify-center space-x-2 mt-8">
        <button
          onClick={() => handlePageChange(1)}
          disabled={!pagination.hasPreviousPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          First
        </button>
        
        <button
          onClick={() => handlePageChange(currentPage - 1)}
          disabled={!pagination.hasPreviousPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Previous
        </button>

        {startPage > 1 && (
          <>
            <button
              onClick={() => handlePageChange(1)}
              className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50"
            >
              1
            </button>
            {startPage > 2 && <span className="px-2 text-gray-500">...</span>}
          </>
        )}

        {pages.map(page => (
          <button
            key={page}
            onClick={() => handlePageChange(page)}
            className={`px-3 py-2 text-sm font-medium rounded-md ${
              page === currentPage
                ? 'bg-blue-600 text-white border border-blue-600'
                : 'text-gray-500 bg-white border border-gray-300 hover:bg-gray-50'
            }`}
          >
            {page}
          </button>
        ))}

        {endPage < pagination.totalPages && (
          <>
            {endPage < pagination.totalPages - 1 && <span className="px-2 text-gray-500">...</span>}
            <button
              onClick={() => handlePageChange(pagination.totalPages)}
              className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50"
            >
              {pagination.totalPages}
            </button>
          </>
        )}

        <button
          onClick={() => handlePageChange(currentPage + 1)}
          disabled={!pagination.hasNextPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Next
        </button>

        <button
          onClick={() => handlePageChange(pagination.totalPages)}
          disabled={!pagination.hasNextPage}
          className="px-3 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 rounded-md hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Last
        </button>
      </div>
    );
  };

  if (loading) {
    return (
      <div className="max-w-6xl mx-auto p-6">
        <div className="text-center py-8">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading jobs...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-6xl mx-auto p-6">
      <div className="flex items-center space-x-3 mb-8">
        <BriefcaseIcon className="h-8 w-8 text-blue-600" />
        <h1 className="text-3xl font-bold text-gray-900">Job Board</h1>
      </div>
      
      {/* Filters */}
      <div className="bg-white rounded-lg shadow-md p-6 mb-6">
        <h2 className="text-lg font-semibold mb-4">Filter Jobs</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Company
            </label>
            <input
              type="text"
              value={filters.company_id}
              onChange={(e) => handleFilterChange('company_id', e.target.value)}
              placeholder="Company ID"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Job Type
            </label>
            <select
              value={filters.job_type}
              onChange={(e) => handleFilterChange('job_type', e.target.value)}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="">All Types</option>
              <option value="full_time">Full Time</option>
              <option value="part_time">Part Time</option>
              <option value="contract">Contract</option>
              <option value="internship">Internship</option>
              <option value="freelance">Freelance</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Location
            </label>
            <input
              type="text"
              value={filters.location}
              onChange={(e) => handleFilterChange('location', e.target.value)}
              placeholder="City, State or Remote"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>
        </div>
      </div>

      {/* Job Listings */}
      <div className="space-y-4">
        {jobs.length === 0 ? (
          <div className="bg-white rounded-lg shadow-md p-8 text-center">
            <BriefcaseIcon className="h-16 w-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-lg font-medium text-gray-900 mb-2">No jobs found</h3>
            <p className="text-gray-600">
              No jobs match your current filters. Try adjusting your search criteria.
            </p>
          </div>
        ) : (
          <>
            <div className="text-sm text-gray-600 mb-4">
              Showing {jobs.length} of {pagination.totalJobs} jobs (Page {pagination.currentPage} of {pagination.totalPages})
            </div>
            {jobs.map((job) => (
            <div key={job.id} className="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow">
              <div className="flex justify-between items-start mb-4">
                <div>
                  <h3 className="text-xl font-semibold text-gray-900 mb-2">{job.title}</h3>
                  <div className="flex items-center gap-4 text-sm text-gray-600">
                    {job.company && (
                      <span className="font-medium">{job.company.name}</span>
                    )}
                    <span>•</span>
                    <span>{job.location}</span>
                    <span>•</span>
                    <span className="capitalize">{job.job_type.replace('_', ' ')}</span>
                  </div>
                </div>
                <div className="text-right">
                  {job.salary_range && (
                    <p className="text-lg font-semibold text-green-600">
                      {job.salary_range}
                    </p>
                  )}
                  {job.salary_min && job.salary_max && !job.salary_range && (
                    <p className="text-lg font-semibold text-green-600">
                      ${job.salary_min.toLocaleString()} - ${job.salary_max.toLocaleString()}
                    </p>
                  )}
                  {job.salary_min && !job.salary_max && !job.salary_range && (
                    <p className="text-lg font-semibold text-green-600">
                      ${job.salary_min.toLocaleString()}+
                    </p>
                  )}
                </div>
              </div>

              <p className="text-gray-700 mb-4 line-clamp-3">{job.description}</p>

              <div className="flex items-center justify-between">
                <div className="flex gap-2">
                  {job.remote_option && (
                    <span className="px-2 py-1 bg-blue-100 text-blue-800 text-xs rounded-full capitalize">
                      {job.remote_option.replace('_', ' ')}
                    </span>
                  )}
                  {job.experience_level && (
                    <span className="px-2 py-1 bg-purple-100 text-purple-800 text-xs rounded-full capitalize">
                      {job.experience_level.replace('_', ' ')}
                    </span>
                  )}
                  {job.alumni_preferred && (
                    <span className="px-2 py-1 bg-yellow-100 text-yellow-800 text-xs rounded-full">
                      🎓 Alumni Preferred
                    </span>
                  )}
                </div>
                <div className="text-sm text-gray-500">
                  Posted {new Date(job.created_at).toLocaleDateString()}
                </div>
              </div>

              {job.skills && job.skills.length > 0 && (
                <div className="mt-4">
                  <p className="text-sm font-medium text-gray-700 mb-2">Skills:</p>
                  <div className="flex flex-wrap gap-2">
                    {job.skills.slice(0, 5).map((skill, index) => (
                      <span key={index} className="px-2 py-1 bg-gray-100 text-gray-700 text-xs rounded">
                        {skill}
                      </span>
                    ))}
                    {job.skills.length > 5 && (
                      <span className="px-2 py-1 bg-gray-100 text-gray-700 text-xs rounded">
                        +{job.skills.length - 5} more
                      </span>
                    )}
                  </div>
                </div>
              )}

              {job.alumni_affiliation && (
                <div className="mt-4">
                  <p className="text-sm font-medium text-gray-700 mb-2">Alumni Affiliation:</p>
                  <p className="text-sm text-gray-600">{job.alumni_affiliation}</p>
                </div>
              )}

              {job.url && (
                <div className="mt-4">
                  <a
                    href={job.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-blue-600 hover:text-blue-700 text-sm font-medium"
                  >
                    View Job Posting →
                  </a>
                </div>
              )}
            </div>
            ))}
          </>
        )}
      </div>

      {/* Pagination Controls */}
      {renderPaginationControls()}
    </div>
  );
}
