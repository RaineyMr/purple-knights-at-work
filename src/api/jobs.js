// Jobs API - Real Supabase data access
import { supabase } from '../lib/supabase';

export const jobsAPI = {
  async getJobs(page = 1, limit = 10) {
    try {
      // Calculate offset for pagination
      const offset = (page - 1) * limit;

      // Get total count for pagination
      const { count, error: countError } = await supabase
        .from('jobs')
        .select('*', { count: 'exact', head: true })
        .eq('is_active', true);

      if (countError) throw countError;

      // Get jobs with company information
      const { data: jobs, error } = await supabase
        .from('jobs')
        .select(`
          *,
          company:companies(name, logo_url, website),
          posted_by:users(first_name, last_name, profile_image_url)
        `)
        .eq('is_active', true)
        .order('created_at', { ascending: false })
        .range(offset, offset + limit - 1);

      if (error) throw error;

      const totalJobs = count || 0;
      const totalPages = Math.ceil(totalJobs / limit);

      return {
        jobs: jobs || [],
        pagination: {
          currentPage: page,
          totalPages,
          totalJobs,
          hasNextPage: page < totalPages,
          hasPreviousPage: page > 1
        }
      };
    } catch (error) {
      console.error('Error fetching jobs:', error);
      throw error;
    }
  },

  async getJob(jobId) {
    try {
      const { data: job, error } = await supabase
        .from('jobs')
        .select(`
          *,
          company:companies(name, logo_url, website, description, location),
          posted_by:users(first_name, last_name, profile_image_url, email)
        `)
        .eq('id', jobId)
        .eq('is_active', true)
        .single();

      if (error) throw error;
      return job;
    } catch (error) {
      console.error('Error fetching job:', error);
      throw error;
    }
  }
};
