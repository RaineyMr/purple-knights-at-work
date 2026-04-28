import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.REACT_APP_SUPABASE_URL;
const supabaseAnonKey = process.env.REACT_APP_SUPABASE_ANON_KEY;


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
    // Use secure API instead of direct Supabase access
    const { jobsAPI } = await import('../api/jobs');
    const response = await jobsAPI.getJobs(page, limit);
    
    // Apply filters if provided
    let filteredJobs = response.jobs;
    
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
    
    // Return in the same format as the API
    return {
      jobs: filteredJobs,
      pagination: response.pagination
    };
  },

  async getJob(jobId) {
    // Use secure API instead of direct Supabase access
    const { jobsAPI } = await import('../api/jobs');
    const job = await jobsAPI.getJob(jobId);
    
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
      .select('*, sender:profiles(first_name, last_name, profile_photo_url), receiver:profiles(first_name, last_name, profile_photo_url)')
      .or(`from_user_id.eq.${userId},to_user_id.eq.${userId}`);

    if (otherUserId) {
      query = query.or(`from_user_id.eq.${otherUserId},to_user_id.eq.${otherUserId}`);
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
