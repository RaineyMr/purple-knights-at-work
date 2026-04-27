import React, { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { useAuth } from '../hooks/useAuth';

export default function PostJob() {
  const { user } = useAuth();
  const [step, setStep] = useState(1); // 1: company search, 2: job details, 3: review
  const [loading, setLoading] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [selectedCompany, setSelectedCompany] = useState(null);
  const [showCreateCompany, setShowCreateCompany] = useState(false);
  
  // Job form state
  const [jobData, setJobData] = useState({
    title: '',
    description: '',
    job_type: 'full_time',
    location: '',
    remote_option: 'on_site',
    salary_min: '',
    salary_max: '',
    required_skills: [],
    preferred_skills: [],
    experience_level: 'entry_level',
    alumni_preferred: false,
    deadline: ''
  });

  // New company form state
  const [newCompany, setNewCompany] = useState({
    name: '',
    description: '',
    industry: '',
    website: '',
    location: ''
  });

  // Search companies
  const searchCompanies = async (term) => {
    if (!term.trim()) {
      setSearchResults([]);
      return;
    }
    
    try {
      const results = await supabase.searchCompanies(term);
      setSearchResults(results);
    } catch (error) {
      console.error('Error searching companies:', error);
    }
  };

  // Create new company
  const createCompany = async () => {
    if (!newCompany.name.trim()) {
      alert('Company name is required');
      return;
    }

    setLoading(true);
    try {
      const company = await supabase.createCompany(newCompany);
      setSelectedCompany(company);
      setShowCreateCompany(false);
      setStep(2);
    } catch (error) {
      console.error('Error creating company:', error);
      alert('Failed to create company');
    } finally {
      setLoading(false);
    }
  };

  // Select existing company
  const selectCompany = (company) => {
    setSelectedCompany(company);
    setStep(2);
  };

  // Handle job form changes
  const handleJobChange = (field, value) => {
    setJobData(prev => ({
      ...prev,
      [field]: value
    }));
  };

  // Handle skills input
  const handleSkillsChange = (field, value) => {
    const skills = value.split(',').map(skill => skill.trim()).filter(skill => skill);
    setJobData(prev => ({
      ...prev,
      [field]: skills
    }));
  };

  // Submit job
  const submitJob = async () => {
    if (!selectedCompany) {
      alert('Please select a company');
      return;
    }

    if (!jobData.title || !jobData.description || !jobData.location) {
      alert('Please fill in all required fields');
      return;
    }

    setLoading(true);
    try {
      const jobPayload = {
        company_id: selectedCompany.id,
        posted_by: user.id,
        title: jobData.title,
        description: jobData.description,
        job_type: jobData.job_type,
        location: jobData.location,
        remote_option: jobData.remote_option,
        salary_min: jobData.salary_min ? parseInt(jobData.salary_min) : null,
        salary_max: jobData.salary_max ? parseInt(jobData.salary_max) : null,
        required_skills: jobData.required_skills,
        preferred_skills: jobData.preferred_skills,
        experience_level: jobData.experience_level,
        alumni_preferred: jobData.alumni_preferred,
        deadline: jobData.deadline ? new Date(jobData.deadline).toISOString() : null,
        is_active: true
      };

      await supabase.createJob(jobPayload);
      alert('Job posted successfully!');
      // Reset form
      setStep(1);
      setSelectedCompany(null);
      setJobData({
        title: '',
        description: '',
        job_type: 'full_time',
        location: '',
        remote_option: 'on_site',
        salary_min: '',
        salary_max: '',
        required_skills: [],
        preferred_skills: [],
        experience_level: 'entry_level',
        alumni_preferred: false,
        deadline: ''
      });
    } catch (error) {
      console.error('Error posting job:', error);
      alert('Failed to post job');
    } finally {
      setLoading(false);
    }
  };

  // Company Search Step
  if (step === 1) {
    return (
      <div className="max-w-4xl mx-auto p-6">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Post a Job</h1>
        
        <div className="bg-white rounded-lg shadow-md p-6 mb-6">
          <h2 className="text-xl font-semibold mb-4">Step 1: Select Company</h2>
          
          <div className="mb-6">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Search for Company
            </label>
            <input
              type="text"
              value={searchTerm}
              onChange={(e) => {
                setSearchTerm(e.target.value);
                searchCompanies(e.target.value);
              }}
              placeholder="Start typing company name..."
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>

          {searchResults.length > 0 && (
            <div className="mb-6">
              <h3 className="text-sm font-medium text-gray-700 mb-2">Search Results:</h3>
              <div className="space-y-2">
                {searchResults.map((company) => (
                  <div
                    key={company.id}
                    onClick={() => selectCompany(company)}
                    className="p-4 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors"
                  >
                    <h4 className="font-semibold text-gray-900">{company.name}</h4>
                    {company.location && <p className="text-sm text-gray-600">{company.location}</p>}
                    {company.industry && <p className="text-sm text-gray-500">{company.industry}</p>}
                  </div>
                ))}
              </div>
            </div>
          )}

          {searchTerm && searchResults.length === 0 && (
            <div className="mb-6">
              <p className="text-gray-600 mb-4">No companies found. Would you like to create a new company?</p>
              <button
                onClick={() => setShowCreateCompany(true)}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                Create New Company
              </button>
            </div>
          )}

          {showCreateCompany && (
            <div className="border-t pt-6">
              <h3 className="text-lg font-semibold mb-4">Create New Company</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Company Name *
                  </label>
                  <input
                    type="text"
                    value={newCompany.name}
                    onChange={(e) => setNewCompany(prev => ({ ...prev, name: e.target.value }))}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Industry
                  </label>
                  <input
                    type="text"
                    value={newCompany.industry}
                    onChange={(e) => setNewCompany(prev => ({ ...prev, industry: e.target.value }))}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Website
                  </label>
                  <input
                    type="url"
                    value={newCompany.website}
                    onChange={(e) => setNewCompany(prev => ({ ...prev, website: e.target.value }))}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Location
                  </label>
                  <input
                    type="text"
                    value={newCompany.location}
                    onChange={(e) => setNewCompany(prev => ({ ...prev, location: e.target.value }))}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                </div>
              </div>
              <div className="mt-4">
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Description
                </label>
                <textarea
                  value={newCompany.description}
                  onChange={(e) => setNewCompany(prev => ({ ...prev, description: e.target.value }))}
                  rows={3}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>
              <div className="mt-6 flex gap-4">
                <button
                  onClick={createCompany}
                  disabled={loading}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50"
                >
                  {loading ? 'Creating...' : 'Create Company'}
                </button>
                <button
                  onClick={() => setShowCreateCompany(false)}
                  className="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors"
                >
                  Cancel
                </button>
              </div>
            </div>
          )}

          {selectedCompany && (
            <div className="mt-6 p-4 bg-green-50 border border-green-200 rounded-lg">
              <h3 className="font-semibold text-green-800">Selected Company:</h3>
              <p className="text-green-700">{selectedCompany.name}</p>
              <button
                onClick={() => setStep(2)}
                className="mt-3 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors"
              >
                Continue to Job Details
              </button>
            </div>
          )}
        </div>
      </div>
    );
  }

  // Job Details Step
  if (step === 2) {
    return (
      <div className="max-w-4xl mx-auto p-6">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Post a Job</h1>
        
        <div className="bg-white rounded-lg shadow-md p-6">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-xl font-semibold">Step 2: Job Details</h2>
            <button
              onClick={() => setStep(1)}
              className="text-blue-600 hover:text-blue-700 text-sm"
            >
              ← Change Company
            </button>
          </div>

          {selectedCompany && (
            <div className="mb-6 p-4 bg-gray-50 rounded-lg">
              <span className="text-sm font-medium text-gray-600">Company: </span>
              <span className="font-semibold">{selectedCompany.name}</span>
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Job Title *
              </label>
              <input
                type="text"
                value={jobData.title}
                onChange={(e) => handleJobChange('title', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Job Type *
              </label>
              <select
                value={jobData.job_type}
                onChange={(e) => handleJobChange('job_type', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              >
                <option value="full_time">Full Time</option>
                <option value="part_time">Part Time</option>
                <option value="contract">Contract</option>
                <option value="internship">Internship</option>
                <option value="freelance">Freelance</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Location *
              </label>
              <input
                type="text"
                value={jobData.location}
                onChange={(e) => handleJobChange('location', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                required
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Remote Option
              </label>
              <select
                value={jobData.remote_option}
                onChange={(e) => handleJobChange('remote_option', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              >
                <option value="on_site">On Site</option>
                <option value="hybrid">Hybrid</option>
                <option value="fully_remote">Fully Remote</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Experience Level
              </label>
              <select
                value={jobData.experience_level}
                onChange={(e) => handleJobChange('experience_level', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              >
                <option value="entry_level">Entry Level</option>
                <option value="mid_level">Mid Level</option>
                <option value="senior_level">Senior Level</option>
                <option value="executive">Executive</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Minimum Salary
              </label>
              <input
                type="number"
                value={jobData.salary_min}
                onChange={(e) => handleJobChange('salary_min', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                placeholder="e.g., 50000"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Maximum Salary
              </label>
              <input
                type="number"
                value={jobData.salary_max}
                onChange={(e) => handleJobChange('salary_max', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                placeholder="e.g., 80000"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Application Deadline
              </label>
              <input
                type="date"
                value={jobData.deadline}
                onChange={(e) => handleJobChange('deadline', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>

            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Required Skills (comma-separated)
              </label>
              <input
                type="text"
                value={jobData.required_skills.join(', ')}
                onChange={(e) => handleSkillsChange('required_skills', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                placeholder="e.g., JavaScript, React, Node.js"
              />
            </div>

            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Preferred Skills (comma-separated)
              </label>
              <input
                type="text"
                value={jobData.preferred_skills.join(', ')}
                onChange={(e) => handleSkillsChange('preferred_skills', e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                placeholder="e.g., TypeScript, AWS, Docker"
              />
            </div>

            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Job Description *
              </label>
              <textarea
                value={jobData.description}
                onChange={(e) => handleJobChange('description', e.target.value)}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                required
              />
            </div>

            <div className="md:col-span-2">
              <label className="flex items-center">
                <input
                  type="checkbox"
                  checked={jobData.alumni_preferred}
                  onChange={(e) => handleJobChange('alumni_preferred', e.target.checked)}
                  className="mr-2"
                />
                <span className="text-sm font-medium text-gray-700">
                  Prefer Purple Knights Alumni
                </span>
              </label>
            </div>
          </div>

          <div className="mt-8 flex gap-4">
            <button
              onClick={submitJob}
              disabled={loading}
              className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50"
            >
              {loading ? 'Posting...' : 'Post Job'}
            </button>
            <button
              onClick={() => setStep(1)}
              className="px-6 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors"
            >
              Back
            </button>
          </div>
        </div>
      </div>
    );
  }

  return null;
}
