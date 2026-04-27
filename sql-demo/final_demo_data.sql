-- Purple Knights at Work - Final Demo Data
-- Use this AFTER creating auth users in Supabase and replacing UUIDs below

-- ===================================================================
-- STEP 1: CREATE AUTH USERS FIRST
-- Go to Supabase Authentication → Users and create these accounts:
-- marcus.thompson@purpleknights.work / PurpleKnights2024
-- samantha.rodriguez@purpleknights.work / PurpleKnights2024  
-- robert.johnson@purpleknights.work / PurpleKnights2024
-- patricia.brown@purpleknights.work / PurpleKnights2024
-- james.miller@purpleknights.work / PurpleKnights2024
-- tech.innovations@purpleknights.work / PurpleKnights2024
-- gulf.marketing@purpleknights.work / PurpleKnights2024
-- financial.services@purpleknights.work / PurpleKnights2024
-- healthcare.plus@purpleknights.work / PurpleKnights2024
-- education.first@purpleknights.work / PurpleKnights2024
-- admin@purpleknights.work / PurpleKnights2024

-- ===================================================================
-- STEP 2: GET ACTUAL UUIDS FROM AUTH USERS TABLE
-- Copy the UUIDs from the created users and replace the placeholders below

-- ===================================================================
-- STEP 3: REPLACE PLACEHOLDER UUIDS WITH ACTUAL USER UUIDS
-- Find and replace these placeholders with the actual UUIDs from step 2:

-- Alumni UUIDs (replace with actual auth user UUIDs)
@MARCUS_UUID@     -- Marcus Thompson
@SAMANTHA_UUID@   -- Samantha Rodriguez  
@ROBERT_UUID@     -- Robert Johnson
@PATRICIA_UUID@   -- Patricia Brown
@JAMES_UUID@      -- James Miller

-- Employer UUIDs (replace with actual auth user UUIDs)
@TECH_UUID@       -- Tech Innovations
@GULF_UUID@       -- Gulf Marketing Group
@FINANCIAL_UUID@  -- Financial Services LLC
@HEALTHCARE_UUID@ -- Healthcare Plus
@EDUCATION_UUID@  -- Education First

-- ===================================================================
-- STEP 4: RUN THIS SQL AFTER REPLACING UUIDS
-- ===================================================================

-- Alumni Profile 1: Marcus Thompson - Recent Graduate
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
(@MARCUS_UUID@, 'Marcus', 'Thompson', 'alumni', 'Full-Stack Developer | React Specialist | Purple Knight Class of 2022', 'Passionate computer science graduate from LSU with expertise in React, Node.js, and modern web development. During my time at St. Augustine, I developed leadership skills through the student council and discovered my passion for technology through the computer club. I completed two internships during college and am now seeking to contribute to the New Orleans tech community while staying connected to my Purple Knight roots. My goal is to build innovative solutions that make a positive impact on people''s lives.', 2022, true, '504-555-0101', 'https://linkedin.com/in/marcusthompson', 'https://marcusthompson.dev', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf', true, ARRAY['Valedictorian', 'Computer Science Club President', 'National Honor Society', 'Student Council Treasurer', 'Hackathon Winner 2021']);

-- Marcus Skills (12 different skills across categories)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
(@MARCUS_UUID@, 'JavaScript', 'technical', 'advanced', 5),
(@MARCUS_UUID@, 'React', 'technical', 'advanced', 4),
(@MARCUS_UUID@, 'Node.js', 'technical', 'intermediate', 3),
(@MARCUS_UUID@, 'Python', 'technical', 'intermediate', 2),
(@MARCUS_UUID@, 'TypeScript', 'technical', 'intermediate', 3),
(@MARCUS_UUID@, 'Git', 'technical', 'advanced', 4),
(@MARCUS_UUID@, 'Problem Solving', 'soft_skills', 'advanced', 6),
(@MARCUS_UUID@, 'Team Collaboration', 'soft_skills', 'advanced', 5),
(@MARCUS_UUID@, 'Communication', 'soft_skills', 'intermediate', 3),
(@MARCUS_UUID@, 'Public Speaking', 'soft_skills', 'intermediate', 2),
(@MARCUS_UUID@, 'Web Development', 'industry', 'advanced', 4),
(@MARCUS_UUID@, 'Software Development', 'industry', 'advanced', 5);

-- Marcus Experience (3 complete positions)
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
(@MARCUS_UUID@, 'Tech Innovations', 'Frontend Developer Intern', '2021-06-01', '2021-08-31', false, 'Developed responsive web components using React and TypeScript, participated in daily stand-ups and code reviews, collaborated with UX team to implement pixel-perfect designs, and contributed to a 15% improvement in page load speeds through optimization techniques.', 'New Orleans, LA', 'Technology'),
(@MARCUS_UUID@, 'LSU Computer Lab', 'Teaching Assistant', '2020-08-01', '2021-05-01', false, 'Assisted 50+ students per semester with programming assignments, conducted weekly tutoring sessions for JavaScript and Python, maintained lab equipment and software, and organized study groups for midterm and final exams.', 'Baton Rouge, LA', 'Education'),
(@MARCUS_UUID@, 'St. Augustine Summer Camp', 'Counselor', '2019-06-01', '2019-08-31', false, 'Led group of 15 high school students in technology-focused summer camp, taught basic coding concepts and web development, organized team projects and presentations, and coordinated with parents on student progress.', 'New Orleans, LA', 'Education');

-- Marcus Education (Complete academic background)
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
(@MARCUS_UUID@, 'Louisiana State University', 'Bachelor of Science', 'Computer Science', '2018-08-01', '2022-05-01', false, 3.9, ARRAY['Computer Science Club President', 'Hackathon Winner 2021', 'Dean''s List All Semesters', 'Tutor for Computer Science Courses', 'Research Assistant in AI Lab']);

-- Marcus Preferences (Complete career preferences)
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
(@MARCUS_UUID@, 60000, 85000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX', 'Austin, TX'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Software Development', 'Web Development', 'FinTech', 'Healthcare Technology'], 'entry_level', ARRAY['Tech Innovations', 'Microsoft', 'Google', 'Local Startups', 'Government Agencies']);

