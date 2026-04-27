-- Purple Knights at Work - Final Corrected Demo Data
-- Jobs linked to company profiles with user affiliations
-- All UUIDs properly formatted

-- ===================================================================
-- STEP 1: CREATE AUTH USERS
-- Go to Supabase Authentication → Users and create these accounts:
-- All passwords: PurpleKnights2024

-- Alumni Accounts (all male, Black alumni):
-- marcus.thompson@purpleknights.work (Marcus Thompson, Class of 2022)
-- andre.washington@purpleknights.work (Andre Washington, Class of 2015)
-- robert.johnson@purpleknights.work (Robert Johnson, Class of 2000)
-- michael.williams@purpleknights.work (Michael Williams, Class of 1998)
-- james.miller@purpleknights.work (James Miller, Class of 1996)

-- Admin Account:
-- admin@purpleknights.work (Admin User)

-- ===================================================================
-- STEP 2: GET USER UUIDS
-- Run this to get actual UUIDs:

SELECT id, email, created_at 
FROM auth.users 
WHERE email LIKE '%purpleknights.work'
ORDER BY created_at;

-- ===================================================================
-- STEP 3: INSERT COMPANY PROFILES (using proper UUIDs)

-- Tech Innovations
INSERT INTO company_profiles (id, name, industry, company_size, website, logo_url, location, description, founded_year, linkedin_url) VALUES
('550e8400-e29b-41d4-a716-446655440101', 'Tech Innovations', 'Technology', '50-100', 'https://techinnovations.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=TI', 'New Orleans, LA', 'Growing technology company specializing in web and mobile applications. We are committed to hiring Purple Knights alumni and supporting the local tech community.', 2018, 'https://linkedin.com/company/tech-innovations');

-- Gulf Marketing Group
INSERT INTO company_profiles (id, name, industry, company_size, website, logo_url, location, description, founded_year, linkedin_url) VALUES
('550e8400-e29b-41d4-a716-446655440102', 'Gulf Marketing Group', 'Marketing & Advertising', '25-50', 'https://gulfmarketing.com', 'https://via.placeholder.com/150x150/F59E0B/FFFFFF?text=GM', 'New Orleans, LA', 'Full-service marketing agency helping businesses grow through innovative digital strategies. We believe in the power of Purple Knights alumni in marketing.', 2015, 'https://linkedin.com/company/gulf-marketing-group');

-- Financial Services LLC
INSERT INTO company_profiles (id, name, industry, company_size, website, logo_url, location, description, founded_year, linkedin_url) VALUES
('550e8400-e29b-41d4-a716-446655440103', 'Financial Services LLC', 'Finance & Banking', '100-250', 'https://financialservicesllc.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=FS', 'New Orleans, LA', 'Leading financial services firm providing investment advisory and wealth management services. Proud to employ and serve Purple Knights alumni.', 2010, 'https://linkedin.com/company/financial-services-llc');

-- Healthcare Plus
INSERT INTO company_profiles (id, name, industry, company_size, website, logo_url, location, description, founded_year, linkedin_url) VALUES
('550e8400-e29b-41d4-a716-446655440104', 'Healthcare Plus', 'Healthcare', '200-500', 'https://healthcareplus.com', 'https://via.placeholder.com/150x150/10B981/FFFFFF?text=HP', 'New Orleans, LA', 'Healthcare provider committed to delivering high-quality patient care. We value Purple Knights alumni in healthcare leadership.', 2005, 'https://linkedin.com/company/healthcare-plus');

-- Education First
INSERT INTO company_profiles (id, name, industry, company_size, website, logo_url, location, description, founded_year, linkedin_url) VALUES
('550e8400-e29b-41d4-a716-446655440105', 'Education First', 'Education', '50-100', 'https://educationfirst.com', 'https://via.placeholder.com/150x150/8B5CF6/FFFFFF?text=EF', 'New Orleans, LA', 'Educational organization dedicated to improving educational outcomes. We believe Purple Knights alumni make excellent educators.', 2012, 'https://linkedin.com/company/education-first');

-- ===================================================================
-- STEP 4: INSERT USER PROFILES (replace UUIDs below)

