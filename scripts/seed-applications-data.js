// Node.js script to seed fake applications data
// Run with: node scripts/seed-applications-data.js

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

// We'll create the jobs after creating employers to get the correct UUIDs
let fakeJobs = [];

// Generate UUIDs for employers
const generateUUID = () => {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = Math.random() * 16 | 0;
    const v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
};

// Fake employer profiles (using 'alumni' role since 'employer' is not valid)
const fakeEmployers = [
  {
    id: generateUUID(),
    first_name: 'Tech',
    last_name: 'Innovations',
    role: 'alumni',
    headline: 'Leading Technology Company',
    bio: 'Tech Innovations Inc. is a cutting-edge technology company specializing in web and mobile applications.',
    email: 'careers@techinnovations.com',
    graduation_year: null,
    verified_alumni: false,
    phone: '+1-504-555-0101',
    linkedin_url: 'https://linkedin.com/company/tech-innovations',
    portfolio_url: 'https://techinnovations.com',
    resume_url: null,
    allow_employer_contact: null,
    academic_achievements: []
  },
  {
    id: generateUUID(),
    first_name: 'Gulf',
    last_name: 'Marketing',
    role: 'alumni',
    headline: 'Marketing & Advertising Agency',
    bio: 'Gulf Marketing Group is a full-service marketing agency helping businesses grow through innovative digital strategies.',
    email: 'jobs@gulfmarketing.com',
    graduation_year: null,
    verified_alumni: false,
    phone: '+1-504-555-0102',
    linkedin_url: 'https://linkedin.com/company/gulf-marketing',
    portfolio_url: 'https://gulfmarketing.com',
    resume_url: null,
    allow_employer_contact: null,
    academic_achievements: []
  },
  {
    id: generateUUID(),
    first_name: 'Data',
    last_name: 'Solutions',
    role: 'alumni',
    headline: 'Data Analytics Company',
    bio: 'Data Solutions LLC specializes in helping businesses make data-driven decisions through advanced analytics.',
    email: 'hiring@datasolutions.com',
    graduation_year: null,
    verified_alumni: false,
    phone: '+1-504-555-0103',
    linkedin_url: 'https://linkedin.com/company/data-solutions',
    portfolio_url: 'https://datasolutions.com',
    resume_url: null,
    allow_employer_contact: null,
    academic_achievements: []
  }
];

// We'll create the applications after creating jobs to get the correct UUIDs
let fakeApplications = [];

async function seedApplicationsData() {
  try {
    console.log('🌱 Seeding fake applications data...');
    
    // Step 1: Get existing employer profiles
    console.log('\n📝 Getting existing employer profiles...');
    const createdEmployers = [];
    
    for (const employer of fakeEmployers) {
      const { data, error } = await supabaseAdmin
        .from('profiles')
        .select('*')
        .eq('email', employer.email)
        .single();
      
      if (error) {
        console.error(`Error finding employer ${employer.email}:`, error);
      } else {
        console.log(`✅ Found employer: ${employer.first_name} ${employer.last_name}`);
        createdEmployers.push(data);
      }
    }
    
    // Step 2: Create job postings using the created employer IDs
    console.log('\n💼 Creating job postings...');
    fakeJobs = [
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
        company_id: createdEmployers[0]?.id,
        posted_by_user_id: createdEmployers[0]?.id
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
        company_id: createdEmployers[1]?.id,
        posted_by_user_id: createdEmployers[1]?.id
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
        company_id: createdEmployers[0]?.id,
        posted_by_user_id: createdEmployers[0]?.id
      },
      {
        id: generateUUID(),
        title: 'Data Analyst',
        description: 'We are seeking a detail-oriented data analyst to help us make sense of our data and drive business decisions.',
        location: 'Remote',
        job_type: 'full_time',
        remote_option: 'fully_remote',
        salary_min: 55000,
        salary_max: 75000,
        experience_level: 'entry_level',
        required_skills: ['Data Analysis', 'Excel', 'SQL'],
        preferred_skills: ['Python', 'Tableau', 'Statistics'],
        alumni_preferred: false,
        status: 'open',
        posted_date: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000).toISOString(),
        company_id: createdEmployers[2]?.id,
        posted_by_user_id: createdEmployers[2]?.id
      },
      {
        id: generateUUID(),
        title: 'Project Manager',
        description: 'Looking for an organized project manager to oversee software development projects. Experience with agile methodologies required.',
        location: 'Houston, TX',
        job_type: 'full_time',
        remote_option: 'hybrid',
        salary_min: 70000,
        salary_max: 90000,
        experience_level: 'mid_level',
        required_skills: ['Project Management', 'Agile', 'Communication'],
        preferred_skills: ['Scrum', 'JIRA', 'Leadership'],
        alumni_preferred: true,
        status: 'open',
        posted_date: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString(),
        company_id: createdEmployers[1]?.id,
        posted_by_user_id: createdEmployers[1]?.id
      }
    ];
    
    const createdJobs = [];
    for (const job of fakeJobs) {
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
    fakeApplications = [
      {
        id: generateUUID(),
        job_id: createdJobs[0]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93', // Kevin's user ID
        employer_id: createdEmployers[0]?.id,
        application_type: 'direct_apply',
        status: 'interviewing',
        cover_note: 'As a passionate frontend developer with experience in React and modern web technologies, I\'m excited about this opportunity at Tech Innovations. I\'ve been following your company\'s work and believe my skills in JavaScript, CSS, and responsive design would make me a valuable addition to your team.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 8 * 24 * 60 * 60 * 1000).toISOString()
      },
      {
        id: generateUUID(),
        job_id: createdJobs[1]?.id,
        profile_id: '752e7f23-e166-43a7-bdd2-793a9c531b93', // Kevin's user ID
        employer_id: createdEmployers[1]?.id,
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
        employer_id: createdEmployers[0]?.id,
        application_type: 'direct_apply',
        status: 'offer_extended',
        cover_note: 'I\'m interested in this internship opportunity to gain more hands-on experience in software development. As a recent graduate, I\'m eager to learn from experienced developers and contribute to real projects.',
        resume_url: 'https://resumes.purpleknights.work/kevin-rainey-resume.pdf',
        application_date: new Date(Date.now() - 4 * 24 * 60 * 60 * 1000).toISOString()
      }
    ];
    
    for (const application of fakeApplications) {
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
    
    const { data: jobs, error: jobsError } = await supabaseAdmin
      .from('job_postings')
      .select('id, title, status')
      .eq('status', 'open');
    
    if (jobsError) {
      console.error('Error verifying jobs:', jobsError);
    } else {
      console.log(`✅ Found ${jobs.length} open jobs in database`);
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
    
    console.log('\n🎉 Fake applications data seeded successfully!');
    console.log('\n📊 Summary:');
    console.log(`   - ${createdEmployers.length} employer profiles created`);
    console.log(`   - ${createdJobs.length} job postings created`);
    console.log(`   - ${fakeApplications.length} applications created for hirekevinrainey@gmail.com`);
    console.log('\n🚀 You can now check the applications page in the app!');
    
  } catch (error) {
    console.error('❌ Failed to seed applications data:', error.message);
    process.exit(1);
  }
}

seedApplicationsData();
