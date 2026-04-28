// Node.js script to seed working applications data
// Run with: node scripts/seed-working-data.js

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

async function seedWorkingData() {
  try {
    console.log('🌱 Seeding working applications data...');
    
    // Step 1: Create company profiles first
    console.log('\n🏢 Creating company profiles...');
    
    const companies = [
      {
        id: generateUUID(),
        name: 'Tech Innovations Inc.',
        industry: 'Technology',
        description: 'A cutting-edge technology company specializing in web and mobile applications.',
        website: 'https://techinnovations.com',
        location: 'New Orleans, LA',
        size: '50-100'
      },
      {
        id: generateUUID(),
        name: 'Gulf Marketing Group',
        industry: 'Marketing & Advertising',
        description: 'A full-service marketing agency helping businesses grow through innovative digital strategies.',
        website: 'https://gulfmarketing.com',
        location: 'New Orleans, LA',
        size: '25-50'
      },
      {
        id: generateUUID(),
        name: 'Data Solutions LLC',
        industry: 'Data Analytics',
        description: 'Specializes in helping businesses make data-driven decisions through advanced analytics.',
        website: 'https://datasolutions.com',
        location: 'Remote',
        size: '10-25'
      }
    ];
    
    const createdCompanies = [];
    for (const company of companies) {
      // Try to insert into company_profiles table
      const { data, error } = await supabaseAdmin
        .from('company_profiles')
        .upsert(company, { onConflict: 'id' })
        .select()
        .single();
      
      if (error) {
        console.error(`Error creating company ${company.name}:`, error);
        // If company_profiles doesn't exist, try using profiles table
        const profileData = {
          id: company.id,
          first_name: company.name.split(' ')[0],
          last_name: company.name.split(' ')[1] || 'Company',
          role: 'alumni',
          headline: `${company.industry} Company`,
          bio: company.description,
          email: `careers@${company.name.toLowerCase().replace(/\s+/g, '')}.com`,
          graduation_year: null,
          verified_alumni: false,
          phone: '+1-504-555-0101',
          linkedin_url: `https://linkedin.com/company/${company.name.toLowerCase().replace(/\s+/g, '')}`,
          portfolio_url: company.website,
          resume_url: null,
          allow_employer_contact: null,
          academic_achievements: []
        };
        
        const { data: profileResult, error: profileError } = await supabaseAdmin
          .from('profiles')
          .upsert(profileData, { onConflict: 'id' })
          .select()
          .single();
        
        if (profileError) {
          console.error(`Error creating company profile ${company.name}:`, profileError);
        } else {
          console.log(`✅ Created company profile: ${company.name}`);
          createdCompanies.push({ ...company, profile_id: profileResult.id });
        }
      } else {
        console.log(`✅ Created company: ${company.name}`);
        createdCompanies.push(data);
      }
    }
    
    // Step 2: Create job postings with company_id
    console.log('\n💼 Creating job postings...');
    
    const jobs = [
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
        posted_by_user_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
        company_id: createdCompanies[0]?.id || createdCompanies[0]?.profile_id
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
        posted_by_user_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
        company_id: createdCompanies[1]?.id || createdCompanies[1]?.profile_id
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
        posted_by_user_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
        company_id: createdCompanies[0]?.id || createdCompanies[0]?.profile_id
      }
    ];
    
    const createdJobs = [];
    for (const job of jobs) {
      const { data, error } = await supabaseAdmin
        .from('job_postings')
        .upsert(job, { onConflict: 'id' })
        .select()
        .single();
      
      if (error) {
        console.error(`Error creating job ${job.title}:`, error);
      } else {
        console.log(`✅ Created job: ${job.title}`);
        createdJobs.push(data);
      }
    }
    
    // Step 3: Create applications for Kevin
    console.log('\n📋 Creating applications for hirekevinrainey@gmail.com...');
    
    const applications = [
      {
        id: generateUUID(),
        job_id: createdJobs[0]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
        application_type: 'direct_apply',
        status: 'interviewing',
        cover_note: 'As a passionate frontend developer with experience in React and modern web technologies, I\'m excited about this opportunity. I\'ve been following your company\'s work and believe my skills in JavaScript, CSS, and responsive design would make me a valuable addition to your team.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 8 * 24 * 60 * 60 * 1000).toISOString()
      },
      {
        id: generateUUID(),
        job_id: createdJobs[1]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
        application_type: 'system_match',
        status: 'applied',
        cover_note: 'While my background is primarily in technology, I have strong communication skills and experience with content creation that would transfer well to marketing. I\'m interested in exploring how my technical background could bring a unique perspective to your marketing team.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 6 * 24 * 60 * 60 * 1000).toISOString()
      },
      {
        id: generateUUID(),
        job_id: createdJobs[2]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93',
        application_type: 'direct_apply',
        status: 'offer_extended',
        cover_note: 'I\'m interested in this internship opportunity to gain more hands-on experience in software development. As a recent graduate, I\'m eager to learn from experienced developers and contribute to real projects.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 4 * 24 * 60 * 60 * 1000).toISOString()
      }
    ];
    
    for (const application of applications) {
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
    
    // Step 4: Verify data was created
    console.log('\n🔍 Verifying seeded data...');
    
    const { data: jobsResult, error: jobsError } = await supabaseAdmin
      .from('job_postings')
      .select('id, title, status')
      .eq('status', 'open');
    
    if (jobsError) {
      console.error('Error verifying jobs:', jobsError);
    } else {
      console.log(`✅ Found ${jobsResult.length} open jobs in database`);
      jobsResult.forEach(job => {
        console.log(`   - ${job.title}: ${job.status}`);
      });
    }
    
    const { data: applicationsResult, error: appsError } = await supabaseAdmin
      .from('applications')
      .select('id, status, job_id')
      .eq('profile_id', '752e7f23-e166-43a7-bdd2-793a9c531b93');
    
    if (appsError) {
      console.error('Error verifying applications:', appsError);
    } else {
      console.log(`✅ Found ${applicationsResult.length} applications for hirekevinrainey@gmail.com`);
      applicationsResult.forEach(app => {
        console.log(`   - ${app.status}: Job ${app.job_id}`);
      });
    }
    
    console.log('\n🎉 Working applications data seeded successfully!');
    console.log('\n📊 Summary:');
    console.log(`   - ${createdCompanies.length} company profiles created`);
    console.log(`   - ${createdJobs.length} job postings created`);
    console.log(`   - ${applications.length} applications created for hirekevinrainey@gmail.com`);
    console.log('\n🚀 You can now check the applications page in the app!');
    
  } catch (error) {
    console.error('❌ Failed to seed working data:', error.message);
    process.exit(1);
  }
}

seedWorkingData();
