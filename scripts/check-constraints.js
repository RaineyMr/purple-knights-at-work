// Node.js script to check database constraints and valid values
// Run with: node scripts/check-constraints.js

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

async function checkConstraints() {
  try {
    console.log('🔍 Checking database constraints...');
    
    // Check existing profiles to see valid roles
    console.log('\n👤 Checking existing profiles for valid roles:');
    const { data: existingProfiles, error: profilesError } = await supabaseAdmin
      .from('profiles')
      .select('role')
      .limit(10);
    
    if (profilesError) {
      console.error('Error getting profiles:', profilesError);
    } else {
      const uniqueRoles = [...new Set(existingProfiles?.map(p => p.role) || [])];
      console.log('Valid roles found:', uniqueRoles);
    }
    
    // Check job_postings table structure by trying to insert a minimal record
    console.log('\n💼 Checking job_postings table structure:');
    
    // First, let's see what columns exist by getting the table info
    try {
      const { data: sampleJob, error: jobError } = await supabaseAdmin
        .from('job_postings')
        .select('*')
        .limit(1);
      
      if (jobError && jobError.code === 'PGRST116') {
        console.log('Table is empty, checking column names via error...');
        
        // Try to insert a minimal record to see what columns are required
        const minimalJob = {
          title: 'Test Job',
          description: 'Test description',
          location: 'Test Location',
          job_type: 'full_time',
          status: 'open',
          posted_date: new Date().toISOString()
        };
        
        const { data: testData, error: testError } = await supabaseAdmin
          .from('job_postings')
          .insert(minimalJob)
          .select()
          .single();
        
        if (testError) {
          console.log('Required columns error:', testError.message);
          if (testError.details) {
            console.log('Error details:', testError.details);
          }
        } else {
          console.log('Successfully inserted test job, columns:', Object.keys(testData));
          
          // Clean up the test record
          await supabaseAdmin
            .from('job_postings')
            .delete()
            .eq('id', testData.id);
        }
      } else if (sampleJob && sampleJob.length > 0) {
        console.log('Sample job columns:', Object.keys(sampleJob[0]));
      }
    } catch (err) {
      console.error('Error checking job_postings:', err.message);
    }
    
    // Check applications table structure
    console.log('\n📄 Checking applications table structure:');
    
    try {
      const { data: sampleApp, error: appError } = await supabaseAdmin
        .from('applications')
        .select('*')
        .limit(1);
      
      if (appError && appError.code === 'PGRST116') {
        console.log('Applications table is empty');
        
        // Try to insert a minimal record to see what columns are required
        const minimalApp = {
          profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
          status: 'applied',
          application_date: new Date().toISOString()
        };
        
        const { data: testAppData, error: testAppError } = await supabaseAdmin
          .from('applications')
          .insert(minimalApp)
          .select()
          .single();
        
        if (testAppError) {
          console.log('Required columns error:', testAppError.message);
          if (testAppError.details) {
            console.log('Error details:', testAppError.details);
          }
        } else {
          console.log('Successfully inserted test application, columns:', Object.keys(testAppData));
          
          // Clean up the test record
          await supabaseAdmin
            .from('applications')
            .delete()
            .eq('id', testAppData.id);
        }
      } else if (sampleApp && sampleApp.length > 0) {
        console.log('Sample application columns:', Object.keys(sampleApp[0]));
      }
    } catch (err) {
      console.error('Error checking applications:', err.message);
    }
    
  } catch (error) {
    console.error('❌ Failed to check constraints:', error.message);
    process.exit(1);
  }
}

checkConstraints();
