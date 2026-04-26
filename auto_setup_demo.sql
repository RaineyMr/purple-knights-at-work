-- Purple Knights at Work - Automatic Demo Setup
-- This script handles UUID mapping automatically

-- Step 1: Create a temporary mapping table
CREATE TEMPORARY TABLE user_mapping (
    email TEXT PRIMARY KEY,
    user_id UUID,
    display_name TEXT
);

-- Step 2: Insert the demo user emails (you'll update these with actual UUIDs)
INSERT INTO user_mapping (email, display_name) VALUES
-- Alumni
('marcus.thompson@purpleknights.work', 'Marcus Thompson'),
('samantha.rodriguez@purpleknights.work', 'Samantha Rodriguez'),
('robert.johnson@purpleknights.work', 'Robert Johnson'),
('patricia.brown@purpleknights.work', 'Patricia Brown'),
('james.miller@purpleknights.work', 'James Miller'),
-- Employers
('tech.innovations@purpleknights.work', 'Tech Innovations'),
('gulf.marketing@purpleknights.work', 'Gulf Marketing Group'),
('financial.services@purpleknights.work', 'Financial Services LLC'),
('healthcare.plus@purpleknights.work', 'Healthcare Plus'),
('education.first@purpleknights.work', 'Education First'),
-- Admin
('admin@purpleknights.work', 'Admin User');

-- Step 3: Update the mapping with actual user IDs (run this after creating auth users)
-- You'll need to run this UPDATE statement manually with the actual UUIDs:

UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'marcus.thompson@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'samantha.rodriguez@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'robert.johnson@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'patricia.brown@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'james.miller@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'tech.innovations@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'gulf.marketing@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'financial.services@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'healthcare.plus@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'education.first@purpleknights.work';
UPDATE user_mapping SET user_id = 'ACTUAL_UUID_HERE' WHERE email = 'admin@purpleknights.work';

-- Step 4: Insert profiles using the mapping (run this after updating UUIDs above)

-- Marcus Thompson Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements)
SELECT 
    um.user_id,
    'Marcus',
    'Thompson',
    'alumni',
    'Full-Stack Developer | React Specialist | Purple Knight Class of 2022',
    'Passionate computer science graduate from LSU with expertise in React, Node.js, and modern web development. During my time at St. Augustine, I developed leadership skills through the student council and discovered my passion for technology through the computer club. I completed two internships during college and am now seeking to contribute to the New Orleans tech community while staying connected to my Purple Knight roots. My goal is to build innovative solutions that make a positive impact on people''s lives.',
    2022,
    true,
    '504-555-0101',
    'https://linkedin.com/in/marcusthompson',
    'https://marcusthompson.dev',
    'https://resumes.purpleknights.work/marcus-thompson-resume.pdf',
    true,
    ARRAY['Valedictorian', 'Computer Science Club President', 'National Honor Society', 'Student Council Treasurer', 'Hackathon Winner 2021']
FROM user_mapping um WHERE um.email = 'marcus.thompson@purpleknights.work';

-- Samantha Rodriguez Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements)
SELECT 
    um.user_id,
    'Samantha',
    'Rodriguez',
    'alumni',
    'Marketing Manager | Brand Strategist | Digital Campaign Expert | Purple Knight Class of 2015',
    'Marketing professional with 8 years of experience building brands and driving growth through innovative digital strategies. At St. Augustine, I was captain of the debate team and editor of the school newspaper, experiences that shaped my communication skills and strategic thinking. I graduated cum laude from Tulane and have since worked with Fortune 500 companies and local businesses to create impactful marketing campaigns. I''m passionate about using data-driven insights to tell compelling brand stories and mentor the next generation of marketers.',
    2015,
    true,
    '504-555-0105',
    'https://linkedin.com/in/samantharodriguez',
    'https://samantharodriguez.marketing',
    'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf',
    true,
    ARRAY['Salutatorian', 'Debate Team Captain', 'Newspaper Editor', 'Student Government Vice President', 'Marketing Intern of the Year 2019']
FROM user_mapping um WHERE um.email = 'samantha.rodriguez@purpleknights.work';

