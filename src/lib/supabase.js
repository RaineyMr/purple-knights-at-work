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
  },
});

// Database helper functions
export const db = {
  // Profile functions
  async getProfile(userId) {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .single();
    
    if (error) throw error;
    return data;
  },

  async updateProfile(userId, updates) {
    const { data, error } = await supabase
      .from('profiles')
      .update(updates)
      .eq('id', userId)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  // Skills functions
  async getSkills(profileId) {
    const { data, error } = await supabase
      .from('alumni_skills')
      .select('*')
      .eq('profile_id', profileId)
      .order('created_at', { ascending: false });
    
    if (error) throw error;
    return data;
  },

  async addSkill(profileId, skill) {
    const { data, error } = await supabase
      .from('alumni_skills')
      .insert({
        profile_id: profileId,
        ...skill,
      })
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  async deleteSkill(skillId) {
    const { error } = await supabase
      .from('alumni_skills')
      .delete()
      .eq('id', skillId);
    
    if (error) throw error;
  },

  // Job postings functions
  async getJobPostings(filters = {}) {
    let query = supabase
      .from('job_postings')
      .select('*')
      .eq('status', 'open');

    // Apply filters
    if (filters.industry) {
      query = query.eq('industry', filters.industry);
    }
    if (filters.job_type) {
      query = query.eq('job_type', filters.job_type);
    }
    if (filters.location) {
      query = query.ilike('location', `%${filters.location}%`);
    }

    const { data, error } = await query
      .order('posted_date', { ascending: false });
    
    if (error) throw error;
    return data;
  },

  async getJobPosting(jobId) {
    const { data, error } = await supabase
      .from('job_postings')
      .select('*')
      .eq('id', jobId)
      .single();
    
    if (error) throw error;
    return data;
  },

  async createJobPosting(job) {
    const { data, error } = await supabase
      .from('job_postings')
      .insert(job)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  // Applications functions
  async getApplications(profileId) {
    const { data, error } = await supabase
      .from('applications')
      .select(`
        *,
        job_postings (
          title,
          company_name,
          location
        )
      `)
      .eq('profile_id', profileId)
      .order('application_date', { ascending: false });
    
    if (error) throw error;
    return data;
  },

  async createApplication(application) {
    const { data, error } = await supabase
      .from('applications')
      .insert(application)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  // Matches functions
  async getMatches(profileId) {
    const { data, error } = await supabase
      .from('matches')
      .select(`
        *,
        job_postings (
          title,
          company_name,
          location,
          salary_min,
          salary_max
        )
      `)
      .eq('profile_id', profileId)
      .order('match_score', { ascending: false })
      .limit(20);
    
    if (error) throw error;
    return data;
  },

  async getJobMatches(jobId) {
    const { data, error } = await supabase
      .from('matches')
      .select(`
        *,
        profiles (
          first_name,
          last_name,
          headline,
          graduation_year
        )
      `)
      .eq('job_id', jobId)
      .order('match_score', { ascending: false })
      .limit(10);
    
    if (error) throw error;
    return data;
  },

  // Messages functions
  async getMessages(userId) {
    const { data, error } = await supabase
      .from('messages')
      .select('*')
      .or(`from_user_id.eq.${userId},to_user_id.eq.${userId}`)
      .order('sent_at', { ascending: false });
    
    if (error) throw error;
    return data;
  },

  async sendMessage(message) {
    const { data, error } = await supabase
      .from('messages')
      .insert(message)
      .select()
      .single();
    
    if (error) throw error;
    return data;
  },

  // Mentorship functions
  async getMentorships(profileId) {
    const { data, error } = await supabase
      .from('mentorship_records')
      .select(`
        *,
        mentor:profiles!mentorship_records_mentor_id_fkey (
          first_name,
          last_name,
          headline
        ),
        mentee:profiles!mentorship_records_mentee_id_fkey (
          first_name,
          last_name,
          headline
        )
      `)
      .or(`mentor_id.eq.${profileId},mentee_id.eq.${profileId}`)
      .order('matched_date', { ascending: false });
    
    if (error) throw error;
    return data;
  },

  // Analytics functions
  async trackEvent(event) {
    const { error } = await supabase
      .from('analytics_events')
      .insert(event);
    
    if (error) throw error;
  },
};

export default supabase;
