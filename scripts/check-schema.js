// Node.js script to check database schema
// Run with: node scripts/check-schema.js

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

async function checkSchema() {
  try {
    console.log('🔍 Checking database schema...');
    
    // Check profiles table structure
    console.log('\n📋 Profiles table columns:');
    const { data: profilesColumns, error: profilesError } = await supabaseAdmin
      .rpc('get_table_columns', { table_name: 'profiles' });
    
    if (profilesError) {
      console.log('Error getting profiles columns, trying alternative method...');
      
      // Try to get a sample record to see the structure
      const { data: sampleProfile, error: sampleError } = await supabaseAdmin
        .from('profiles')
        .select('*')
        .limit(1);
      
      if (sampleError) {
        console.error('Error getting sample profile:', sampleError);
      } else if (sampleProfile && sampleProfile.length > 0) {
        console.log('Sample profile structure:', Object.keys(sampleProfile[0]));
        console.log('Sample profile data:', sampleProfile[0]);
      } else {
        console.log('No profiles found in table');
      }
    } else {
      console.log('Profiles columns:', profilesColumns);
    }
    
    // Check job_postings table structure
    console.log('\n💼 Job postings table columns:');
    const { data: jobColumns, error: jobError } = await supabaseAdmin
      .rpc('get_table_columns', { table_name: 'job_postings' });
    
    if (jobError) {
      console.log('Error getting job_postings columns, trying alternative method...');
      
      // Try to get a sample record to see the structure
      const { data: sampleJob, error: sampleJobError } = await supabaseAdmin
        .from('job_postings')
        .select('*')
        .limit(1);
      
      if (sampleJobError) {
        console.error('Error getting sample job:', sampleJobError);
      } else if (sampleJob && sampleJob.length > 0) {
        console.log('Sample job structure:', Object.keys(sampleJob[0]));
        console.log('Sample job data:', sampleJob[0]);
      } else {
        console.log('No job postings found in table');
      }
    } else {
      console.log('Job postings columns:', jobColumns);
    }
    
    // Check applications table structure
    console.log('\n📄 Applications table columns:');
    const { data: appColumns, error: appError } = await supabaseAdmin
      .rpc('get_table_columns', { table_name: 'applications' });
    
    if (appError) {
      console.log('Error getting applications columns, trying alternative method...');
      
      // Try to get a sample record to see the structure
      const { data: sampleApp, error: sampleAppError } = await supabaseAdmin
        .from('applications')
        .select('*')
        .limit(1);
      
      if (sampleAppError) {
        console.error('Error getting sample application:', sampleAppError);
      } else if (sampleApp && sampleApp.length > 0) {
        console.log('Sample application structure:', Object.keys(sampleApp[0]));
        console.log('Sample application data:', sampleApp[0]);
      } else {
        console.log('No applications found in table');
      }
    } else {
      console.log('Applications columns:', appColumns);
    }
    
    // List all tables
    console.log('\n🗂️ All tables in database:');
    const { data: tables, error: tablesError } = await supabaseAdmin
      .rpc('get_tables_and_views');
    
    if (tablesError) {
      console.error('Error getting tables:', tablesError);
    } else {
      console.log('Available tables:', tables);
    }
    
  } catch (error) {
    console.error('❌ Failed to check schema:', error.message);
    process.exit(1);
  }
}

checkSchema();