-- Robert Johnson Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements)
SELECT 
    um.user_id,
    'Robert',
    'Johnson',
    'alumni',
    'CEO & Founder | Serial Entrepreneur | Angel Investor | Purple Knight Mentor | Class of 2000',
    'Serial entrepreneur with 20+ years of experience founding and scaling technology companies. My journey started at St. Augustine where I learned the importance of discipline and community - values that have guided my entrepreneurial career. After graduating from MIT, I founded my first company in 2005 and successfully exited in 2010. I then built and sold a second company before founding my current SaaS platform which serves over 10,000 customers. I''m passionate about giving back to the Purple Knights community through mentorship and supporting the next generation of entrepreneurs.',
    2000,
    true,
    '504-555-0107',
    'https://linkedin.com/in/robertjohnson',
    'https://robertjohnson.com',
    'https://resumes.purpleknights.work/robert-johnson-resume.pdf',
    true,
    ARRAY['National Merit Scholar', 'Student Body President', 'Basketball Team Captain', 'Science Fair Winner', 'Perfect Attendance']
FROM user_mapping um WHERE um.email = 'robert.johnson@purpleknights.work';

-- Patricia Brown Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements)
SELECT 
    um.user_id,
    'Patricia',
    'Brown',
    'alumni',
    'VP of Engineering | Tech Leader | Women in STEM Advocate | Purple Knight Class of 1998',
    'Technology executive with 20+ years of experience leading engineering teams and building scalable systems. At St. Augustine, I was one of the first girls to join the computer club and discovered my passion for technology. I broke barriers as a woman in tech and now advocate for diversity and inclusion in the workplace. I''ve led engineering teams at three major tech companies and am currently responsible for a global team of 200+ engineers. I''m committed to mentoring the next generation, especially women and minorities pursuing careers in technology.',
    1998,
    true,
    '504-555-0108',
    'https://linkedin.com/in/patriciabrown',
    'https://patriciabrown.tech',
    'https://resumes.purpleknights.work/patricia-brown-resume.pdf',
    true,
    ARRAY['First in Computer Club', 'Valedictorian', 'Science Fair Grand Champion', 'Girls in Tech Founder', 'Community Service Award']
FROM user_mapping um WHERE um.email = 'patricia.brown@purpleknights.work';

-- James Miller Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements)
SELECT 
    um.user_id,
    'James',
    'Miller',
    'alumni',
    'Partner | Corporate Attorney | Legal Advisor | Purple Knight Class of 1996',
    'Corporate attorney with 25+ years of experience specializing in mergers, acquisitions, and corporate governance. My time at St. Augustine taught me the importance of integrity and service - values that guide my legal practice today. I graduated from Harvard Law School and have been a partner at a prominent New Orleans law firm for 15 years. I serve on several corporate boards and am passionate about mentoring young professionals, especially those interested in law and business. I believe in giving back to the community that shaped me.',
    1996,
    true,
    '504-555-0109',
    'https://linkedin.com/in/jamesmiller',
    NULL,
    'https://resumes.purpleknights.work/james-miller-resume.pdf',
    true,
    ARRAY['National Honor Society President', 'Debate Team Captain', 'Mock Trial Champion', 'Student Council President', 'Community Service Award']
FROM user_mapping um WHERE um.email = 'james.miller@purpleknights.work';

-- Employer Profiles
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact)
SELECT 
    um.user_id,
    'Tech',
    'Innovations',
    'employer',
    'Tech Innovations',
    'Technology',
    '50-100',
    'https://techinnovations.com',
    'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=TI',
    'New Orleans, LA',
    NULL
FROM user_mapping um WHERE um.email = 'tech.innovations@purpleknights.work';

INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact)
SELECT 
    um.user_id,
    'Gulf',
    'Marketing',
    'employer',
    'Gulf Marketing Group',
    'Marketing & Advertising',
    '25-50',
    'https://gulfmarketing.com',
    'https://via.placeholder.com/150x150/F59E0B/FFFFFF?text=GM',
    'New Orleans, LA',
    NULL
FROM user_mapping um WHERE um.email = 'gulf.marketing@purpleknights.work';

INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact)
SELECT 
    um.user_id,
    'Financial',
    'Services',
    'employer',
    'Financial Services LLC',
    'Finance & Banking',
    '100-250',
    'https://financialservicesllc.com',
    'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=FS',
    'New Orleans, LA',
    NULL
FROM user_mapping um WHERE um.email = 'financial.services@purpleknights.work';

INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact)
SELECT 
    um.user_id,
    'Healthcare',
    'Plus',
    'employer',
    'Healthcare Plus',
    'Healthcare',
    '200-500',
    'https://healthcareplus.com',
    'https://via.placeholder.com/150x150/10B981/FFFFFF?text=HP',
    'New Orleans, LA',
    NULL
FROM user_mapping um WHERE um.email = 'healthcare.plus@purpleknights.work';

INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact)
SELECT 
    um.user_id,
    'Education',
    'First',
    'employer',
    'Education First',
    'Education',
    '50-100',
    'https://educationfirst.com',
    'https://via.placeholder.com/150x150/8B5CF6/FFFFFF?text=EF',
    'New Orleans, LA',
    NULL
FROM user_mapping um WHERE um.email = 'education.first@purpleknights.work';

-- Step 5: Insert skills using the mapping
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count)
SELECT 
    um.user_id,
    skill_name,
    category,
    proficiency_level,
    endorsement_count
FROM user_mapping um
CROSS JOIN (VALUES 
    ('JavaScript', 'technical', 'advanced', 5),
    ('React', 'technical', 'advanced', 4),
    ('Node.js', 'technical', 'intermediate', 3),
    ('Python', 'technical', 'intermediate', 2),
    ('TypeScript', 'technical', 'intermediate', 3),
    ('Git', 'technical', 'advanced', 4),
    ('Problem Solving', 'soft_skills', 'advanced', 6),
    ('Team Collaboration', 'soft_skills', 'advanced', 5),
    ('Communication', 'soft_skills', 'intermediate', 3),
    ('Public Speaking', 'soft_skills', 'intermediate', 2),
    ('Web Development', 'industry', 'advanced', 4),
    ('Software Development', 'industry', 'advanced', 5)
) AS skills(skill_name, category, proficiency_level, endorsement_count)
WHERE um.email = 'marcus.thompson@purpleknights.work';

-- Add more skills for other users similarly...

-- Step 6: Insert job postings
INSERT INTO job_postings (employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline)
SELECT 
    um.user_id,
    'Frontend Developer',
    'Tech Innovations is seeking a talented Frontend Developer to join our growing development team in New Orleans. As a Frontend Developer, you will be responsible for building responsive, user-friendly web applications using React, TypeScript, and modern web technologies. You will collaborate with our design team to implement pixel-perfect designs and work closely with backend developers to integrate APIs. We are specifically looking for St. Augustine High School alumni who share our commitment to excellence and community service.

**What You''ll Do:**
- Develop responsive web applications using React and TypeScript
- Collaborate with UX designers to implement intuitive user interfaces
- Write clean, maintainable, and well-documented code
- Participate in code reviews and contribute to technical discussions
- Optimize applications for maximum speed and scalability
- Work with backend developers to integrate RESTful APIs
- Troubleshoot and debug applications to ensure optimal performance
- Stay up-to-date with emerging trends and technologies in frontend development

**What We''re Looking For:**
- Bachelor''s degree in Computer Science or related field
- 1-3 years of experience in frontend development
- Strong proficiency in JavaScript, HTML5, and CSS3
- Experience with React and modern JavaScript frameworks
- Understanding of responsive design principles
- Excellent problem-solving and communication skills
- Passion for creating exceptional user experiences
- Purple Knight alumni strongly preferred

**What We Offer:**
- Competitive salary ($65,000 - $85,000)
- Comprehensive health, dental, and vision insurance
- 401(k) with company match
- Flexible work arrangements (hybrid model)
- Professional development budget
- Generous paid time off and holidays
- Collaborative and inclusive work environment
- Opportunities for growth and advancement',
    'full_time',
    'Technology',
    'New Orleans, LA',
    'hybrid',
    65000,
    85000,
    'USD',
    ARRAY['JavaScript', 'React', 'TypeScript', 'HTML5', 'CSS3'],
    ARRAY['Node.js', 'Git', 'Redux', 'Next.js', 'GraphQL'],
    'entry_level',
    true,
    'open',
    '2024-01-01',
    '2024-02-15'
FROM user_mapping um WHERE um.email = 'tech.innovations@purpleknights.work';

-- Add more job postings for other employers...

-- Step 7: Clean up
DROP TABLE IF EXISTS user_mapping;
