// Node.js script to query applications by hirekevinrainey@gmail.com
// Run with: node scripts/query-kevin-applications.js

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '.env' });

const supabaseAdmin = createClient(
  process.env.VITE_SUPABASE_URL,
  process.env.VITE_SUPABASE_SERVICE_ROLE_KEY,
  {
    auth: {
      autoRefreshToken: false,
      persistSession: false
    }
  }
);

async function queryKevinApplications() {
  try {
    console.log('Querying applications for hirekevinrainey@gmail.com...');
    
    // First, get the user by email
    const { data: users, error: userError } = await supabaseAdmin.auth.admin.listUsers();
    
    if (userError) {
      console.error('Error listing users:', userError);
      throw userError;
    }
    
    const kevinUser = users.users.find(user => user.email === 'hirekevinrainey@gmail.com');
    
    if (!kevinUser) {
      console.log('❌ No user found with email hirekevinrainey@gmail.com');
      
      // Let's also check for Kevin by ID from the update script
      const kevinUserId = 'a7893656-1eac-42b8-aeb0-d009209bc1ad';
      const { data: userData, error: userDataError } = await supabaseAdmin.auth.admin.getUserById(kevinUserId);
      
      if (userDataError) {
        console.error('Error getting user by ID:', userDataError);
        return;
      }
      
      console.log(`Found Kevin by ID: ${userData.user.email}`);
      
      // Query applications for this user ID
      await queryApplicationsForUser(userData.user.id, userData.user.email);
      return;
    }
    
    console.log(`✅ Found user: ${kevinUser.email} (ID: ${kevinUser.id})`);
    
    // Query applications for this user
    await queryApplicationsForUser(kevinUser.id, kevinUser.email);
    
  } catch (error) {
    console.error('❌ Failed to query applications:', error.message);
    process.exit(1);
  }
}

async function queryApplicationsForUser(userId, email) {
  try {
    console.log(`\nQuerying applications for user ID: ${userId}`);
    
    // Query applications table
    const { data: applications, error: applicationsError } = await supabaseAdmin
      .from('applications')
      .select(`
        *,
        job_postings (
          id,
          title,
          description,
          location,
          job_type,
          status,
          posted_date
        ),
        profiles!applications_profile_id_fkey (
          id,
          first_name,
          last_name,
          email
        )
      `)
      .eq('profile_id', userId);
    
    if (applicationsError) {
      console.error('Error querying applications:', applicationsError);
      throw applicationsError;
    }
    
    if (!applications || applications.length === 0) {
      console.log('❌ No applications found for this user');
      
      // Let's also check if there are any applications at all in the system
      const { data: allApplications, error: allAppsError } = await supabaseAdmin
        .from('applications')
        .select(`
          *,
          job_postings (
            id,
            title,
            location,
            job_type,
            status,
            posted_date
          ),
          profiles!applications_profile_id_fkey (
            id,
            first_name,
            last_name,
            email
          )
        `)
        .limit(10);
      
      if (allAppsError) {
        console.error('Error checking all applications:', allAppsError);
      } else {
        console.log(`\nTotal applications in system: ${allApplications?.length || 0}`);
        
        if (allApplications && allApplications.length > 0) {
          console.log('\nApplications in system:');
          allApplications.forEach((app, index) => {
            console.log(`  ${index + 1}. ${app.profiles?.first_name} ${app.profiles?.last_name} (${app.profiles?.email}) - ${app.job_postings?.title || 'Unknown Job'} - Status: ${app.status}`);
          });
        }
      }
      
      return;
    }
    
    console.log(`✅ Found ${applications.length} applications for ${email}:`);
    console.log('\n' + '='.repeat(80));
    
    applications.forEach((app, index) => {
      console.log(`\nApplication ${index + 1}:`);
      console.log(`  ID: ${app.id}`);
      console.log(`  Status: ${app.status}`);
      console.log(`  Application Date: ${app.application_date || app.created_at}`);
      console.log(`  Job Title: ${app.job_postings?.title || 'N/A'}`);
      console.log(`  Company: ${app.job_postings?.company_name || 'N/A'}`);
      console.log(`  Location: ${app.job_postings?.location || 'N/A'}`);
      console.log(`  Job Type: ${app.job_postings?.job_type || 'N/A'}`);
      console.log(`  Cover Note: ${app.cover_note || 'N/A'}`);
      console.log(`  Resume URL: ${app.resume_url || 'N/A'}`);
      console.log(`  Application Type: ${app.application_type || 'N/A'}`);
      console.log('  ' + '-'.repeat(40));
    });
    
    // Also check profile information
    const { data: profile, error: profileError } = await supabaseAdmin
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .single();
    
    if (profileError) {
      console.error('Error querying profile:', profileError);
    } else if (profile) {
      console.log('\nProfile Information:');
      console.log(`  Name: ${profile.first_name} ${profile.last_name}`);
      console.log(`  Role: ${profile.role}`);
      console.log(`  Headline: ${profile.headline || 'N/A'}`);
      console.log(`  Graduation Year: ${profile.graduation_year || 'N/A'}`);
      console.log(`  Verified Alumni: ${profile.verified_alumni || 'N/A'}`);
    }
    
  } catch (error) {
    console.error('❌ Failed to query applications for user:', error.message);
    throw error;
  }
}

async function queryAvailableJobs() {
  try {
    console.log('\n' + '='.repeat(80));
    console.log('Querying available jobs in the system...');
    
    // Query all available job postings
    const { data: jobs, error: jobsError } = await supabaseAdmin
      .from('job_postings')
      .select('*')
      .eq('status', 'open')
      .order('posted_date', { ascending: false })
      .limit(20);
    
    if (jobsError) {
      console.error('Error querying jobs:', jobsError);
      throw jobsError;
    }
    
    if (!jobs || jobs.length === 0) {
      console.log('❌ No open job postings found in the system');
      return;
    }
    
    console.log(`✅ Found ${jobs.length} open job postings:`);
    console.log('\n' + '-'.repeat(80));
    
    jobs.forEach((job, index) => {
      console.log(`\nJob ${index + 1}:`);
      console.log(`  ID: ${job.id}`);
      console.log(`  Title: ${job.title}`);
      console.log(`  Description: ${job.description?.substring(0, 200) || 'N/A'}${job.description?.length > 200 ? '...' : ''}`);
      console.log(`  Company: ${job.profiles?.company_name || 'N/A'}`);
      console.log(`  Industry: ${job.profiles?.industry || 'N/A'}`);
      console.log(`  Location: ${job.location || 'N/A'}`);
      console.log(`  Job Type: ${job.job_type || 'N/A'}`);
      console.log(`  Remote Option: ${job.remote_option || 'N/A'}`);
      console.log(`  Salary Range: ${job.salary_min ? `$${job.salary_min.toLocaleString()}${job.salary_max ? ` - $${job.salary_max.toLocaleString()}` : ''}` : 'N/A'}`);
      console.log(`  Experience Level: ${job.experience_level || 'N/A'}`);
      console.log(`  Alumni Preferred: ${job.alumni_preferred || false}`);
      console.log(`  Posted Date: ${job.posted_date || 'N/A'}`);
      console.log('  ' + '-'.repeat(40));
    });
    
  } catch (error) {
    console.error('❌ Failed to query available jobs:', error.message);
  }
}

// Run both queries
queryKevinApplications().then(() => {
  queryAvailableJobs();
});
