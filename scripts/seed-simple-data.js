// Node.js script to seed simple applications data
// Run with: node scripts/seed-simple-data.js

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

// Generate UUID
const generateUUID = () => {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = Math.random() * 16 | 0;
    const v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
};

async function seedSimpleData() {
  try {
    console.log('🌱 Seeding simple applications data...');
    
    // Step 1: Create a simple job posting without company constraints
    console.log('\n💼 Creating simple job postings...');
    
    const simpleJobs = [
      {
        id: generateUUID(),
        title: 'Frontend Developer',
        description: 'We are looking for an experienced frontend developer to join our growing team. You will be working on cutting-edge web applications using React, TypeScript, and modern CSS frameworks.',
        location: 'New Orleans, LA',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_min: 65000,
        salary_max: 85000,
        experience_level: 'mid_level',
        required_skills: ['JavaScript', 'React', 'CSS', 'HTML'],
        preferred_skills: ['TypeScript', 'Next.js', 'Node.js', 'Git'],
        alumni_preferred: true,
        status: 'open',
        posted_date: new Date(Date.now() - 10 * 24 * 60 * 60 * 1000).toISOString(),
        posted_by_user_id: '752e7f23-e166-43a7-bdd2-793a9c531b93' // Kevin's user ID as poster
      },
      {
        id: generateUUID(),
        title: 'Marketing Coordinator',
        description: 'Join our marketing team to help promote our products and services. You will be responsible for social media management, content creation, and campaign coordination.',
        location: 'Baton Rouge, LA',
        job_type: 'full_time',
        remote_option: 'on_site',
        salary_min: 45000,
        salary_max: 60000,
        experience_level: 'entry_level',
        required_skills: ['Marketing', 'Social Media', 'Content Creation'],
        preferred_skills: ['Analytics', 'SEO', 'Graphic Design'],
        alumni_preferred: true,
        status: 'open',
        posted_date: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString(),
        posted_by_user_id: '752e7f23-e166-43a7-bdd2-793a9c531b93' // Kevin's user ID as poster
      },
      {
        id: generateUUID(),
        title: 'Software Engineering Intern',
        description: 'Paid summer internship for students or recent graduates. Gain hands-on experience in software development while working on real projects.',
        location: 'New Orleans, LA',
        job_type: 'internship',
        remote_option: 'hybrid',
        salary_min: 40000,
        salary_max: 45000,
        experience_level: 'entry_level',
        required_skills: ['Programming', 'Problem Solving', 'Team Work'],
        preferred_skills: ['JavaScript', 'React', 'Git'],
        alumni_preferred: true,
        status: 'open',
        posted_date: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000).toISOString(),
        posted_by_user_id: '752e7f23-e166-43a7-bdd2-793a9c531b93' // Kevin's user ID as poster
      }
    ];
    
    const createdJobs = [];
    for (const job of simpleJobs) {
      // Try to create job without company_id first
      const jobToInsert = { ...job };
      delete jobToInsert.company_id; // Remove company_id to avoid foreign key constraint
      
      const { data, error } = await supabaseAdmin
        .from('job_postings')
        .upsert(jobToInsert, { onConflict: 'id' })
        .select()
        .single();
      
      if (error) {
        console.error(`Error creating job ${job.title}:`, error);
      } else {
        console.log(`✅ Created job: ${job.title}`);
        createdJobs.push(data);
      }
    }
    
    // Step 2: Create applications for Kevin
    console.log('\n📋 Creating applications for hirekevinrainey@gmail.com...');
    
    const kevinApplications = [
      {
        id: generateUUID(),
        job_id: createdJobs[0]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93', // Kevin's user ID
        application_type: 'direct_apply',
        status: 'interviewing',
        cover_note: 'As a passionate frontend developer with experience in React and modern web technologies, I\'m excited about this opportunity. I\'ve been following your company\'s work and believe my skills in JavaScript, CSS, and responsive design would make me a valuable addition to your team.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 8 * 24 * 60 * 60 * 1000).toISOString()
      },
      {
        id: generateUUID(),
        job_id: createdJobs[1]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93', // Kevin's user ID
        application_type: 'system_match',
        status: 'applied',
        cover_note: 'While my background is primarily in technology, I have strong communication skills and experience with content creation that would transfer well to marketing. I\'m interested in exploring how my technical background could bring a unique perspective to your marketing team.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 6 * 24 * 60 * 60 * 1000).toISOString()
      },
      {
        id: generateUUID(),
        job_id: createdJobs[2]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93', // Kevin's user ID
        application_type: 'direct_apply',
        status: 'offer_extended',
        cover_note: 'I\'m interested in this internship opportunity to gain more hands-on experience in software development. As a recent graduate, I\'m eager to learn from experienced developers and contribute to real projects.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 4 * 24 * 60 * 60 * 1000).toISOString()
      }
    ];
    
    for (const application of kevinApplications) {
      const { data, error } = await supabaseAdmin
        .from('applications')
        .upsert(application, { onConflict: 'id' })
        .select()
        .single();
      
      if (error) {
        console.error(`Error creating application:`, error);
      } else {
        console.log(`✅ Created application: ${application.status}`);
      }
    }
    
    // Step 3: Verify data was created
    console.log('\n🔍 Verifying seeded data...');
    
    const { data: jobs, error: jobsError } = await supabaseAdmin
      .from('job_postings')
      .select('id, title, status')
      .eq('status', 'open');
    
    if (jobsError) {
      console.error('Error verifying jobs:', jobsError);
    } else {
      console.log(`✅ Found ${jobs.length} open jobs in database`);
      jobs.forEach(job => {
        console.log(`   - ${job.title}: ${job.status}`);
      });
    }
    
    const { data: applications, error: appsError } = await supabaseAdmin
      .from('applications')
      .select('id, status, job_id')
      .eq('profile_id', '752e7f23-e166-43a7-bdd2-793a9c531b93');
    
    if (appsError) {
      console.error('Error verifying applications:', appsError);
    } else {
      console.log(`✅ Found ${applications.length} applications for hirekevinrainey@gmail.com`);
      applications.forEach(app => {
        console.log(`   - ${app.status}: Job ${app.job_id}`);
      });
    }
    
    console.log('\n🎉 Simple applications data seeded successfully!');
    console.log('\n📊 Summary:');
    console.log(`   - ${createdJobs.length} job postings created`);
    console.log(`   - ${kevinApplications.length} applications created for hirekevinrainey@gmail.com`);
    console.log('\n🚀 You can now check the applications page in the app!');
    
  } catch (error) {
    console.error('❌ Failed to seed simple data:', error.message);
    process.exit(1);
  }
}

seedSimpleData();
