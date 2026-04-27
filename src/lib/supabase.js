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
  async getJobs(filters = {}) {
    let query = supabase
      .from('jobs')
      .select('*, company:companies(name, location), posted_by:users(first_name, last_name, profile_image_url)')
      .eq('is_active', true);

    if (filters.company_id) query = query.eq('company_id', filters.company_id);
    if (filters.job_type) query = query.eq('job_type', filters.job_type);
    if (filters.location) query = query.ilike('location', `%${filters.location}%`);

    const { data, error } = await query.order('created_at', { ascending: false });
    if (error) throw error;
    return data;
  },

  async getJob(jobId) {
    const { data, error } = await supabase
      .from('jobs')
      .select('*, company:companies(name, description, location), posted_by:users(first_name, last_name, profile_image_url, headline)')
      .eq('id', jobId)
      .single();
    if (error) throw error;
    return data;
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

  // Job Applications
  async getApplications(userId) {
    const { data, error } = await supabase
      .from('job_applications')
      .select('*, job:jobs(title, location, job_type, company:companies(name))')
      .eq('applicant_id', userId)
      .order('applied_at', { ascending: false });
    if (error) throw error;
    return data;
  },

  async createApplication(jobId, userId) {
    const { data, error } = await supabase
      .from('job_applications')
      .insert({ job_id: jobId, applicant_id: userId, status: 'applied' })
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

  // Messages
  async getMessages(userId, otherUserId = null) {
    let query = supabase
      .from('messages')
      .select('*, sender:users(first_name, last_name, profile_image_url), receiver:users(first_name, last_name, profile_image_url)')
      .or(`sender_id.eq.${userId},receiver_id.eq.${userId}`);

    if (otherUserId) {
      query = query.or(`sender_id.eq.${otherUserId},receiver_id.eq.${otherUserId}`);
    }

    const { data, error } = await query.order('created_at', { ascending: true });
    if (error) throw error;
    return data;
  },

  async sendMessage(senderId, receiverId, content) {
    const { data, error } = await supabase
      .from('messages')
      .insert({ sender_id: senderId, receiver_id: receiverId, content, is_read: false })
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  // Groups
  async getGroups(userId) {
    const { data, error } = await supabase
      .from('user_groups')
      .select('group:groups(*)')
      .eq('user_id', userId);
    if (error) throw error;
    return data?.map(ug => ug.group);
  },

  async joinGroup(userId, groupId) {
    const { data, error } = await supabase
      .from('user_groups')
      .insert({ user_id: userId, group_id: groupId })
      .select()
      .single();
    if (error) throw error;
    return data;
  },

  // Posts (job feed)
  async getPosts(limit = 20) {
    const { data, error } = await supabase
      .from('posts')
      .select('*, user:users(first_name, last_name, profile_image_url, current_company_id), job:jobs(title, company_id, location)')
      .order('created_at', { ascending: false })
      .limit(limit);
    if (error) throw error;
    return data;
  },

  async createPost(userId, postType, jobId = null, content = null, fileUrl = null) {
    const { data, error } = await supabase
      .from('posts')
      .insert({ user_id: userId, post_type: postType, job_id: jobId, content, file_url: fileUrl })
      .select()
      .single();
    if (error) throw error;
    return data;
  },
};

export default supabase;