-- Marcus Thompson - Class of 2022
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('UUID_HERE', 'Marcus', 'Thompson', 'alumni', 'Software Developer | Purple Knight Class of 2022', 'Passionate computer science graduate from LSU with expertise in React, Node.js, and modern web development. During my time at St. Augustine, I developed leadership skills through the student council and discovered my passion for technology through the computer club. I completed two internships during college and am now seeking to contribute to the New Orleans tech community while staying connected to my Purple Knight brothers. My goal is to build innovative solutions that make a positive impact on people''s lives.', 2022, true, '504-555-0101', 'https://linkedin.com/in/marcusthompson', 'https://marcusthompson.dev', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf', true, ARRAY['Valedictorian', 'Computer Science Club President', 'National Honor Society', 'Student Council Treasurer', 'Hackathon Winner 2021']);

-- Andre Washington - Class of 2015
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('UUID_HERE', 'Andre', 'Washington', 'alumni', 'Marketing Manager | Purple Knight Class of 2015', 'Marketing professional with 8 years of experience building brands and driving growth through innovative digital strategies. At St. Augustine, I was captain of the debate team and served on the student council, experiences that shaped my communication skills and strategic thinking. I graduated cum laude from Tulane and have since worked with Fortune 500 companies and local businesses to create impactful marketing campaigns. I''m passionate about using data-driven insights to tell compelling brand stories and mentor the next generation of Purple Knights.', 2015, true, '504-555-0105', 'https://linkedin.com/in/andrewashington', 'https://andrewashington.marketing', 'https://resumes.purpleknights.work/andre-washington-resume.pdf', true, ARRAY['Salutatorian', 'Debate Team Captain', 'Student Government Vice President', 'Marketing Intern of the Year 2019']);

-- Robert Johnson - Class of 2000
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('UUID_HERE', 'Robert', 'Johnson', 'alumni', 'CEO & Founder | Purple Knight Mentor | Class of 2000', 'Serial entrepreneur with 20+ years of experience founding and scaling technology companies. My journey started at St. Augustine where I learned the importance of discipline and brotherhood - values that have guided my entrepreneurial career. After graduating from MIT, I founded my first company in 2005 and successfully exited in 2010. I then built and sold a second company before founding my current SaaS platform which serves over 10,000 customers. I''m passionate about giving back to the Purple Knights community through mentorship and supporting the next generation of entrepreneurs.', 2000, true, '504-555-0107', 'https://linkedin.com/in/robertjohnson', 'https://robertjohnson.com', 'https://resumes.purpleknights.work/robert-johnson-resume.pdf', true, ARRAY['National Merit Scholar', 'Student Body President', 'Basketball Team Captain', 'Science Fair Winner', 'Perfect Attendance']);

-- Michael Williams - Class of 1998
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('UUID_HERE', 'Michael', 'Williams', 'alumni', 'VP of Engineering | Purple Knight Class of 1998', 'Technology executive with 20+ years of experience leading engineering teams and building scalable systems. At St. Augustine, I was president of the computer club and discovered my passion for technology. I''ve led engineering teams at three major tech companies and am currently responsible for a global team of 200+ engineers. I''m committed to mentoring the next generation of Purple Knights pursuing careers in technology and promoting diversity in the tech industry.', 1998, true, '504-555-0108', 'https://linkedin.com/in/michaelwilliams', 'https://michaelwilliams.tech', 'https://resumes.purpleknights.work/michael-williams-resume.pdf', true, ARRAY['Valedictorian', 'Computer Club President', 'Science Fair Grand Champion', 'National Honor Society President', 'Community Service Award']);

-- James Miller - Class of 1996
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('UUID_HERE', 'James', 'Miller', 'alumni', 'Partner | Corporate Attorney | Purple Knight Class of 1996', 'Corporate attorney with 25+ years of experience specializing in mergers, acquisitions, and corporate governance. My time at St. Augustine taught me the importance of integrity and service - values that guide my legal practice today. I graduated from Harvard Law School and have been a partner at a prominent New Orleans law firm for 15 years. I serve on several corporate boards and am passionate about mentoring young Purple Knights interested in law and business. I believe in giving back to the community that shaped me.', 1996, true, '504-555-0109', 'https://linkedin.com/in/jamesmiller', NULL, 'https://resumes.purpleknights.work/james-miller-resume.pdf', true, ARRAY['National Honor Society President', 'Debate Team Captain', 'Mock Trial Champion', 'Student Council President', 'Community Service Award']);

-- Admin User
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('UUID_HERE', 'Admin', 'User', 'admin', 'Platform Administrator', 'System administrator for the Purple Knights alumni platform. Dedicated to maintaining a safe and effective environment for alumni networking and career development.', 2010, false, '504-555-0401', NULL, NULL, NULL, true, NULL);

-- ===================================================================
-- STEP 5: INSERT COMPANY AFFILIATIONS

-- Marcus Thompson - Works at Tech Innovations (can post jobs)
INSERT INTO company_affiliations (user_id, company_id, position, start_date, end_date, current_position, can_post_jobs) VALUES
('UUID_HERE', '550e8400-e29b-41d4-a716-446655440101', 'Frontend Developer', '2024-02-01', NULL, true, true);

-- Andre Washington - Works at Gulf Marketing Group (can post jobs)
INSERT INTO company_affiliations (user_id, company_id, position, start_date, end_date, current_position, can_post_jobs) VALUES
('UUID_HERE', '550e8400-e29b-41d4-a716-446655440102', 'Marketing Manager', '2020-03-01', NULL, true, true);

-- Robert Johnson - Founder of his own company (can post jobs)
INSERT INTO company_affiliations (user_id, company_id, position, start_date, end_date, current_position, can_post_jobs) VALUES
('UUID_HERE', '550e8400-e29b-41d4-a716-446655440101', 'Technical Advisor', '2024-02-01', NULL, true, true);

-- Michael Williams - Works at a tech company (can post jobs)
INSERT INTO company_affiliations (user_id, company_id, position, start_date, end_date, current_position, can_post_jobs) VALUES
('UUID_HERE', '550e8400-e29b-41d4-a716-446655440101', 'VP of Engineering', '2018-01-01', NULL, true, true);

-- James Miller - Works at a law firm (can post jobs)
INSERT INTO company_affiliations (user_id, company_id, position, start_date, end_date, current_position, can_post_jobs) VALUES
('UUID_HERE', '550e8400-e29b-41d4-a716-446655440103', 'Legal Advisor', '2009-01-01', NULL, true, true);

-- ===================================================================
-- STEP 6: INSERT SKILLS (update profile_ids with actual UUIDs)

-- Marcus Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('UUID_HERE', 'JavaScript', 'technical', 'advanced', 5),
('UUID_HERE', 'React', 'technical', 'advanced', 4),
('UUID_HERE', 'Node.js', 'technical', 'intermediate', 3),
('UUID_HERE', 'Python', 'technical', 'intermediate', 2),
('UUID_HERE', 'TypeScript', 'technical', 'intermediate', 3),
('UUID_HERE', 'Git', 'technical', 'advanced', 4),
('UUID_HERE', 'Problem Solving', 'soft_skills', 'advanced', 6),
('UUID_HERE', 'Team Collaboration', 'soft_skills', 'advanced', 5),
('UUID_HERE', 'Communication', 'soft_skills', 'intermediate', 3),
('UUID_HERE', 'Public Speaking', 'soft_skills', 'intermediate', 2),
('UUID_HERE', 'Web Development', 'industry', 'advanced', 4),
('UUID_HERE', 'Software Development', 'industry', 'advanced', 5);

-- Andre Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('UUID_HERE', 'Digital Marketing', 'industry', 'expert', 12),
('UUID_HERE', 'Brand Strategy', 'industry', 'expert', 10),
('UUID_HERE', 'Team Leadership', 'soft_skills', 'expert', 8),
('UUID_HERE', 'Campaign Management', 'industry', 'expert', 11),
('UUID_HERE', 'Analytics', 'technical', 'advanced', 6),
('UUID_HERE', 'Content Strategy', 'industry', 'expert', 9),
('UUID_HERE', 'Budget Management', 'soft_skills', 'advanced', 7),
('UUID_HERE', 'Public Speaking', 'soft_skills', 'expert', 10),
('UUID_HERE', 'SEO', 'technical', 'advanced', 5),
('UUID_HERE', 'Social Media Marketing', 'industry', 'expert', 11),
('UUID_HERE', 'Email Marketing', 'industry', 'advanced', 7),
('UUID_HERE', 'Market Research', 'industry', 'advanced', 6);

-- Robert Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('UUID_HERE', 'Strategic Planning', 'soft_skills', 'expert', 25),
('UUID_HERE', 'Business Development', 'industry', 'expert', 20),
('UUID_HERE', 'Leadership', 'soft_skills', 'expert', 30),
('UUID_HERE', 'Fundraising', 'industry', 'expert', 18),
('UUID_HERE', 'Public Speaking', 'soft_skills', 'expert', 22),
('UUID_HERE', 'Mentorship', 'soft_skills', 'expert', 35),
('UUID_HERE', 'Startup Strategy', 'industry', 'expert', 20),
('UUID_HERE', 'Investment Analysis', 'technical', 'expert', 15),
('UUID_HERE', 'Mergers & Acquisitions', 'industry', 'expert', 10),
('UUID_HERE', 'Board Governance', 'soft_skills', 'expert', 12),
('UUID_HERE', 'Product Management', 'industry', 'advanced', 8),
('UUID_HERE', 'Financial Modeling', 'technical', 'expert', 16),
('UUID_HERE', 'Team Building', 'soft_skills', 'expert', 28),
('UUID_HERE', 'Negotiation', 'soft_skills', 'expert', 20),
('UUID_HERE', 'Innovation Strategy', 'industry', 'expert', 15);

-- Michael Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('UUID_HERE', 'Engineering Leadership', 'soft_skills', 'expert', 22),
('UUID_HERE', 'Cloud Architecture', 'technical', 'expert', 18),
('UUID_HERE', 'Team Management', 'soft_skills', 'expert', 20),
('UUID_HERE', 'System Design', 'technical', 'expert', 16),
('UUID_HERE', 'Agile Methodologies', 'industry', 'expert', 15),
('UUID_HERE', 'Diversity & Inclusion', 'soft_skills', 'expert', 12),
('UUID_HERE', 'DevOps', 'technical', 'expert', 14),
('UUID_HERE', 'Mentoring', 'soft_skills', 'expert', 25),
('UUID_HERE', 'Strategic Planning', 'soft_skills', 'advanced', 10),
('UUID_HERE', 'Microservices', 'technical', 'expert', 12),
('UUID_HERE', 'API Design', 'technical', 'expert', 11),
('UUID_HERE', 'Performance Optimization', 'technical', 'advanced', 9),
('UUID_HERE', 'Public Speaking', 'soft_skills', 'expert', 18),
('UUID_HERE', 'Budget Management', 'soft_skills', 'advanced', 8);

-- James Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('UUID_HERE', 'Corporate Law', 'industry', 'expert', 30),
('UUID_HERE', 'Mergers & Acquisitions', 'industry', 'expert', 25),
('UUID_HERE', 'Legal Research', 'technical', 'expert', 20),
('UUID_HERE', 'Contract Negotiation', 'soft_skills', 'expert', 22),
('UUID_HERE', 'Due Diligence', 'industry', 'expert', 18),
('UUID_HERE', 'Corporate Governance', 'industry', 'expert', 15),
('UUID_HERE', 'Public Speaking', 'soft_skills', 'expert', 25),
('UUID_HERE', 'Mentorship', 'soft_skills', 'expert', 20),
('UUID_HERE', 'Risk Management', 'industry', 'advanced', 12),
('UUID_HERE', 'Board Advisory', 'soft_skills', 'advanced', 10),
('UUID_HERE', 'Legal Writing', 'technical', 'expert', 18),
('UUID_HERE', 'Client Relations', 'soft_skills', 'expert', 22);

-- ===================================================================
-- STEP 7: INSERT EXPERIENCE (update profile_ids with actual UUIDs)

-- Marcus Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('UUID_HERE', 'Tech Innovations', 'Frontend Developer Intern', '2021-06-01', '2021-08-31', false, 'Developed responsive web components using React and TypeScript, participated in daily stand-ups and code reviews, collaborated with UX team to implement pixel-perfect designs, and contributed to a 15% improvement in page load speeds through optimization techniques.', 'New Orleans, LA', 'Technology'),
('UUID_HERE', 'LSU Computer Lab', 'Teaching Assistant', '2020-08-01', '2021-05-01', false, 'Assisted 50+ students per semester with programming assignments, conducted weekly tutoring sessions for JavaScript and Python, maintained lab equipment and software, and organized study groups for midterm and final exams.', 'Baton Rouge, LA', 'Education'),
('UUID_HERE', 'St. Augustine Summer Camp', 'Counselor', '2019-06-01', '2019-08-31', false, 'Led group of 15 high school students in technology-focused summer camp, taught basic coding concepts and web development, organized team projects and presentations, and coordinated with parents on student progress.', 'New Orleans, LA', 'Education');

-- Andre Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('UUID_HERE', 'Gulf Marketing Group', 'Marketing Manager', '2020-03-01', NULL, true, 'Lead team of 5 marketing specialists, manage $2.5M annual budget, develop integrated campaigns for Fortune 500 clients, increased client ROI by 35% through data-driven strategies, and mentor junior team members.', 'New Orleans, LA', 'Marketing'),
('UUID_HERE', 'Previous Digital Agency', 'Digital Marketing Specialist', '2017-06-01', '2020-02-28', false, 'Managed social media campaigns for 15+ clients, increased engagement rates by 45%, developed content calendars and marketing strategies, conducted A/B testing for optimization, and presented campaign results to clients.', 'New Orleans, LA', 'Marketing'),
('UUID_HERE', 'Retail Corporation', 'Marketing Coordinator', '2015-07-01', '2017-05-31', false, 'Coordinated marketing events and product launches, created promotional materials and email campaigns, managed social media accounts with 50K+ followers, and analyzed campaign performance metrics.', 'Baton Rouge, LA', 'Retail'),
('UUID_HERE', 'Tulane Marketing Department', 'Graduate Assistant', '2015-09-01', '2017-05-01', false, 'Assisted professors with marketing research projects, conducted market analysis for local businesses, helped organize marketing conferences, and tutored undergraduate students.', 'New Orleans, LA', 'Education');

-- Robert Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('UUID_HERE', 'Current SaaS Company', 'CEO & Founder', '2018-01-01', NULL, true, 'Built and scaled B2B SaaS platform to $50M ARR, raised $25M in Series B funding, lead team of 150+ employees across 5 countries, implemented scalable company culture, and achieved 200% year-over-year growth.', 'Austin, TX', 'Technology'),
('UUID_HERE', 'Second Startup', 'Founder & CEO', '2010-05-01', '2017-12-31', false, 'Founded mobile app company, grew to 500K users in 3 years, raised $8M in Series A funding, successfully acquired by larger tech company for $15M, managed team of 45 employees.', 'San Francisco, CA', 'Technology'),
('UUID_HERE', 'Investment Bank', 'Investment Analyst', '2009-07-01', '2010-04-30', false, 'Analyzed technology investments and supported due diligence for venture capital deals, evaluated startup pitches and business models, created financial models and investment memos, and worked with portfolio companies.', 'New York, NY', 'Finance'),
('UUID_HERE', 'First Startup', 'Co-Founder', '2005-06-01', '2009-05-31', false, 'Co-founded e-commerce platform for local businesses, secured $500K in angel funding, developed product from concept to launch, managed team of 8 developers and marketers.', 'Boston, MA', 'Technology'),
('UUID_HERE', 'MIT Research Lab', 'Research Assistant', '2000-09-01', '2004-05-01', false, 'Conducted research in artificial intelligence and machine learning, published 3 papers in peer-reviewed journals, presented at international conferences, and assisted in teaching graduate courses.', 'Cambridge, MA', 'Education');

-- Michael Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('UUID_HERE', 'Current Tech Company', 'VP of Engineering', '2018-01-01', NULL, true, 'Lead global engineering team of 200+ engineers, oversee product development and technical strategy, manage $50M engineering budget, and drive innovation in cloud architecture and AI technologies.', 'San Francisco, CA', 'Technology'),
('UUID_HERE', 'Previous Tech Company', 'Engineering Director', '2014-06-01', '2017-12-31', false, 'Managed team of 50 engineers, led development of enterprise software solutions, implemented agile methodologies, and improved system performance by 40%.', 'Seattle, WA', 'Technology'),
('UUID_HERE', 'Mid-size Tech Company', 'Senior Engineer', '2010-08-01', '2014-05-31', false, 'Developed scalable backend systems, mentored junior engineers, and contributed to open-source projects. Led technical design reviews and code quality initiatives.', 'Austin, TX', 'Technology'),
('UUID_HERE', 'First Tech Job', 'Software Engineer', '2002-07-01', '2006-06-30', false, 'Started as junior developer, grew to senior engineer role, worked on various projects including web applications and database systems. Participated in full development lifecycle.', 'Houston, TX', 'Technology');

-- James Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('UUID_HERE', 'Current Law Firm', 'Partner', '2009-01-01', NULL, true, 'Partner at prominent New Orleans law firm specializing in corporate law, mergers and acquisitions. Handle complex transactions valued at $100M+, advise corporate boards, and mentor junior attorneys.', 'New Orleans, LA', 'Legal'),
('UUID_HERE', 'Previous Law Firm', 'Senior Associate', '2004-06-01', '2008-12-31', false, 'Senior associate focusing on corporate transactions, due diligence, and contract negotiations. Managed multiple client relationships and led deal teams.', 'New Orleans, LA', 'Legal'),
('UUID_HERE', 'Judicial Clerkship', 'Law Clerk', '2001-08-01', '2003-05-31', false, 'Clerked for federal judge, researched legal issues, drafted opinions, and observed court proceedings. Gained valuable insight into judicial decision-making.', 'New Orleans, LA', 'Legal'),
('UUID_HERE', 'Law School', 'Law Review Editor', '1998-09-01', '2001-05-01', false, 'Editor on Harvard Law Review, published legal articles, participated in moot court competitions, and assisted professors with research.', 'Cambridge, MA', 'Education');

-- ===================================================================
-- STEP 8: INSERT EDUCATION (update profile_ids with actual UUIDs)

-- Marcus Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('UUID_HERE', 'Louisiana State University', 'Bachelor of Science', 'Computer Science', '2018-08-01', '2022-05-01', false, 3.9, ARRAY['Computer Science Club President', 'Hackathon Winner 2021', 'Dean''s List All Semesters', 'Tutor for Computer Science Courses', 'Research Assistant in AI Lab']);

-- Andre Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('UUID_HERE', 'Tulane University', 'Master of Business Administration', 'Marketing', '2015-08-01', '2017-05-01', false, 3.8, ARRAY['Marketing Association President', 'Case Competition Winner', 'Graduate Assistant', 'Research Assistant', 'Business Journal Club']),
('UUID_HERE', 'Tulane University', 'Bachelor of Science', 'Marketing', '2011-08-01', '2015-05-01', false, 3.9, ARRAY['Debate Team Captain', 'Student Government VP', 'Marketing Club VP', 'Dean''s List', 'Honors Thesis']);

-- Robert Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('UUID_HERE', 'Massachusetts Institute of Technology', 'Master of Science', 'Computer Science', '2004-09-01', '2005-06-01', false, 3.9, ARRAY['Research Assistant', 'Teaching Assistant', 'Entrepreneurship Club', 'Innovation Competition Winner', 'Published Author']),
('UUID_HERE', 'Massachusetts Institute of Technology', 'Bachelor of Science', 'Computer Science', '2000-09-01', '2004-05-01', false, 3.8, ARRAY['Dean''s List', 'Varsity Basketball', 'Student Government', 'Hackathon Organizer', 'Tutor']);

-- Michael Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('UUID_HERE', 'Georgia Tech', 'Master of Science', 'Computer Engineering', '2000-08-01', '2002-05-01', false, 3.9, ARRAY['Research Assistant', 'Teaching Assistant', 'Engineering Honor Society', 'Robotics Club', 'Published Papers']),
('UUID_HERE', 'Georgia Tech', 'Bachelor of Science', 'Computer Engineering', '1996-08-01', '2000-05-01', false, 4.0, ARRAY['Valedictorian', 'Computer Club President', 'National Honor Society', 'Dean''s List', 'Tutor']);

-- James Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('UUID_HERE', 'Harvard Law School', 'Juris Doctor', 'Law', '1998-09-01', '2001-05-01', false, 3.8, ARRAY['Law Review Editor', 'Moot Court Champion', 'Legal Aid Clinic', 'Teaching Assistant', 'Published Articles']);

-- ===================================================================
-- STEP 9: INSERT PREFERENCES (update profile_ids with actual UUIDs)

-- Marcus Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('UUID_HERE', 60000, 85000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX', 'Austin, TX'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Software Development', 'Web Development', 'FinTech', 'Healthcare Technology'], 'entry_level', ARRAY['Tech Innovations', 'Microsoft', 'Google', 'Local Startups', 'Government Agencies']);

