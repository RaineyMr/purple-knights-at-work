import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;


if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables. Please check your .env file.');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: true,
    flow: 'pkce',
  },
});

// Database helper functions - Updated for new schema
export const db = {
  // User functions
  async getUser(userId) {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('id', userId)
      .single();
    if (error) throw error;
    return data;
  },

  async updateUser(userId, updates) {
    const { data, error } = await supabase
      .from('users')
      .update(updates)
      .eq('id', userId)
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  // Job functions
  async getJobs(filters = {}, page = 1, limit = 10) {
    // Mock job data for demo purposes
    const mockJobs = [
      {
        id: '1',
        title: 'Senior Frontend Developer',
        description: 'We are looking for an experienced frontend developer to join our growing team. You will be working on cutting-edge web applications using React, TypeScript, and modern CSS frameworks.',
        company: {
          name: 'Tech Innovations Inc.',
          logo_url: null,
          website: 'https://techinnovations.com'
        },
        location: 'New York, NY',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_range: '$80k-$120k',
        experience_level: 'senior_level',
        skills: ['React', 'TypeScript', 'CSS', 'JavaScript'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        created_at: new Date(Date.now() - 86400000).toISOString(),
        url: 'https://example.com/job1'
      },
      {
        id: '2',
        title: 'Product Manager',
        description: 'Join our product team to help shape the future of our platform. You will work closely with engineering, design, and business teams to deliver exceptional user experiences.',
        company: {
          name: 'Digital Solutions LLC',
          logo_url: null,
          website: 'https://digitalsolutions.com'
        },
        location: 'San Francisco, CA',
        job_type: 'full_time',
        remote_option: 'fully_remote',
        salary_range: '$100k-$150k',
        experience_level: 'mid_level',
        skills: ['Product Management', 'Agile', 'Analytics', 'Communication'],
        alumni_preferred: false,
        alumni_affiliation: null,
        created_at: new Date(Date.now() - 172800000).toISOString(),
        url: 'https://example.com/job2'
      },
      {
        id: '3',
        title: 'UX Designer',
        description: 'We are seeking a talented UX designer to create beautiful and intuitive user interfaces. Experience with design systems and user research is essential.',
        company: {
          name: 'Creative Studios',
          logo_url: null,
          website: 'https://creativestudios.com'
        },
        location: 'Remote',
        job_type: 'contract',
        remote_option: 'fully_remote',
        salary_range: '$60k-$80k',
        experience_level: 'mid_level',
        skills: ['Figma', 'User Research', 'Prototyping', 'Design Systems'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        created_at: new Date(Date.now() - 259200000).toISOString(),
        url: 'https://example.com/job3'
      },
      {
        id: '4',
        title: 'Backend Engineer',
        description: 'Looking for a skilled backend engineer to build scalable APIs and services. Experience with Node.js, Python, and cloud platforms is required.',
        company: {
          name: 'Cloud Systems Inc',
          logo_url: null,
          website: 'https://cloudsystems.com'
        },
        location: 'Austin, TX',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_range: '$90k-$130k',
        experience_level: 'senior_level',
        skills: ['Node.js', 'Python', 'AWS', 'PostgreSQL'],
        alumni_preferred: false,
        alumni_affiliation: null,
        created_at: new Date(Date.now() - 345600000).toISOString(),
        url: 'https://example.com/job4'
      },
      {
        id: '5',
        title: 'Marketing Coordinator',
        description: 'Join our marketing team to help promote our products and services. You will be responsible for social media, content creation, and campaign management.',
        company: {
          name: 'Growth Agency',
          logo_url: null,
          website: 'https://growthagency.com'
        },
        location: 'Boston, MA',
        job_type: 'part_time',
        remote_option: 'on_site',
        salary_range: '$40k-$60k',
        experience_level: 'entry_level',
        skills: ['Social Media', 'Content Writing', 'Analytics', 'Campaign Management'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        created_at: new Date(Date.now() - 432000000).toISOString(),
        url: 'https://example.com/job5'
      },
      {
        id: '6',
        title: 'Data Scientist',
        description: 'We are seeking a talented data scientist to join our analytics team. You will work on machine learning models, data analysis, and predictive analytics.',
        company: {
          name: 'Data Insights Corp',
          logo_url: null,
          website: 'https://datainsights.com'
        },
        location: 'Remote',
        job_type: 'full_time',
        remote_option: 'fully_remote',
        salary_range: '$100k-$140k',
        experience_level: 'senior_level',
        skills: ['Python', 'Machine Learning', 'SQL', 'Data Visualization'],
        alumni_preferred: false,
        alumni_affiliation: null,
        created_at: new Date(Date.now() - 518400000).toISOString(),
        url: 'https://example.com/job6'
      },
      {
        id: '7',
        title: 'Mobile App Developer',
        description: 'Looking for an experienced mobile developer to create and maintain our iOS and Android applications. React Native experience preferred.',
        company: {
          name: 'Mobile First Tech',
          logo_url: null,
          website: 'https://mobilefirst.com'
        },
        location: 'Seattle, WA',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_range: '$90k-$130k',
        experience_level: 'mid_level',
        skills: ['React Native', 'iOS', 'Android', 'JavaScript'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        created_at: new Date(Date.now() - 604800000).toISOString(),
        url: 'https://example.com/job7'
      },
      {
        id: '8',
        title: 'Project Manager',
        description: 'Join our team as a project manager to oversee software development projects. Experience with agile methodologies required.',
        company: {
          name: 'Tech Solutions Inc',
          logo_url: null,
          website: 'https://techsolutions.com'
        },
        location: 'Chicago, IL',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_range: '$85k-$115k',
        experience_level: 'mid_level',
        skills: ['Project Management', 'Agile', 'Scrum', 'Leadership'],
        alumni_preferred: false,
        alumni_affiliation: null,
        created_at: new Date(Date.now() - 691200000).toISOString(),
        url: 'https://example.com/job8'
      },
      {
        id: '9',
        title: 'UI/UX Designer',
        description: 'We are looking for a creative UI/UX designer to join our design team. You will work on user interfaces, user experience, and design systems.',
        company: {
          name: 'Design Studio Pro',
          logo_url: null,
          website: 'https://designstudio.com'
        },
        location: 'Los Angeles, CA',
        job_type: 'contract',
        remote_option: 'fully_remote',
        salary_range: '$70k-$90k',
        experience_level: 'mid_level',
        skills: ['Figma', 'Adobe XD', 'Prototyping', 'User Research'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        created_at: new Date(Date.now() - 777600000).toISOString(),
        url: 'https://example.com/job9'
      },
      {
        id: '10',
        title: 'Backend Developer',
        description: 'Seeking a skilled backend developer to build and maintain server-side applications. Experience with Node.js and databases required.',
        company: {
          name: 'Server Side Systems',
          logo_url: null,
          website: 'https://serverside.com'
        },
        location: 'Denver, CO',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_range: '$85k-$120k',
        experience_level: 'mid_level',
        skills: ['Node.js', 'Express', 'MongoDB', 'PostgreSQL'],
        alumni_preferred: false,
        alumni_affiliation: null,
        created_at: new Date(Date.now() - 864000000).toISOString(),
        url: 'https://example.com/job10'
      },
      {
        id: '11',
        title: 'DevOps Engineer',
        description: 'Join our infrastructure team to manage cloud deployments, CI/CD pipelines, and system monitoring.',
        company: {
          name: 'Cloud Infrastructure Co',
          logo_url: null,
          website: 'https://cloudinfra.com'
        },
        location: 'Austin, TX',
        job_type: 'full_time',
        remote_option: 'fully_remote',
        salary_range: '$95k-$135k',
        experience_level: 'senior_level',
        skills: ['AWS', 'Docker', 'Kubernetes', 'CI/CD'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        created_at: new Date(Date.now() - 950400000).toISOString(),
        url: 'https://example.com/job11'
      },
      {
        id: '12',
        title: 'Quality Assurance Engineer',
        description: 'We need a QA engineer to ensure our software meets quality standards through testing and quality control processes.',
        company: {
          name: 'Quality First Tech',
          logo_url: null,
          website: 'https://qualityfirst.com'
        },
        location: 'Portland, OR',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_range: '$70k-$95k',
        experience_level: 'mid_level',
        skills: ['Testing', 'Automation', 'Selenium', 'Quality Assurance'],
        alumni_preferred: false,
        alumni_affiliation: null,
        created_at: new Date(Date.now() - 1036800000).toISOString(),
        url: 'https://example.com/job12'
      }
    ];
    
    // Apply filters if provided
    let filteredJobs = mockJobs;
    
    if (filters.location) {
      filteredJobs = filteredJobs.filter(job => 
        job.location.toLowerCase().includes(filters.location.toLowerCase())
      );
    }
    
    if (filters.job_type) {
      filteredJobs = filteredJobs.filter(job => 
        job.job_type === filters.job_type
      );
    }
    
    if (filters.company_id) {
      filteredJobs = filteredJobs.filter(job => 
        job.company && job.company.name.toLowerCase().includes(filters.company_id.toLowerCase())
      );
    }
    
    // Pagination
    const totalJobs = filteredJobs.length;
    const totalPages = Math.ceil(totalJobs / limit);
    const startIndex = (page - 1) * limit;
    const endIndex = startIndex + limit;
    const paginatedJobs = filteredJobs.slice(startIndex, endIndex);
    
    return {
      jobs: paginatedJobs,
      pagination: {
        currentPage: page,
        totalPages,
        totalJobs,
        hasNextPage: page < totalPages,
        hasPreviousPage: page > 1
      }
    };
  },

  async getJob(jobId) {
    // Mock job data for demo purposes
    const mockJobs = [
      {
        id: '1',
        title: 'Senior Frontend Developer',
        description: 'We are looking for an experienced frontend developer to join our growing team. You will be working on cutting-edge web applications using React, TypeScript, and modern CSS frameworks.\n\nResponsibilities:\n- Develop responsive web applications using React and TypeScript\n- Collaborate with design and backend teams\n- Write clean, maintainable code\n- Participate in code reviews and mentoring\n\nRequirements:\n- 5+ years of experience with frontend development\n- Strong proficiency in React, TypeScript, and modern CSS\n- Experience with state management libraries\n- Knowledge of web performance optimization\n- Excellent communication and teamwork skills',
        company: {
          name: 'Tech Innovations Inc.',
          logo_url: null,
          website: 'https://techinnovations.com',
          description: 'A leading technology company specializing in innovative web solutions.',
          location: 'New York, NY',
          industry: 'Technology'
        },
        location: 'New York, NY',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_min: 80000,
        salary_max: 120000,
        salary_range: '$80k-$120k',
        experience_level: 'senior_level',
        skills: ['React', 'TypeScript', 'CSS', 'JavaScript', 'State Management'],
        required_skills: ['React', 'TypeScript'],
        preferred_skills: ['CSS', 'JavaScript', 'State Management'],
        responsibilities: ['Develop web applications', 'Code reviews', 'Mentoring'],
        alumni_preferred: true,
        alumni_affiliation: 'Purple Knights Alumni Network',
        deadline: new Date(Date.now() + 2592000000).toISOString(),
        created_at: new Date(Date.now() - 86400000).toISOString(),
        url: 'https://example.com/job1'
      },
      {
        id: '2',
        title: 'Product Manager',
        description: 'Join our product team to help shape the future of our platform. You will work closely with engineering, design, and business teams to deliver exceptional user experiences.\n\nResponsibilities:\n- Define product requirements and user stories\n- Work with cross-functional teams to deliver features\n- Analyze user feedback and market trends\n- Manage product roadmap and prioritization\n\nRequirements:\n- 3+ years of product management experience\n- Strong analytical and communication skills\n- Experience with agile methodologies\n- Ability to work with technical and non-technical stakeholders',
        company: {
          name: 'Digital Solutions LLC',
          logo_url: null,
          website: 'https://digitalsolutions.com',
          description: 'A digital transformation company helping businesses leverage technology.',
          location: 'San Francisco, CA',
          industry: 'Software'
        },
        location: 'San Francisco, CA',
        job_type: 'full_time',
        remote_option: 'fully_remote',
        salary_min: 100000,
        salary_max: 150000,
        salary_range: '$100k-$150k',
        experience_level: 'mid_level',
        skills: ['Product Management', 'Agile', 'Analytics', 'Communication'],
        required_skills: ['Product Management'],
        preferred_skills: ['Agile', 'Analytics', 'Communication'],
        responsibilities: ['Product strategy', 'User research', 'Stakeholder management'],
        alumni_preferred: false,
        alumni_affiliation: null,
        deadline: new Date(Date.now() + 2592000000).toISOString(),
        created_at: new Date(Date.now() - 172800000).toISOString(),
        url: 'https://example.com/job2'
      }
    ];
    
    const job = mockJobs.find(j => j.id === jobId);
    
    if (!job) {
      throw new Error('Job not found');
    }
    
    return job;
  },

  async createJob(job) {
    const { data, error } = await supabase
      .from('jobs')
      .insert(job)
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  // Job Applications - Updated for new schema
  async getApplications(userId) {
    const { data, error } = await supabase
      .from('applications')
      .select('*, job:job_postings(title, location, job_type, employer:profiles(company_name))')
      .eq('profile_id', userId)
      .order('application_date', { ascending: false });
    if (error) throw error;
    return data;
  },

  async createApplication(jobId, userId, coverNote = '') {
    const { data, error } = await supabase
      .from('applications')
      .insert({ job_id: jobId, profile_id: userId, status: 'applied', cover_note: coverNote })
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  // Company functions
  async getCompany(companyId) {
    const { data, error } = await supabase
      .from('companies')
      .select('*')
      .eq('id', companyId)
      .single();
    if (error) throw error;
    return data;
  },

  async searchCompanies(searchTerm) {
    const { data, error } = await supabase
      .from('companies')
      .select('*')
      .ilike('name', `%${searchTerm}%`)
      .order('name', { ascending: true })
      .limit(10);
    if (error) throw error;
    return data;
  },

  async createCompany(company) {
    const { data, error } = await supabase
      .from('companies')
      .insert(company)
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  async getCompanyJobs(companyId) {
    const { data, error } = await supabase
      .from('jobs')
      .select('*, posted_by:users(first_name, last_name, profile_image_url)')
      .eq('company_id', companyId)
      .eq('is_active', true)
      .order('created_at', { ascending: false });
    if (error) throw error;
    return data;
  },

  async getCompanyUsers(companyId) {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('current_company_id', companyId)
      .order('first_name', { ascending: true });
    if (error) throw error;
    return data;
  },

  // Messages - Updated for new schema
  async getMessages(userId, otherUserId = null) {
    let query = supabase
      .from('messages')
      .select('*');

    if (otherUserId) {
      // Get messages between two specific users
      query = query.or(`(from_user_id.eq.${userId},to_user_id.eq.${otherUserId}),from_user_id.eq.${otherUserId},to_user_id.eq.${userId}`);
    } else {
      // Get all messages involving the current user
      query = query.or(`from_user_id.eq.${userId},to_user_id.eq.${userId}`);
    }

    const { data, error } = await query.order('sent_at', { ascending: true });
    if (error) throw error;
    return data;
  },

  async sendMessage(senderId, receiverId, subject, body, context = null, contextId = null) {
    const { data, error } = await supabase
      .from('messages')
      .insert({ from_user_id: senderId, to_user_id: receiverId, subject, body, context, context_id: contextId })
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  // Analytics Events
  async getAnalyticsEvents(userId, eventType = null, days = 7) {
    let query = supabase
      .from('analytics_events')
      .select('*')
      .eq('user_id', userId)
      .gte('timestamp', new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString())
      .order('timestamp', { ascending: false });
    
    if (eventType) {
      query = query.eq('event_type', eventType);
    }
    
    const { data, error } = await query;
    if (error) throw error;
    return data;
  },

  async trackAnalyticsEvent(userId, eventType, entityType = null, entityId = null, metadata = {}) {
    const { data, error } = await supabase
      .from('analytics_events')
      .insert({ 
        user_id: userId, 
        event_type: eventType, 
        entity_type: entityType, 
        entity_id: entityId, 
        metadata 
      })
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  async getUserAnalyticsSummary(userId, days = 7) {
    const cutoffDate = new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString();
    
    // Get analytics events
    const { data: events, error: eventsError } = await supabase
      .from('analytics_events')
      .select('event_type, entity_type, timestamp')
      .eq('user_id', userId)
      .gte('timestamp', cutoffDate);
    
    if (eventsError) throw eventsError;
    
    // Get applications
    const { data: applications, error: applicationsError } = await supabase
      .from('applications')
      .select('status, application_date')
      .eq('profile_id', userId)
      .gte('application_date', cutoffDate);
    
    if (applicationsError) throw applicationsError;
    
    // Get messages
    const { data: messages, error: messagesError } = await supabase
      .from('messages')
      .select('sent_at, from_user_id, to_user_id')
      .or(`from_user_id.eq.${userId},to_user_id.eq.${userId}`)
      .gte('sent_at', cutoffDate);
    
    if (messagesError) throw messagesError;
    
    // Process analytics events
    const jobViews = events.filter(e => e.event_type === 'job_view' && e.entity_type === 'job').length;
    const jobSaves = events.filter(e => e.event_type === 'job_save' && e.entity_type === 'job').length;
    
    // Process applications
    const appliedApplications = applications.filter(a => a.status === 'applied').length;
    const offeredApplications = applications.filter(a => a.status === 'offer_extended' || a.status === 'offered').length;
    
    // Process messages
    const sentMessages = messages.filter(m => m.from_user_id === userId).length;
    const receivedMessages = messages.filter(m => m.to_user_id === userId).length;
    
    return {
      jobViews,
      jobSaves,
      applications: {
        applied: appliedApplications,
        offered: offeredApplications,
        total: applications.length
      },
      messages: {
        sent: sentMessages,
        received: receivedMessages,
        total: messages.length
      },
      period: `${days} days`
    };
  },

  // Groups (placeholder for future implementation)
  async getGroups(userId) {
    // This would need to be implemented based on your groups schema
    return [];
  },

  async joinGroup(userId, groupId) {
    // This would need to be implemented based on your groups schema
    return null;
  },

  // Job Feed (job postings)
  async getPosts(limit = 20) {
    const { data, error } = await supabase
      .from('job_postings')
      .select('*, employer:profiles(first_name, last_name, profile_photo_url, company_name)')
      .eq('status', 'open')
      .order('posted_date', { ascending: false })
      .limit(limit);
    if (error) throw error;
    return data;
  },

  async createPost(userId, postType, jobId = null, content = null, fileUrl = null) {
    // This would create a job posting, not a social post
    const { data, error } = await supabase
      .from('job_postings')
      .insert({ 
        employer_id: userId, 
        title: content?.substring(0, 100) || 'New Position', 
        description: content,
        job_type: 'full_time',
        status: 'open',
        posted_date: new Date().toISOString()
      })
      .select()
      .single();
    if (error) throw error;
    return data;
  },
};

export default supabase;