-- Alumni Profile 2: Samantha Rodriguez - Marketing Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
(@SAMANTHA_UUID@, 'Samantha', 'Rodriguez', 'alumni', 'Marketing Manager | Brand Strategist | Digital Campaign Expert | Purple Knight Class of 2015', 'Marketing professional with 8 years of experience building brands and driving growth through innovative digital strategies. At St. Augustine, I was captain of the debate team and editor of the school newspaper, experiences that shaped my communication skills and strategic thinking. I graduated cum laude from Tulane and have since worked with Fortune 500 companies and local businesses to create impactful marketing campaigns. I''m passionate about using data-driven insights to tell compelling brand stories and mentor the next generation of marketers.', 2015, true, '504-555-0105', 'https://linkedin.com/in/samantharodriguez', 'https://samantharodriguez.marketing', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf', true, ARRAY['Salutatorian', 'Debate Team Captain', 'Newspaper Editor', 'Student Government Vice President', 'Marketing Intern of the Year 2019']);

-- Samantha Skills (12 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
(@SAMANTHA_UUID@, 'Digital Marketing', 'industry', 'expert', 12),
(@SAMANTHA_UUID@, 'Brand Strategy', 'industry', 'expert', 10),
(@SAMANTHA_UUID@, 'Team Leadership', 'soft_skills', 'expert', 8),
(@SAMANTHA_UUID@, 'Campaign Management', 'industry', 'expert', 11),
(@SAMANTHA_UUID@, 'Analytics', 'technical', 'advanced', 6),
(@SAMANTHA_UUID@, 'Content Strategy', 'industry', 'expert', 9),
(@SAMANTHA_UUID@, 'Budget Management', 'soft_skills', 'advanced', 7),
(@SAMANTHA_UUID@, 'Public Speaking', 'soft_skills', 'expert', 10),
(@SAMANTHA_UUID@, 'SEO', 'technical', 'advanced', 5),
(@SAMANTHA_UUID@, 'Social Media Marketing', 'industry', 'expert', 11),
(@SAMANTHA_UUID@, 'Email Marketing', 'industry', 'advanced', 7),
(@SAMANTHA_UUID@, 'Market Research', 'industry', 'advanced', 6);

-- Samantha Experience (4 complete positions)
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
(@SAMANTHA_UUID@, 'Current Marketing Agency', 'Marketing Manager', '2020-03-01', NULL, true, 'Lead team of 5 marketing specialists, manage $2.5M annual budget, develop integrated campaigns for Fortune 500 clients, increased client ROI by 35% through data-driven strategies, and mentor junior team members.', 'New Orleans, LA', 'Marketing'),
(@SAMANTHA_UUID@, 'Previous Digital Agency', 'Digital Marketing Specialist', '2017-06-01', '2020-02-28', false, 'Managed social media campaigns for 15+ clients, increased engagement rates by 45%, developed content calendars and marketing strategies, conducted A/B testing for optimization, and presented campaign results to clients.', 'New Orleans, LA', 'Marketing'),
(@SAMANTHA_UUID@, 'Retail Corporation', 'Marketing Coordinator', '2015-07-01', '2017-05-31', false, 'Coordinated marketing events and product launches, created promotional materials and email campaigns, managed social media accounts with 50K+ followers, and analyzed campaign performance metrics.', 'Baton Rouge, LA', 'Retail'),
(@SAMANTHA_UUID@, 'Tulane Marketing Department', 'Graduate Assistant', '2015-09-01', '2017-05-01', false, 'Assisted professors with marketing research projects, conducted market analysis for local businesses, helped organize marketing conferences, and tutored undergraduate students.', 'New Orleans, LA', 'Education');

-- Samantha Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
(@SAMANTHA_UUID@, 'Tulane University', 'Master of Business Administration', 'Marketing', '2015-08-01', '2017-05-01', false, 3.8, ARRAY['Marketing Association President', 'Case Competition Winner', 'Graduate Assistant', 'Research Assistant', 'Business Journal Club']),
(@SAMANTHA_UUID@, 'Tulane University', 'Bachelor of Science', 'Marketing', '2011-08-01', '2015-05-01', false, 3.9, ARRAY['Debate Team Captain', 'Student Government VP', 'Marketing Club VP', 'Dean''s List', 'Honors Thesis']);

-- Alumni Profile 3: Robert Johnson - CEO/Mentor
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
(@ROBERT_UUID@, 'Robert', 'Johnson', 'alumni', 'CEO & Founder | Serial Entrepreneur | Angel Investor | Purple Knight Mentor | Class of 2000', 'Serial entrepreneur with 20+ years of experience founding and scaling technology companies. My journey started at St. Augustine where I learned the importance of discipline and community - values that have guided my entrepreneurial career. After graduating from MIT, I founded my first company in 2005 and successfully exited in 2010. I then built and sold a second company before founding my current SaaS platform which serves over 10,000 customers. I''m passionate about giving back to the Purple Knights community through mentorship and supporting the next generation of entrepreneurs.', 2000, true, '504-555-0107', 'https://linkedin.com/in/robertjohnson', 'https://robertjohnson.com', 'https://resumes.purpleknights.work/robert-johnson-resume.pdf', true, ARRAY['National Merit Scholar', 'Student Body President', 'Basketball Team Captain', 'Science Fair Winner', 'Perfect Attendance']);

-- Robert Skills (15 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
(@ROBERT_UUID@, 'Strategic Planning', 'soft_skills', 'expert', 25),
(@ROBERT_UUID@, 'Business Development', 'industry', 'expert', 20),
(@ROBERT_UUID@, 'Leadership', 'soft_skills', 'expert', 30),
(@ROBERT_UUID@, 'Fundraising', 'industry', 'expert', 18),
(@ROBERT_UUID@, 'Public Speaking', 'soft_skills', 'expert', 22),
(@ROBERT_UUID@, 'Mentorship', 'soft_skills', 'expert', 35),
(@ROBERT_UUID@, 'Startup Strategy', 'industry', 'expert', 20),
(@ROBERT_UUID@, 'Investment Analysis', 'technical', 'expert', 15),
(@ROBERT_UUID@, 'Mergers & Acquisitions', 'industry', 'expert', 10),
(@ROBERT_UUID@, 'Board Governance', 'soft_skills', 'expert', 12),
(@ROBERT_UUID@, 'Product Management', 'industry', 'advanced', 8),
(@ROBERT_UUID@, 'Financial Modeling', 'technical', 'expert', 16),
(@ROBERT_UUID@, 'Team Building', 'soft_skills', 'expert', 28),
(@ROBERT_UUID@, 'Negotiation', 'soft_skills', 'expert', 20),
(@ROBERT_UUID@, 'Innovation Strategy', 'industry', 'expert', 15);

-- Robert Experience (5 complete positions)
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
(@ROBERT_UUID@, 'Current SaaS Company', 'CEO & Founder', '2018-01-01', NULL, true, 'Built and scaled B2B SaaS platform to $50M ARR, raised $25M in Series B funding, lead team of 150+ employees across 5 countries, implemented scalable company culture, and achieved 200% year-over-year growth.', 'Austin, TX', 'Technology'),
(@ROBERT_UUID@, 'Second Startup', 'Founder & CEO', '2010-05-01', '2017-12-31', false, 'Founded mobile app company, grew to 500K users in 3 years, raised $8M in Series A funding, successfully acquired by larger tech company for $15M, managed team of 45 employees.', 'San Francisco, CA', 'Technology'),
(@ROBERT_UUID@, 'Investment Bank', 'Investment Analyst', '2009-07-01', '2010-04-30', false, 'Analyzed technology investments and supported due diligence for venture capital deals, evaluated startup pitches and business models, created financial models and investment memos, and worked with portfolio companies.', 'New York, NY', 'Finance'),
(@ROBERT_UUID@, 'First Startup', 'Co-Founder', '2005-06-01', '2009-05-31', false, 'Co-founded e-commerce platform for local businesses, secured $500K in angel funding, developed product from concept to launch, managed team of 8 developers and marketers.', 'Boston, MA', 'Technology'),
(@ROBERT_UUID@, 'MIT Research Lab', 'Research Assistant', '2000-09-01', '2004-05-01', false, 'Conducted research in artificial intelligence and machine learning, published 3 papers in peer-reviewed journals, presented at international conferences, and assisted in teaching graduate courses.', 'Cambridge, MA', 'Education');

-- Robert Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
(@ROBERT_UUID@, 'Massachusetts Institute of Technology', 'Master of Science', 'Computer Science', '2004-09-01', '2005-06-01', false, 3.9, ARRAY['Research Assistant', 'Teaching Assistant', 'Entrepreneurship Club', 'Innovation Competition Winner', 'Published Author']),
(@ROBERT_UUID@, 'Massachusetts Institute of Technology', 'Bachelor of Science', 'Computer Science', '2000-09-01', '2004-05-01', false, 3.8, ARRAY['Dean''s List', 'Varsity Basketball', 'Student Government', 'Hackathon Organizer', 'Tutor']);

-- Alumni Profile 4: Patricia Brown - VP of Engineering
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
(@PATRICIA_UUID@, 'Patricia', 'Brown', 'alumni', 'VP of Engineering | Tech Leader | Women in STEM Advocate | Purple Knight Class of 1998', 'Technology executive with 20+ years of experience leading engineering teams and building scalable systems. At St. Augustine, I was one of the first girls to join the computer club and discovered my passion for technology. I broke barriers as a woman in tech and now advocate for diversity and inclusion in the workplace. I''ve led engineering teams at three major tech companies and am currently responsible for a global team of 200+ engineers. I''m committed to mentoring the next generation, especially women and minorities pursuing careers in technology.', 1998, true, '504-555-0108', 'https://linkedin.com/in/patriciabrown', 'https://patriciabrown.tech', 'https://resumes.purpleknights.work/patricia-brown-resume.pdf', true, ARRAY['First in Computer Club', 'Valedictorian', 'Science Fair Grand Champion', 'Girls in Tech Founder', 'Community Service Award']);

-- Patricia Skills (14 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
(@PATRICIA_UUID@, 'Engineering Leadership', 'soft_skills', 'expert', 22),
(@PATRICIA_UUID@, 'Cloud Architecture', 'technical', 'expert', 18),
(@PATRICIA_UUID@, 'Team Management', 'soft_skills', 'expert', 20),
(@PATRICIA_UUID@, 'System Design', 'technical', 'expert', 16),
(@PATRICIA_UUID@, 'Agile Methodologies', 'industry', 'expert', 15),
(@PATRICIA_UUID@, 'Diversity & Inclusion', 'soft_skills', 'expert', 12),
(@PATRICIA_UUID@, 'DevOps', 'technical', 'expert', 14),
(@PATRICIA_UUID@, 'Mentoring', 'soft_skills', 'expert', 25),
(@PATRICIA_UUID@, 'Strategic Planning', 'soft_skills', 'advanced', 10),
(@PATRICIA_UUID@, 'Microservices', 'technical', 'expert', 12),
(@PATRICIA_UUID@, 'API Design', 'technical', 'expert', 11),
(@PATRICIA_UUID@, 'Performance Optimization', 'technical', 'advanced', 9),
(@PATRICIA_UUID@, 'Public Speaking', 'soft_skills', 'expert', 18),
(@PATRICIA_UUID@, 'Budget Management', 'soft_skills', 'advanced', 8);

-- Alumni Profile 5: James Miller - Attorney & Mentor
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
(@JAMES_UUID@, 'James', 'Miller', 'alumni', 'Partner | Corporate Attorney | Legal Advisor | Purple Knight Class of 1996', 'Corporate attorney with 25+ years of experience specializing in mergers, acquisitions, and corporate governance. My time at St. Augustine taught me the importance of integrity and service - values that guide my legal practice today. I graduated from Harvard Law School and have been a partner at a prominent New Orleans law firm for 15 years. I serve on several corporate boards and am passionate about mentoring young professionals, especially those interested in law and business. I believe in giving back to the community that shaped me.', 1996, true, '504-555-0109', 'https://linkedin.com/in/jamesmiller', NULL, 'https://resumes.purpleknights.work/james-miller-resume.pdf', true, ARRAY['National Honor Society President', 'Debate Team Captain', 'Mock Trial Champion', 'Student Council President', 'Community Service Award']);

-- James Skills (12 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
(@JAMES_UUID@, 'Corporate Law', 'industry', 'expert', 30),
(@JAMES_UUID@, 'Mergers & Acquisitions', 'industry', 'expert', 25),
(@JAMES_UUID@, 'Legal Research', 'technical', 'expert', 20),
(@JAMES_UUID@, 'Contract Negotiation', 'soft_skills', 'expert', 22),
(@JAMES_UUID@, 'Due Diligence', 'industry', 'expert', 18),
(@JAMES_UUID@, 'Corporate Governance', 'industry', 'expert', 15),
(@JAMES_UUID@, 'Public Speaking', 'soft_skills', 'expert', 25),
(@JAMES_UUID@, 'Mentorship', 'soft_skills', 'expert', 20),
(@JAMES_UUID@, 'Risk Management', 'industry', 'advanced', 12),
(@JAMES_UUID@, 'Board Advisory', 'soft_skills', 'advanced', 10),
(@JAMES_UUID@, 'Legal Writing', 'technical', 'expert', 18),
(@JAMES_UUID@, 'Client Relations', 'soft_skills', 'expert', 22);

-- ===================================================================
-- EMPLOYER PROFILES (Complete with Full Company Details)
-- ===================================================================

-- Employer 1: Tech Innovations
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
(@TECH_UUID@, 'Tech', 'Innovations', 'employer', 'Tech Innovations', 'Technology', '50-100', 'https://techinnovations.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=TI', 'New Orleans, LA', NULL);

-- Employer 2: Gulf Marketing Group
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
(@GULF_UUID@, 'Gulf', 'Marketing', 'employer', 'Gulf Marketing Group', 'Marketing & Advertising', '25-50', 'https://gulfmarketing.com', 'https://via.placeholder.com/150x150/F59E0B/FFFFFF?text=GM', 'New Orleans, LA', NULL);

-- Employer 3: Financial Services LLC
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
(@FINANCIAL_UUID@, 'Financial', 'Services', 'employer', 'Financial Services LLC', 'Finance & Banking', '100-250', 'https://financialservicesllc.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=FS', 'New Orleans, LA', NULL);

-- Employer 4: Healthcare Plus
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
(@HEALTHCARE_UUID@, 'Healthcare', 'Plus', 'employer', 'Healthcare Plus', 'Healthcare', '200-500', 'https://healthcareplus.com', 'https://via.placeholder.com/150x150/10B981/FFFFFF?text=HP', 'New Orleans, LA', NULL);

-- Employer 5: Education First
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
(@EDUCATION_UUID@, 'Education', 'First', 'employer', 'Education First', 'Education', '50-100', 'https://educationfirst.com', 'https://via.placeholder.com/150x150/8B5CF6/FFFFFF?text=EF', 'New Orleans, LA', NULL);

-- ===================================================================
-- COMPREHENSIVE JOB POSTINGS (100% Complete with Full Details)
-- ===================================================================

-- Job 1: Frontend Developer at Tech Innovations
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(1, @TECH_UUID@, 'Frontend Developer', 
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
- Opportunities for growth and advancement', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 65000, 85000, 'USD', 
ARRAY['JavaScript', 'React', 'TypeScript', 'HTML5', 'CSS3'], 
ARRAY['Node.js', 'Git', 'Redux', 'Next.js', 'GraphQL'], 
'entry_level', true, 'open', '2024-01-01', '2024-02-15');

-- Job 2: Marketing Specialist at Gulf Marketing Group
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(2, @GULF_UUID@, 'Digital Marketing Specialist', 
'Gulf Marketing Group is looking for a creative and data-driven Digital Marketing Specialist to join our dynamic team in New Orleans. This role is perfect for St. Augustine High School alumni who are passionate about marketing and want to make an impact in the local business community. You will be responsible for developing and executing digital marketing campaigns across multiple platforms, analyzing campaign performance, and contributing to our clients'' success.

**Key Responsibilities:**
- Develop and implement comprehensive digital marketing strategies
- Manage social media campaigns across Facebook, Instagram, LinkedIn, and Twitter
- Create engaging content including blog posts, videos, and infographics
- Conduct market research and analyze competitor strategies
- Monitor and report on campaign performance using analytics tools
- Optimize campaigns based on data-driven insights
- Collaborate with creative teams to produce high-quality marketing materials
- Manage email marketing campaigns and newsletters', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'hybrid', 55000, 75000, 'USD', 
ARRAY['Digital Marketing', 'Social Media Management', 'Content Creation', 'Analytics', 'Communication'], 
ARRAY['SEO', 'Email Marketing', 'Graphic Design', 'Campaign Management', 'Market Research'], 
'mid_level', true, 'open', '2024-01-02', '2024-02-20');

-- Job 3: Financial Analyst at Financial Services LLC
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(3, @FINANCIAL_UUID@, 'Financial Analyst', 
'Financial Services LLC is seeking a detail-oriented and analytical Financial Analyst to join our investment team in New Orleans. This position is ideal for St. Augustine High School alumni with strong quantitative skills and a passion for finance. You will be responsible for analyzing investment opportunities, preparing financial models, and supporting our clients in making informed financial decisions.

**Primary Responsibilities:**
- Conduct comprehensive financial analysis and modeling
- Research and evaluate investment opportunities across various asset classes
- Prepare detailed financial reports and presentations for clients
- Monitor market trends and economic indicators affecting investments
- Assist in due diligence processes for potential investments
- Develop and maintain financial models for valuation purposes
- Collaborate with senior analysts on complex investment strategies
- Provide recommendations based on thorough research and analysis', 'full_time', 'Finance & Banking', 'New Orleans, LA', 'on_site', 60000, 85000, 'USD', 
ARRAY['Financial Analysis', 'Excel', 'Financial Modeling', 'Research', 'Quantitative Analysis'], 
ARRAY['SQL', 'Power BI', 'Bloomberg Terminal', 'Valuation', 'Portfolio Management'], 
'entry_level', true, 'open', '2024-01-03', '2024-02-18');

-- Job 4: Healthcare Administrator at Healthcare Plus
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(4, @HEALTHCARE_UUID@, 'Healthcare Administrator', 
'Healthcare Plus is seeking a dedicated Healthcare Administrator to join our management team in New Orleans. This role is perfect for St. Augustine High School alumni who want to make a difference in healthcare while utilizing their leadership and organizational skills. You will be responsible for overseeing daily operations, managing staff, and ensuring high-quality patient care.

**Key Responsibilities:**
- Oversee daily operations of healthcare facility or department
- Manage and lead healthcare staff including hiring, training, and performance evaluation
- Develop and implement policies and procedures to improve efficiency
- Monitor compliance with healthcare regulations and standards
- Manage budget, financial planning, and resource allocation
- Coordinate with medical staff to ensure quality patient care
- Analyze operational data and implement improvement initiatives
- Serve as liaison between clinical staff, administration, and patients', 'full_time', 'Healthcare', 'New Orleans, LA', 'hybrid', 70000, 95000, 'USD', 
ARRAY['Healthcare Management', 'Leadership', 'Operations Management', 'Regulatory Compliance', 'Budget Management'], 
ARRAY['EHR Systems', 'Quality Improvement', 'Risk Management', 'Healthcare Finance', 'Staff Development'], 
'mid_level', true, 'open', '2024-01-04', '2024-02-22');

-- Job 5: Education Program Manager at Education First
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(5, @EDUCATION_UUID@, 'Education Program Manager', 
'Education First is seeking an enthusiastic Education Program Manager to develop and implement innovative educational programs in New Orleans. This position is ideal for St. Augustine High School alumni who are passionate about education and want to give back to the community. You will be responsible for designing curriculum, managing educational initiatives, and coordinating with schools and community partners.

**Primary Responsibilities:**
- Design and develop educational programs and curriculum
- Coordinate program implementation with schools and community partners
- Manage program budgets and resources effectively
- Evaluate program effectiveness and implement improvements
- Train and support teachers and program facilitators
- Develop assessment tools and measure learning outcomes
- Build relationships with schools, parents, and community stakeholders
- Create reports and presentations for program stakeholders', 'full_time', 'Education', 'New Orleans, LA', 'hybrid', 60000, 80000, 'USD', 
ARRAY['Program Management', 'Curriculum Development', 'Educational Technology', 'Stakeholder Management', 'Assessment'], 
ARRAY['Grant Writing', 'Data Analysis', 'Teacher Training', 'Community Outreach', 'Educational Research'], 
'mid_level', true, 'open', '2024-01-05', '2024-02-25');

-- ===================================================================
-- APPLICATIONS, INTERVIEWS, AND OFFERS (Complete Workflows)
-- ===================================================================

-- Marcus Applications (3 applications with full workflow)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 1, @MARCUS_UUID@, @TECH_UUID@, '2024-01-08', 'direct_apply', 'offer_accepted', 'As a recent computer science graduate from LSU and proud St. Augustine Class of 2022 alumnus, I am excited about the Frontend Developer position at Tech Innovations. My experience with React, TypeScript, and modern web technologies, combined with my passion for creating user-friendly applications, makes me a strong candidate. During my internship at Tech Innovations, I developed responsive web components and contributed to a 15% improvement in page load speeds. I am particularly drawn to your company''s commitment to the Purple Knights community and would be proud to represent St. Augustine alumni on your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(2, 3, @MARCUS_UUID@, @FINANCIAL_UUID@, '2024-01-10', 'system_match', 'interviewing', 'While my primary focus is software development, I have strong analytical skills and experience with data analysis that would transfer well to financial analysis. My computer science background has given me excellent quantitative abilities and experience with complex problem-solving. I am interested in exploring how my technical skills could bring value to financial services, and I believe my Purple Knight work ethic would be an asset to your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(3, 4, @MARCUS_UUID@, @HEALTHCARE_UUID@, '2024-01-12', 'direct_apply', 'applied', 'As a technology professional with strong organizational and leadership skills, I am interested in exploring how my background could support healthcare technology initiatives. My experience with system optimization and user experience design could be valuable for healthcare administration. I am particularly drawn to Healthcare Plus''s mission and would welcome the opportunity to contribute to improving healthcare in our community.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf');

-- Samantha Applications (3 applications)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(4, 2, @SAMANTHA_UUID@, @GULF_UUID@, '2024-01-09', 'direct_apply', 'offer_extended', 'With 8 years of marketing experience and proven success in digital campaign management, I am the ideal candidate for the Digital Marketing Specialist position. I have grown engagement rates by 45% in my current position and managed budgets up to $2.5M. As a St. Augustine alumna, I understand the local market and community, which would be valuable for your clients. I am excited about the opportunity to bring my expertise to Gulf Marketing Group while representing the Purple Knights community.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf'),
(5, 5, @SAMANTHA_UUID@, @EDUCATION_UUID@, '2024-01-11', 'direct_apply', 'interviewing', 'My marketing experience includes developing educational campaigns and working with community organizations. I believe my skills in stakeholder management and program coordination would be valuable for education program management. As a Purple Knight alumna, I have a deep understanding of the local education landscape and am passionate about supporting educational initiatives in our community.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf'),
(6, 1, @SAMANTHA_UUID@, @TECH_UUID@, '2024-01-13', 'system_match', 'applied', 'While my background is primarily in marketing, I have experience with digital strategy and user engagement that could be valuable for tech companies. I am interested in exploring how marketing expertise could support technology companies, particularly in user acquisition and brand building. I would be excited to bring my Purple Knight perspective to the tech industry.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf');

-- Robert Applications (As Mentor/Employer)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(7, 1, @ROBERT_UUID@, @TECH_UUID@, '2024-01-07', 'employer_request', 'hired', 'As CEO and founder of a successful SaaS company, I am interested in exploring advisory opportunities with Tech Innovations. My experience in scaling technology companies and building high-performing teams could provide valuable insights for your growth. I am particularly interested in supporting fellow Purple Knights in the technology sector.', 'https://resumes.purpleknights.work/robert-johnson-resume.pdf');

-- Patricia Applications (2 applications)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(8, 1, @PATRICIA_UUID@, @TECH_UUID@, '2024-01-06', 'direct_apply', 'reviewing', 'As VP of Engineering with 20+ years of experience leading technology teams, I am interested in exploring board advisory or consulting opportunities with promising tech companies. My expertise in scaling engineering organizations and building robust systems could provide strategic value. I am committed to supporting fellow Purple Knights in the technology industry.', 'https://resumes.purpleknights.work/patricia-brown-resume.pdf'),
(9, 3, @PATRICIA_UUID@, @FINANCIAL_UUID@, '2024-01-14', 'system_match', 'applied', 'My background in technology includes extensive experience with data systems and analytics that could be valuable for financial services companies. I am interested in exploring how technology leadership experience could support innovation in financial services. As a Purple Knight, I would be proud to contribute to the local business community.', 'https://resumes.purpleknights.work/patricia-brown-resume.pdf');

-- James Applications (2 applications)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(10, 3, @JAMES_UUID@, @FINANCIAL_UUID@, '2024-01-08', 'direct_apply', 'reviewing', 'As a corporate attorney with extensive experience in mergers and acquisitions, I am interested in exploring advisory or board opportunities with financial services companies. My legal expertise and business experience could provide valuable governance and strategic guidance. I am particularly interested in supporting Purple Knight-owned and operated businesses.', 'https://resumes.purpleknights.work/james-miller-resume.pdf'),
(11, 5, @JAMES_UUID@, @EDUCATION_UUID@, '2024-01-15', 'direct_apply', 'applied', 'My legal experience includes working with educational institutions and nonprofit organizations. I believe my expertise in governance and compliance could be valuable for educational program management. As a Purple Knight, I am passionate about supporting education initiatives in our community.', 'https://resumes.purpleknights.work/james-miller-resume.pdf');

-- ===================================================================
-- INTERVIEWS, OFFERS, AND HIRING RECORDS
-- ===================================================================

-- Interview Records (Complete interview processes)
INSERT INTO interview_records (id, application_id, interview_date, interview_type, interviewer_name, notes, rating) VALUES
(1, 1, '2024-01-15 14:00:00', 'video', 'Sarah Chen (Tech Lead)', 'Strong technical skills, good communication, showed enthusiasm for company culture. React knowledge is solid, TypeScript experience is good. Asked thoughtful questions about team dynamics and company vision.', 4),
(2, 1, '2024-01-22 10:00:00', 'video', 'Mike Johnson (CTO)', 'Excellent problem-solving approach, asked insightful questions about tech stack, would fit well with team. Showed understanding of scalability and performance optimization. Purple Knight pride is evident.', 5),
(3, 1, '2024-01-25 15:00:00', 'in_person', 'Lisa Davis (CEO)', 'Great cultural fit, understands our mission and values. Showed leadership potential and team collaboration skills. Excited about contributing to Purple Knights community.', 5),
(4, 4, '2024-01-18 15:30:00', 'in_person', 'Jennifer Martinez (Marketing Director)', 'Impressive portfolio of campaigns, strong leadership experience, great cultural fit. Very interested in Purple Knights connection and local market knowledge.', 5),
(5, 2, '2024-01-20 13:00:00', 'video', 'David Wilson (Program Director)', 'Excellent understanding of educational landscape, strong program management skills. Passionate about education and community impact. Purple Knight background is valuable.', 4);

-- Offer Records (Complete offer details)
INSERT INTO offer_records (id, application_id, salary_offered, salary_currency, position_title, start_date, offer_date, status, notes) VALUES
(1, 1, 75000, 'USD', 'Frontend Developer', '2024-02-01', '2024-01-26', 'accepted', 'Competitive salary with benefits package, includes professional development budget and stock options.'),
(2, 4, 70000, 'USD', 'Digital Marketing Specialist', '2024-02-15', '2024-01-30', 'pending', 'Above market rate with performance bonuses and team leadership opportunities.'),
(3, 7, 150000, 'USD', 'Technical Advisor', '2024-02-01', '2024-01-28', 'accepted', 'Part-time advisory role with equity compensation and flexible schedule.');

-- Hiring Records (Complete hiring process)
INSERT INTO hiring_records (id, offer_id, start_date, feedback_score, feedback_text, alumni_rating) VALUES
(1, 1, '2024-02-01', 5, 'Excellent addition to the team. Strong technical skills and great cultural fit. Purple Knight work ethic is evident.', 5),
(2, 3, '2024-02-01', 5, 'Valuable strategic insights and guidance. Great mentor for our engineering team. Proud to have Purple Knight leadership.', 5);

-- ===================================================================
-- MENTORSHIP RELATIONSHIPS (Complete with Full Details)
-- ===================================================================

-- Mentorship Records (Complete mentorship relationships)
INSERT INTO mentorship_records (id, mentor_id, mentee_id, matched_date, status, focus_areas, meeting_notes, progress_rating) VALUES
(1, @ROBERT_UUID@, @MARCUS_UUID@, '2024-01-05', 'active', ARRAY['career_planning', 'entrepreneurship', 'networking', 'technical_skills', 'leadership'], 
'[
  {"date": "2024-01-10", "notes": "Initial meeting - discussed Marcus''s career goals and startup interests. Reviewed resume and identified key strengths."},
  {"date": "2024-01-17", "notes": "Discussed interview preparation and negotiation strategies. Provided insights into tech industry trends."},
  {"date": "2024-01-24", "notes": "Celebrated job offer success, discussed negotiation tactics and career path planning."},
  {"date": "2024-01-31", "notes": "Onboarding check-in - discussed first week experiences and long-term career goals."}
]', 5),
(2, @ROBERT_UUID@, @SAMANTHA_UUID@, '2024-01-08', 'active', ARRAY['leadership', 'career_advancement', 'business_strategy', 'networking', 'work_life_balance'],
'[
  {"date": "2024-01-12", "notes": "Initial consultation - discussed Samantha''s leadership aspirations and current challenges."},
  {"date": "2024-01-19", "notes": "Reviewed job offer and discussed career advancement opportunities. Provided negotiation guidance."},
  {"date": "2024-01-26", "notes": "Discussed team leadership strategies and professional development planning."}
]', 4),
(3, @PATRICIA_UUID@, @MARCUS_UUID@, '2024-01-06', 'active', ARRAY['technical_skills', 'career_development', 'industry_guidance', 'networking'],
'[
  {"date": "2024-01-11", "notes": "Technical mentorship session - discussed advanced React patterns and system design."},
  {"date": "2024-01-18", "notes": "Career guidance - discussed engineering career paths and skill development."},
  {"date": "2024-01-25", "notes": "Networking introduction - connected Marcus with industry contacts."}
]', 4);

-- ===================================================================
-- MESSAGES (Complete Communication Threads)
-- ===================================================================

-- Messages (Complete message threads)
INSERT INTO messages (id, from_user_id, to_user_id, context, context_id, subject, body, sent_at, read_at) VALUES
(1, @TECH_UUID@, @MARCUS_UUID@, 'job_application', '1', 'Interview Request - Frontend Developer Position', 'Hi Marcus, thank you for your application! We were impressed with your background and would like to schedule an interview. Are you available next week for a video call with our tech lead? Go Purple Knights!', '2024-01-10 09:00:00', '2024-01-10 11:30:00'),
(2, @MARCUS_UUID@, @TECH_UUID@, 'job_application', '1', 'Re: Interview Request - Frontend Developer Position', 'Thank you for reaching out! I''m very excited about this opportunity. I''m available Tuesday afternoon or Wednesday morning next week. Looking forward to discussing how I can contribute to Tech Innovations!', '2024-01-10 11:45:00', '2024-01-10 14:00:00'),
(3, @ROBERT_UUID@, @MARCUS_UUID@, 'mentorship', '1', 'Congratulations on the Job Offer!', 'Marcus, I heard you got an offer from Tech Innovations - that''s fantastic news! Let''s connect this week to discuss negotiation strategies and ensure you get the best possible package. Proud to see a Purple Knight succeeding in tech!', '2024-01-25 16:00:00', '2024-01-25 18:30:00'),
(4, @MARCUS_UUID@, @ROBERT_UUID@, 'mentorship', '1', 'Re: Congratulations on the Job Offer!', 'Robert, thank you so much! Your guidance throughout this process has been invaluable. I''d love to get your advice on the offer details. I''m free Thursday afternoon if that works for you. Go Purple Knights!', '2024-01-25 19:00:00', '2024-01-26 09:00:00'),
(5, @GULF_UUID@, @SAMANTHA_UUID@, 'job_application', '4', 'Job Offer - Digital Marketing Specialist', 'Samantha, we were blown away by your interview and would like to extend an offer for the Digital Marketing Specialist position. The offer includes a competitive salary and opportunities for growth. We believe a Purple Knight like you would be perfect for our team!', '2024-01-28 10:00:00', '2024-01-28 14:00:00'),
(6, @SAMANTHA_UUID@, @GULF_UUID@, 'job_application', '4', 'Re: Job Offer - Digital Marketing Specialist', 'Thank you so much for the offer! I''m thrilled about this opportunity. I would like to discuss the details further, particularly around team leadership opportunities. When would be a good time to connect?', '2024-01-28 15:30:00', '2024-01-29 09:00:00');

-- ===================================================================
-- CAREER MILESTONES (Complete Achievement Tracking)
-- ===================================================================

-- Career Milestones (Complete milestone tracking)
INSERT INTO career_milestones (id, profile_id, milestone_type, details) VALUES
(1, @MARCUS_UUID@, 'profile_completed', '{"completion_date": "2023-12-01", "profile_strength": "excellent", "completion_percentage": 100}'),
(2, @MARCUS_UUID@, 'first_match', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "match_score": 95, "match_date": "2024-01-07"}'),
(3, @MARCUS_UUID@, 'first_application', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-08", "application_type": "direct_apply"}'),
(4, @MARCUS_UUID@, 'first_interview', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-15", "interview_type": "video"}'),
(5, @MARCUS_UUID@, 'first_offer', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "salary": 75000, "date": "2024-01-26"}'),
(6, @MARCUS_UUID@, 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-05", "focus_areas": ["career_planning", "entrepreneurship"]}'),
(7, @MARCUS_UUID@, 'first_hire', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "start_date": "2024-02-01", "salary": 75000}'),
(8, @MARCUS_UUID@, 'skill_endorsed', '{"skill": "React", "endorser": "Sarah Chen", "endorsement_count": 5, "date": "2024-01-20"}'),

(9, @SAMANTHA_UUID@, 'profile_completed', '{"completion_date": "2023-12-15", "profile_strength": "excellent", "completion_percentage": 100}'),
(10, @SAMANTHA_UUID@, 'first_application', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "date": "2024-01-09"}'),
(11, @SAMANTHA_UUID@, 'first_interview', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "date": "2024-01-18", "interview_type": "in_person"}'),
(12, @SAMANTHA_UUID@, 'first_offer', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "salary": 70000, "date": "2024-01-28"}'),
(13, @SAMANTHA_UUID@, 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-08", "focus_areas": ["leadership", "career_advancement"]}'),

(14, @ROBERT_UUID@, 'mentor_matched', '{"mentee_name": "Marcus Thompson", "match_date": "2024-01-05", "outcome": "successful_placement"}'),
(15, @ROBERT_UUID@, 'mentorship_completed', '{"mentee_name": "Marcus Thompson", "outcome": "successful_job_placement", "completion_date": "2024-02-01"}');

-- ===================================================================
-- NOTIFICATIONS (Complete Notification System)
-- ===================================================================

-- Notifications (Complete notification system)
INSERT INTO notifications (id, user_id, title, message, type, metadata, read) VALUES
(1, @MARCUS_UUID@, 'New Job Match', 'You have a 95% match for Frontend Developer at Tech Innovations! This company specifically seeks Purple Knights alumni.', 'job_match', '{"job_id": 1, "match_score": 95, "company": "Tech Innovations"}', false),
(2, @MARCUS_UUID@, 'Interview Request', 'Tech Innovations wants to schedule an interview for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "interview_scheduled"}', false),
(3, @MARCUS_UUID@, 'Job Offer Received', 'Congratulations! Tech Innovations has extended an offer for the Frontend Developer position with a salary of $75,000.', 'application_update', '{"application_id": 1, "status": "offer_extended", "salary": 75000}', false),
(4, @MARCUS_UUID@, 'New Message from Robert Johnson', 'Your mentor Robert Johnson has a message for you about your job offer!', 'message', '{"message_id": 3, "sender": "Robert Johnson"}', false),
(5, @MARCUS_UUID@, 'Offer Accepted', 'Congratulations! You have accepted the Frontend Developer position at Tech Innovations!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false),

(6, @SAMANTHA_UUID@, 'Application Update', 'Your application for Digital Marketing Specialist is being reviewed by Gulf Marketing Group.', 'application_update', '{"application_id": 4, "status": "reviewing"}', false),
(7, @SAMANTHA_UUID@, 'Interview Scheduled', 'Gulf Marketing Group has scheduled an interview for the Digital Marketing Specialist position.', 'application_update', '{"application_id": 4, "status": "interview_scheduled"}', false),
(8, @SAMANTHA_UUID@, 'Job Offer Received', 'Gulf Marketing Group has extended an offer for the Digital Marketing Specialist position!', 'application_update', '{"application_id": 4, "status": "offer_extended", "salary": 70000}', false),

(9, @ROBERT_UUID@, 'Mentorship Request', 'Marcus Thompson (Class of 2022) has requested mentorship in career planning and entrepreneurship.', 'mentor_request', '{"mentee_id": "marcus-id", "focus_areas": ["career_planning", "entrepreneurship"]}', false),
(10, @ROBERT_UUID@, 'Mentee Success', 'Congratulations! Your mentee Marcus Thompson has accepted a job offer from Tech Innovations!', 'mentorship_update', '{"mentee_id": "marcus-id", "outcome": "job_offer_accepted"}', false),

(11, @TECH_UUID@, 'New Application', 'Marcus Thompson (Purple Knight Class of 2022) has applied for the Frontend Developer position.', 'application_update', '{"application_id": 1, "applicant": "Marcus Thompson", "alumni": true}', false),
(12, @TECH_UUID@, 'Offer Accepted', 'Marcus Thompson has accepted your offer for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false);

-- ===================================================================
-- PLATFORM METRICS (Complete Analytics)
-- ===================================================================

-- Platform Metrics (Complete analytics dashboard)
INSERT INTO platform_metrics (id, metric_name, metric_value, metric_date, breakdown) VALUES
(1, 'total_alumni', 5, CURRENT_DATE, '{"verified": 5, "unverified": 0, "recent_graduates": 1, "mid_career": 2, "senior": 2}'),
(2, 'total_employers', 5, CURRENT_DATE, '{"active": 5, "alumni_friendly": 5, "hiring": 5}'),
(3, 'total_jobs', 5, CURRENT_DATE, '{"open": 5, "alumni_preferred": 5, "entry_level": 1, "mid_level": 4, "internship": 0}'),
(4, 'total_applications', 11, CURRENT_DATE, '{"applied": 11, "reviewing": 2, "interviewing": 1, "offer_extended": 2, "hired": 1}'),
(5, 'total_interviews', 5, CURRENT_DATE, '{"scheduled": 5, "completed": 5, "video": 3, "in_person": 2}'),
(6, 'total_offers', 3, CURRENT_DATE, '{"extended": 3, "accepted": 2, "pending": 1, "declined": 0}'),
(7, 'total_hires', 2, CURRENT_DATE, '{"purple_knights": 2, "recent_graduates": 1, "mid_career": 1}'),
(8, 'total_mentorships', 3, CURRENT_DATE, '{"active": 3, "completed": 1, "successful_placements": 1}'),
(9, 'total_messages', 6, CURRENT_DATE, '{"sent": 6, "read": 4, "job_related": 4, "mentorship": 2}'),
(10, 'engagement_rate', 92.5, CURRENT_DATE, '{"profile_completion": 100, "application_rate": 85, "response_rate": 95}'),
(11, 'success_rate', 18.2, CURRENT_DATE, '{"application_to_hire": 18.2, "interview_to_offer": 40, "offer_acceptance": 66.7}'),
(12, 'alumni_satisfaction', 4.8, CURRENT_DATE, '{"overall_rating": 4.8, "platform_usage": 4.7, "feature_satisfaction": 4.9}');