-- Andre Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('UUID_HERE', 80000, 120000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Atlanta, GA', 'Dallas, TX'], true, ARRAY['full_time'], ARRAY['Marketing', 'Advertising', 'Digital Media', 'Technology', 'Consulting'], 'mid_level', ARRAY['Fortune 500', 'Marketing Agencies', 'Tech Companies', 'Media Companies', 'Consulting Firms']);

-- Robert Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('UUID_HERE', 200000, 500000, 'USD', 'fully_remote', ARRAY[] , true, ARRAY['contract', 'freelance', 'advisory'], ARRAY['Technology', 'Investment', 'Consulting', 'Education', 'Nonprofit'], 'executive', ARRAY['Startups', 'Venture Capital', 'Private Equity', 'Board Positions', 'Advisory Roles']);

-- Michael Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('UUID_HERE', 180000, 300000, 'USD', 'hybrid', ARRAY['San Francisco, CA', 'Austin, TX', 'Seattle, WA', 'New York, NY'], false, ARRAY['full_time'], ARRAY['Technology', 'Software Development', 'Cloud Computing', 'AI/ML', 'Enterprise Software'], 'senior_level', ARRAY['Big Tech', 'Startups', 'Enterprise Companies', 'Consulting', 'Board Positions']);

-- James Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('UUID_HERE', 150000, 400000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Atlanta, GA', 'Dallas, TX'], false, ARRAY['full_time', 'contract'], ARRAY['Legal', 'Finance', 'Consulting', 'Corporate Governance', 'Board Advisory'], 'senior_level', ARRAY['Law Firms', 'Corporate Legal Departments', 'Investment Firms', 'Consulting Companies', 'Nonprofit Boards']);

-- ===================================================================
-- STEP 10: INSERT JOB POSTINGS (update company_ids and posted_by_user_ids with actual UUIDs)

-- Job 1: Frontend Developer at Tech Innovations (posted by Marcus)
INSERT INTO job_postings (company_id, posted_by_user_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
('550e8400-e29b-41d4-a716-446655440101', 'UUID_HERE', 'Frontend Developer', 
'Tech Innovations is seeking a talented Frontend Developer to join our growing development team in New Orleans. As a Frontend Developer, you will be responsible for building responsive, user-friendly web applications using React, TypeScript, and modern web technologies. You will collaborate with our design team to implement pixel-perfect designs and work closely with backend developers to integrate APIs. We are specifically looking for St. Augustine High School alumni who share our commitment to excellence and brotherhood.

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
- Opportunities for growth and advancement', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 65000, 85000, 'USD', 
ARRAY['JavaScript', 'React', 'TypeScript', 'HTML5', 'CSS3'], 
ARRAY['Node.js', 'Git', 'Redux', 'Next.js', 'GraphQL'], 
'entry_level', true, 'open', '2024-01-01', '2024-02-15');

-- Job 2: Marketing Manager at Gulf Marketing Group (posted by Andre)
INSERT INTO job_postings (company_id, posted_by_user_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
('550e8400-e29b-41d4-a716-446655440102', 'UUID_HERE', 'Marketing Manager', 
'Gulf Marketing Group is looking for an experienced Marketing Manager to lead our dynamic team in New Orleans. This role is perfect for St. Augustine High School alumni who are passionate about marketing and want to make an impact in the local business community. You will be responsible for developing and executing marketing strategies, managing campaigns, and leading our creative team.

**Key Responsibilities:**
- Develop and implement comprehensive marketing strategies
- Lead team of marketing specialists and creative professionals
- Manage multi-million dollar marketing budgets
- Oversee digital marketing campaigns across all platforms
- Analyze market trends and competitive landscape
- Build relationships with clients and stakeholders
- Mentor junior team members
- Drive business growth and ROI

**What We''re Looking For:**
- 5+ years of marketing experience with leadership responsibilities
- Bachelor''s degree in Marketing, Business, or related field
- Proven track record of successful marketing campaigns
- Strong understanding of digital marketing and analytics
- Excellent leadership and team management skills
- Strategic thinking and problem-solving abilities
- Passion for marketing and brand building
- Purple Knight alumni strongly preferred

**What We Offer:**
- Competitive salary ($80,000 - $120,000)
- Performance-based bonuses and incentives
- Comprehensive benefits package
- Flexible work arrangements
- Professional development opportunities
- Collaborative and creative work environment
- Leadership and growth opportunities', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'hybrid', 80000, 120000, 'USD', 
ARRAY['Marketing Strategy', 'Team Leadership', 'Digital Marketing', 'Analytics', 'Budget Management'], 
ARRAY['Brand Strategy', 'Campaign Management', 'Client Relations', 'Market Research', 'Creative Direction'], 
'mid_level', true, 'open', '2024-01-02', '2024-02-20');

-- Job 3: Financial Analyst at Financial Services LLC (posted by James)
INSERT INTO job_postings (company_id, posted_by_user_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
('550e8400-e29b-41d4-a716-446655440103', 'UUID_HERE', 'Financial Analyst', 
'Financial Services LLC is seeking a detail-oriented and analytical Financial Analyst to join our investment team in New Orleans. This position is ideal for St. Augustine High School alumni with strong quantitative skills and a passion for finance. You will be responsible for analyzing investment opportunities, preparing financial models, and supporting our clients in making informed financial decisions.

**Primary Responsibilities:**
- Conduct comprehensive financial analysis and modeling
- Research and evaluate investment opportunities across various asset classes
- Prepare detailed financial reports and presentations for clients
- Monitor market trends and economic indicators affecting investments
- Assist in due diligence processes for potential investments
- Develop and maintain financial models for valuation purposes
- Collaborate with senior analysts on complex investment strategies
- Provide recommendations based on thorough research and analysis

**What We''re Looking For:**
- Bachelor''s degree in Finance, Economics, Business, or related field
- 1-3 years of experience in financial analysis or investment research
- Strong proficiency in Excel and financial modeling
- Excellent analytical and quantitative skills
- Knowledge of financial markets and investment principles
- Ability to interpret complex financial data and trends
- Strong attention to detail and accuracy
- Purple Knight alumni strongly preferred

**What We Offer:**
- Competitive salary ($60,000 - $85,000)
- Performance-based bonuses
- Comprehensive benefits package
- 401(k) plan with generous company matching
- Professional development and CFA exam support
- Flexible work arrangements
- Opportunities for advancement within the firm', 'full_time', 'Finance & Banking', 'New Orleans, LA', 'on_site', 60000, 85000, 'USD', 
ARRAY['Financial Analysis', 'Excel', 'Financial Modeling', 'Research', 'Quantitative Analysis'], 
ARRAY['SQL', 'Power BI', 'Bloomberg Terminal', 'Valuation', 'Portfolio Management'], 
'entry_level', true, 'open', '2024-01-03', '2024-02-18');

-- Job 4: Healthcare Administrator at Healthcare Plus (posted by Michael)
INSERT INTO job_postings (company_id, posted_by_user_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
('550e8400-e29b-41d4-a716-446655440104', 'UUID_HERE', 'Healthcare Administrator', 
'Healthcare Plus is seeking a dedicated Healthcare Administrator to join our management team in New Orleans. This role is perfect for St. Augustine High School alumni who want to make a difference in healthcare while utilizing their leadership and organizational skills. You will be responsible for overseeing daily operations, managing staff, and ensuring high-quality patient care.

**Key Responsibilities:**
- Oversee daily operations of healthcare facility or department
- Manage and lead healthcare staff including hiring, training, and performance evaluation
- Develop and implement policies and procedures to improve efficiency
- Monitor compliance with healthcare regulations and standards
- Manage budget, financial planning, and resource allocation
- Coordinate with medical staff to ensure quality patient care
- Analyze operational data and implement improvement initiatives
- Serve as liaison between clinical staff, administration, and patients

**What We''re Looking For:**
- Bachelor''s degree in Healthcare Administration, Business, or related field
- 3-5 years of experience in healthcare management or administration
- Strong understanding of healthcare operations and regulations
- Excellent leadership and team management skills
- Knowledge of healthcare information systems and technology
- Strong problem-solving and decision-making abilities
- Excellent communication and interpersonal skills
- Purple Knight alumni strongly preferred

**What We Offer:**
- Competitive salary ($70,000 - $95,000)
- Comprehensive health, dental, and vision insurance
- Generous paid time off and holidays
- 401(k) plan with company matching
- Professional development and continuing education support
- Flexible scheduling options
- Opportunity to make a meaningful impact in healthcare', 'full_time', 'Healthcare', 'New Orleans, LA', 'hybrid', 70000, 95000, 'USD', 
ARRAY['Healthcare Management', 'Leadership', 'Operations Management', 'Regulatory Compliance', 'Budget Management'], 
ARRAY['EHR Systems', 'Quality Improvement', 'Risk Management', 'Healthcare Finance', 'Staff Development'], 
'mid_level', true, 'open', '2024-01-04', '2024-02-22');

-- Job 5: Education Program Manager at Education First (posted by Robert)
INSERT INTO job_postings (company_id, posted_by_user_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
('550e8400-e29b-41d4-a716-446655440105', 'UUID_HERE', 'Education Program Manager', 
'Education First is seeking an enthusiastic Education Program Manager to develop and implement innovative educational programs in New Orleans. This position is ideal for St. Augustine High School alumni who are passionate about education and want to give back to the community. You will be responsible for designing curriculum, managing educational initiatives, and coordinating with schools and community partners.

**Primary Responsibilities:**
- Design and develop educational programs and curriculum
- Coordinate program implementation with schools and community partners
- Manage program budgets and resources effectively
- Evaluate program effectiveness and implement improvements
- Train and support teachers and program facilitators
- Develop assessment tools and measure learning outcomes
- Build relationships with schools, parents, and community stakeholders
- Create reports and presentations for program stakeholders

**What We''re Looking For:**
- Bachelor''s degree in Education, Program Management, or related field
- 3-5 years of experience in educational program management
- Strong understanding of curriculum development and educational best practices
- Excellent project management and organizational skills
- Ability to work collaboratively with diverse stakeholders
- Strong communication and presentation skills
- Experience with educational technology and learning management systems
- Passion for education and community service
- Purple Knight alumni strongly preferred

**What We Offer:**
- Competitive salary ($60,000 - $80,000)
- Comprehensive benefits package including health insurance
- Professional development opportunities and tuition reimbursement
- Flexible work schedule with remote options
- Generous paid time off and school holiday breaks
- Opportunity to make a meaningful impact in education
- Collaborative and mission-driven work environment', 'full_time', 'Education', 'New Orleans, LA', 'hybrid', 60000, 80000, 'USD', 
ARRAY['Program Management', 'Curriculum Development', 'Educational Technology', 'Stakeholder Management', 'Assessment'], 
ARRAY['Grant Writing', 'Data Analysis', 'Teacher Training', 'Community Outreach', 'Educational Research'], 
'mid_level', true, 'open', '2024-01-05', '2024-02-25');

-- ===================================================================
-- STEP 11: INSERT APPLICATIONS (update profile_ids, employer_ids with actual UUIDs)

-- Marcus Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'UUID_HERE', 'UUID_HERE', '2024-01-08', 'direct_apply', 'offer_accepted', 'As a recent computer science graduate from LSU and proud St. Augustine Class of 2022 alumnus, I am excited about the Frontend Developer position at Tech Innovations. My experience with React, TypeScript, and modern web technologies, combined with my passion for creating user-friendly applications, makes me a strong candidate. During my internship at Tech Innovations, I developed responsive web components and contributed to a 15% improvement in page load speeds. I am particularly drawn to your company''s commitment to the Purple Knights community and would be proud to represent St. Augustine alumni on your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(3, 'UUID_HERE', 'UUID_HERE', '2024-01-10', 'system_match', 'interviewing', 'While my primary focus is software development, I have strong analytical skills and experience with data analysis that would transfer well to financial analysis. My computer science background has given me excellent quantitative abilities and experience with complex problem-solving. I am interested in exploring how my technical skills could bring value to financial services, and I believe my Purple Knight work ethic would be an asset to your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(4, 'UUID_HERE', 'UUID_HERE', '2024-01-12', 'direct_apply', 'applied', 'As a technology professional with strong organizational and leadership skills, I am interested in exploring how my background could support healthcare technology initiatives. My experience with system optimization and user experience design could be valuable for healthcare administration. I am particularly drawn to Healthcare Plus''s mission and would welcome the opportunity to contribute to improving healthcare in our community.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf');

-- Andre Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(2, 'UUID_HERE', 'UUID_HERE', '2024-01-09', 'direct_apply', 'offer_extended', 'With 8 years of marketing experience and proven success in digital campaign management, I am the ideal candidate for the Marketing Manager position. I have grown engagement rates by 45% in my current position and managed budgets up to $2.5M. As a St. Augustine alumnus, I understand the local market and community, which would be valuable for your clients. I am excited about the opportunity to bring my expertise to Gulf Marketing Group while representing the Purple Knights community.', 'https://resumes.purpleknights.work/andre-washington-resume.pdf'),
(5, 'UUID_HERE', 'UUID_HERE', '2024-01-11', 'direct_apply', 'interviewing', 'My marketing experience includes developing educational campaigns and working with community organizations. I believe my skills in stakeholder management and program coordination would be valuable for education program management. As a Purple Knight alumnus, I have a deep understanding of the local education landscape and am passionate about supporting educational initiatives in our community.', 'https://resumes.purpleknights.work/andre-washington-resume.pdf'),
(6, 'UUID_HERE', 'UUID_HERE', '2024-01-13', 'system_match', 'applied', 'While my background is primarily in marketing, I have experience with digital strategy and user engagement that could be valuable for tech companies. I am interested in exploring how marketing expertise could support technology companies, particularly in user acquisition and brand building. I would be excited to bring my Purple Knight perspective to the tech industry.', 'https://resumes.purpleknights.work/andre-washington-resume.pdf');

-- Robert Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'UUID_HERE', 'UUID_HERE', '2024-01-07', 'employer_request', 'hired', 'As CEO and founder of a successful SaaS company, I am interested in exploring advisory opportunities with Tech Innovations. My experience in scaling technology companies and building high-performing teams could provide valuable insights for your growth. I am particularly interested in supporting fellow Purple Knights in the technology sector.', 'https://resumes.purpleknights.work/robert-johnson-resume.pdf');

-- Michael Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'UUID_HERE', 'UUID_HERE', '2024-01-06', 'direct_apply', 'reviewing', 'As VP of Engineering with 20+ years of experience leading technology teams, I am interested in exploring board advisory or consulting opportunities with promising tech companies. My expertise in scaling engineering organizations and building robust systems could provide strategic value. I am committed to supporting fellow Purple Knights in the technology industry.', 'https://resumes.purpleknights.work/michael-williams-resume.pdf'),
(3, 'UUID_HERE', 'UUID_HERE', '2024-01-14', 'system_match', 'applied', 'My background in technology includes extensive experience with data systems and analytics that could be valuable for financial services companies. I am interested in exploring how technology leadership experience could support innovation in financial services. As a Purple Knight, I would be proud to contribute to the local business community.', 'https://resumes.purpleknights.work/michael-williams-resume.pdf');

-- James Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(3, 'UUID_HERE', 'UUID_HERE', '2024-01-08', 'direct_apply', 'reviewing', 'As a corporate attorney with extensive experience in mergers and acquisitions, I am interested in exploring advisory or board opportunities with financial services companies. My legal expertise and business experience could provide valuable governance and strategic guidance. I am particularly interested in supporting Purple Knight-owned and operated businesses.', 'https://resumes.purpleknights.work/james-miller-resume.pdf'),
(5, 'UUID_HERE', 'UUID_HERE', '2024-01-15', 'direct_apply', 'applied', 'My legal experience includes working with educational institutions and nonprofit organizations. I believe my expertise in governance and compliance could be valuable for educational program management. As a Purple Knight, I am passionate about supporting education initiatives in our community.', 'https://resumes.purpleknights.work/james-miller-resume.pdf');

-- ===================================================================
-- STEP 12: INSERT INTERVIEWS

INSERT INTO interview_records (application_id, interview_date, interview_type, interviewer_name, notes, rating) VALUES
(1, '2024-01-15 14:00:00', 'video', 'Sarah Chen (Tech Lead)', 'Strong technical skills, good communication, showed enthusiasm for company culture. React knowledge is solid, TypeScript experience is good. Asked thoughtful questions about team dynamics and company vision.', 4),
(2, '2024-01-22 10:00:00', 'video', 'Mike Johnson (CTO)', 'Excellent problem-solving approach, asked insightful questions about tech stack, would fit well with team. Showed understanding of scalability and performance optimization. Purple Knight pride is evident.', 5),
(3, '2024-01-25 15:00:00', 'in_person', 'Lisa Davis (CEO)', 'Great cultural fit, understands our mission and values. Showed leadership potential and team collaboration skills. Excited about contributing to Purple Knights community.', 5),
(4, '2024-01-18 15:30:00', 'in_person', 'Jennifer Martinez (Marketing Director)', 'Impressive portfolio of campaigns, strong leadership experience, great cultural fit. Very interested in Purple Knights connection and local market knowledge.', 5),
(5, '2024-01-20 13:00:00', 'video', 'David Wilson (Program Director)', 'Excellent understanding of educational landscape, strong program management skills. Passionate about education and community impact. Purple Knight background is valuable.', 4);

-- ===================================================================
-- STEP 13: INSERT OFFERS

INSERT INTO offer_records (application_id, salary_offered, salary_currency, position_title, start_date, offer_date, status, notes) VALUES
(1, 75000, 'USD', 'Frontend Developer', '2024-02-01', '2024-01-26', 'accepted', 'Competitive salary with benefits package, includes professional development budget and stock options.'),
(2, 100000, 'USD', 'Marketing Manager', '2024-02-15', '2024-01-30', 'pending', 'Above market rate with performance bonuses and team leadership opportunities.'),
(3, 150000, 'USD', 'Technical Advisor', '2024-02-01', '2024-01-28', 'accepted', 'Part-time advisory role with equity compensation and flexible schedule.');

-- ===================================================================
-- STEP 14: INSERT HIRING RECORDS

INSERT INTO hiring_records (offer_id, start_date, feedback_score, feedback_text, alumni_rating) VALUES
(1, '2024-02-01', 5, 'Excellent addition to the team. Strong technical skills and great cultural fit. Purple Knight work ethic is evident.', 5),
(3, '2024-02-01', 5, 'Valuable strategic insights and guidance. Great mentor for our engineering team. Proud to have Purple Knight leadership.', 5);

-- ===================================================================
-- STEP 15: INSERT MENTORSHIP RELATIONSHIPS

INSERT INTO mentorship_records (mentor_id, mentee_id, matched_date, status, focus_areas, meeting_notes, progress_rating) VALUES
('UUID_HERE', 'UUID_HERE', '2024-01-05', 'active', ARRAY['career_planning', 'entrepreneurship', 'networking', 'technical_skills', 'leadership'], 
'[
  {"date": "2024-01-10", "notes": "Initial meeting - discussed Marcus''s career goals and startup interests. Reviewed resume and identified key strengths."},
  {"date": "2024-01-17", "notes": "Discussed interview preparation and negotiation strategies. Provided insights into tech industry trends."},
  {"date": "2024-01-24", "notes": "Celebrated job offer success, discussed negotiation tactics and career path planning."},
  {"date": "2024-01-31", "notes": "Onboarding check-in - discussed first week experiences and long-term career goals."}
]', 5),
('UUID_HERE', 'UUID_HERE', '2024-01-08', 'active', ARRAY['leadership', 'career_advancement', 'business_strategy', 'networking', 'work_life_balance'],
'[
  {"date": "2024-01-12", "notes": "Initial consultation - discussed Andre''s leadership aspirations and current challenges."},
  {"date": "2024-01-19", "notes": "Reviewed job offer and discussed career advancement opportunities. Provided negotiation guidance."},
  {"date": "2024-01-26", "notes": "Discussed team leadership strategies and professional development planning."}
]', 4),
('UUID_HERE', 'UUID_HERE', '2024-01-06', 'active', ARRAY['technical_skills', 'career_development', 'industry_guidance', 'networking'],
'[
  {"date": "2024-01-11", "notes": "Technical mentorship session - discussed advanced React patterns and system design."},
  {"date": "2024-01-18", "notes": "Career guidance - discussed engineering career paths and skill development."},
  {"date": "2024-01-25", "notes": "Networking introduction - connected Marcus with industry contacts."}
]', 4);

-- ===================================================================
-- STEP 16: INSERT MESSAGES

INSERT INTO messages (from_user_id, to_user_id, context, context_id, subject, body, sent_at, read_at) VALUES
('UUID_HERE', 'UUID_HERE', 'job_application', '1', 'Interview Request - Frontend Developer Position', 'Hi Marcus, thank you for your application! We were impressed with your background and would like to schedule an interview. Are you available next week for a video call with our tech lead? Go Purple Knights!', '2024-01-10 09:00:00', '2024-01-10 11:30:00'),
('UUID_HERE', 'UUID_HERE', 'job_application', '1', 'Re: Interview Request - Frontend Developer Position', 'Thank you for reaching out! I''m very excited about this opportunity. I''m available Tuesday afternoon or Wednesday morning next week. Looking forward to discussing how I can contribute to Tech Innovations!', '2024-01-10 11:45:00', '2024-01-10 14:00:00'),
('UUID_HERE', 'UUID_HERE', 'mentorship', '1', 'Congratulations on the Job Offer!', 'Marcus, I heard you got an offer from Tech Innovations - that''s fantastic news! Let''s connect this week to discuss negotiation strategies and ensure you get the best possible package. Proud to see a Purple Knight brother succeeding in tech!', '2024-01-25 16:00:00', '2024-01-25 18:30:00'),
('UUID_HERE', 'UUID_HERE', 'mentorship', '1', 'Re: Congratulations on the Job Offer!', 'Robert, thank you so much! Your guidance throughout this process has been invaluable. I''d love to get your advice on the offer details. I''m free Thursday afternoon if that works for you. Go Purple Knights!', '2024-01-25 19:00:00', '2024-01-26 09:00:00'),
('UUID_HERE', 'UUID_HERE', 'job_application', '4', 'Job Offer - Marketing Manager', 'Andre, we were blown away by your interview and would like to extend an offer for the Marketing Manager position. The offer includes a competitive salary and opportunities for growth. We believe a Purple Knight like you would be perfect for our team!', '2024-01-28 10:00:00', '2024-01-28 14:00:00'),
('UUID_HERE', 'UUID_HERE', 'job_application', '4', 'Re: Job Offer - Marketing Manager', 'Thank you so much for the offer! I''m thrilled about this opportunity. I would like to discuss the details further, particularly around team leadership opportunities. When would be a good time to connect?', '2024-01-28 15:30:00', '2024-01-29 09:00:00');

-- ===================================================================
-- STEP 17: INSERT CAREER MILESTONES

INSERT INTO career_milestones (profile_id, milestone_type, details) VALUES
('UUID_HERE', 'profile_completed', '{"completion_date": "2023-12-01", "profile_strength": "excellent", "completion_percentage": 100}'),
('UUID_HERE', 'first_match', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "match_score": 95, "match_date": "2024-01-07"}'),
('UUID_HERE', 'first_application', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-08", "application_type": "direct_apply"}'),
('UUID_HERE', 'first_interview', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-15", "interview_type": "video"}'),
('UUID_HERE', 'first_offer', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "salary": 75000, "date": "2024-01-26"}'),
('UUID_HERE', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-05", "focus_areas": ["career_planning", "entrepreneurship"]}'),
('UUID_HERE', 'first_hire', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "start_date": "2024-02-01", "salary": 75000}'),
('UUID_HERE', 'skill_endorsed', '{"skill": "React", "endorser": "Sarah Chen", "endorsement_count": 5, "date": "2024-01-20"}'),

('UUID_HERE', 'profile_completed', '{"completion_date": "2023-12-15", "profile_strength": "excellent", "completion_percentage": 100}'),
('UUID_HERE', 'first_application', '{"job_title": "Marketing Manager", "company": "Gulf Marketing Group", "date": "2024-01-09"}'),
('UUID_HERE', 'first_interview', '{"job_title": "Marketing Manager", "company": "Gulf Marketing Group", "date": "2024-01-18", "interview_type": "in_person"}'),
('UUID_HERE', 'first_offer', '{"job_title": "Marketing Manager", "company": "Gulf Marketing Group", "salary": 100000, "date": "2024-01-28"}'),
('UUID_HERE', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-08", "focus_areas": ["leadership", "career_advancement"]}'),

('UUID_HERE', 'mentor_matched', '{"mentee_name": "Marcus Thompson", "match_date": "2024-01-05", "outcome": "successful_placement"}'),
('UUID_HERE', 'mentorship_completed', '{"mentee_name": "Marcus Thompson", "outcome": "successful_job_placement", "completion_date": "2024-02-01"}');

-- ===================================================================
-- STEP 18: INSERT NOTIFICATIONS

INSERT INTO notifications (user_id, title, message, type, metadata, read) VALUES
('UUID_HERE', 'New Job Match', 'You have a 95% match for Frontend Developer at Tech Innovations! This company specifically seeks Purple Knights alumni.', 'job_match', '{"job_id": 1, "match_score": 95, "company": "Tech Innovations"}', false),
('UUID_HERE', 'Interview Request', 'Tech Innovations wants to schedule an interview for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "interview_scheduled"}', false),
('UUID_HERE', 'Job Offer Received', 'Congratulations! Tech Innovations has extended an offer for the Frontend Developer position with a salary of $75,000.', 'application_update', '{"application_id": 1, "status": "offer_extended", "salary": 75000}', false),
('UUID_HERE', 'New Message from Robert Johnson', 'Your mentor Robert Johnson has a message for you about your job offer!', 'message', '{"message_id": 3, "sender": "Robert Johnson"}', false),
('UUID_HERE', 'Offer Accepted', 'Congratulations! You have accepted the Frontend Developer position at Tech Innovations!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false),

('UUID_HERE', 'Application Update', 'Your application for Marketing Manager is being reviewed by Gulf Marketing Group.', 'application_update', '{"application_id": 4, "status": "reviewing"}', false),
('UUID_HERE', 'Interview Scheduled', 'Gulf Marketing Group has scheduled an interview for the Marketing Manager position.', 'application_update', '{"application_id": 4, "status": "interview_scheduled"}', false),
('UUID_HERE', 'Job Offer Received', 'Gulf Marketing Group has extended an offer for the Marketing Manager position!', 'application_update', '{"application_id": 4, "status": "offer_extended", "salary": 100000}', false),

('UUID_HERE', 'Mentorship Request', 'Marcus Thompson (Class of 2022) has requested mentorship in career planning and entrepreneurship.', 'mentor_request', '{"mentee_id": "marcus-id", "focus_areas": ["career_planning", "entrepreneurship"]}', false),
('UUID_HERE', 'Mentee Success', 'Congratulations! Your mentee Marcus Thompson has accepted a job offer from Tech Innovations!', 'mentorship_update', '{"mentee_id": "marcus-id", "outcome": "job_offer_accepted"}', false),

('UUID_HERE', 'New Application', 'Marcus Thompson (Purple Knight Class of 2022) has applied for the Frontend Developer position.', 'application_update', '{"application_id": 1, "applicant": "Marcus Thompson", "alumni": true}', false),
('UUID_HERE', 'Offer Accepted', 'Marcus Thompson has accepted your offer for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false);

-- ===================================================================
-- STEP 19: INSERT PLATFORM METRICS

INSERT INTO platform_metrics (metric_name, metric_value, metric_date, breakdown) VALUES
('total_alumni', 5, CURRENT_DATE, '{"verified": 5, "unverified": 0, "recent_graduates": 1, "mid_career": 2, "senior": 2}'),
('total_companies', 5, CURRENT_DATE, '{"active": 5, "alumni_friendly": 5, "hiring": 5}'),
('total_jobs', 5, CURRENT_DATE, '{"open": 5, "alumni_preferred": 5, "entry_level": 1, "mid_level": 4, "internship": 0}'),
('total_applications', 11, CURRENT_DATE, '{"applied": 11, "reviewing": 2, "interviewing": 1, "offer_extended": 2, "hired": 1}'),
('total_interviews', 5, CURRENT_DATE, '{"scheduled": 5, "completed": 5, "video": 3, "in_person": 2}'),
('total_offers', 3, CURRENT_DATE, '{"extended": 3, "accepted": 2, "pending": 1, "declined": 0}'),
('total_hires', 2, CURRENT_DATE, '{"purple_knights": 2, "recent_graduates": 1, "mid_career": 1}'),
('total_mentorships', 3, CURRENT_DATE, '{"active": 3, "completed": 1, "successful_placements": 1}'),
('total_messages', 6, CURRENT_DATE, '{"sent": 6, "read": 4, "job_related": 4, "mentorship": 2}'),
('engagement_rate', 92.5, CURRENT_DATE, '{"profile_completion": 100, "application_rate": 85, "response_rate": 95}'),
('success_rate', 18.2, CURRENT_DATE, '{"application_to_hire": 18.2, "interview_to_offer": 40, "offer_acceptance": 66.7}'),
('alumni_satisfaction', 4.8, CURRENT_DATE, '{"overall_rating": 4.8, "platform_usage": 4.7, "feature_satisfaction": 4.9}');
