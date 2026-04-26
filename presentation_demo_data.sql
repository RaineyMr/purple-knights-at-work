-- Purple Knights at Work - Presentation-Ready Demo Data
-- Complete profiles and comprehensive job descriptions for school presentation

-- ===================================================================
-- COMPLETE USER PROFILES (100% Complete with 5+ Examples of Each Feature)
-- ===================================================================

-- Alumni Profile 1: Marcus Thompson - Recent Graduate
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('marcus-id', 'Marcus', 'Thompson', 'alumni', 'Full-Stack Developer | React Specialist | Purple Knight Class of 2022', 'Passionate computer science graduate from LSU with expertise in React, Node.js, and modern web development. During my time at St. Augustine, I developed leadership skills through the student council and discovered my passion for technology through the computer club. I completed two internships during college and am now seeking to contribute to the New Orleans tech community while staying connected to my Purple Knight roots. My goal is to build innovative solutions that make a positive impact on people''s lives.', 2022, true, '504-555-0101', 'https://linkedin.com/in/marcusthompson', 'https://marcusthompson.dev', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf', true, ARRAY['Valedictorian', 'Computer Science Club President', 'National Honor Society', 'Student Council Treasurer', 'Hackathon Winner 2021']);

-- Marcus Skills (8 different skills across categories)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('marcus-id', 'JavaScript', 'technical', 'advanced', 5),
('marcus-id', 'React', 'technical', 'advanced', 4),
('marcus-id', 'Node.js', 'technical', 'intermediate', 3),
('marcus-id', 'Python', 'technical', 'intermediate', 2),
('marcus-id', 'TypeScript', 'technical', 'intermediate', 3),
('marcus-id', 'Git', 'technical', 'advanced', 4),
('marcus-id', 'Problem Solving', 'soft_skills', 'advanced', 6),
('marcus-id', 'Team Collaboration', 'soft_skills', 'advanced', 5),
('marcus-id', 'Communication', 'soft_skills', 'intermediate', 3),
('marcus-id', 'Public Speaking', 'soft_skills', 'intermediate', 2),
('marcus-id', 'Web Development', 'industry', 'advanced', 4),
('marcus-id', 'Software Development', 'industry', 'advanced', 5);

-- Marcus Experience (3 complete positions)
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('marcus-id', 'Tech Innovations', 'Frontend Developer Intern', '2021-06-01', '2021-08-31', false, 'Developed responsive web components using React and TypeScript, participated in daily stand-ups and code reviews, collaborated with UX team to implement pixel-perfect designs, and contributed to a 15% improvement in page load speeds through optimization techniques.', 'New Orleans, LA', 'Technology'),
('marcus-id', 'LSU Computer Lab', 'Teaching Assistant', '2020-08-01', '2021-05-01', false, 'Assisted 50+ students per semester with programming assignments, conducted weekly tutoring sessions for JavaScript and Python, maintained lab equipment and software, and organized study groups for midterm and final exams.', 'Baton Rouge, LA', 'Education'),
('marcus-id', 'St. Augustine Summer Camp', 'Counselor', '2019-06-01', '2019-08-31', false, 'Led group of 15 high school students in technology-focused summer camp, taught basic coding concepts and web development, organized team projects and presentations, and coordinated with parents on student progress.', 'New Orleans, LA', 'Education');

-- Marcus Education (Complete academic background)
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('marcus-id', 'Louisiana State University', 'Bachelor of Science', 'Computer Science', '2018-08-01', '2022-05-01', false, 3.9, ARRAY['Computer Science Club President', 'Hackathon Winner 2021', 'Dean''s List All Semesters', 'Tutor for Computer Science Courses', 'Research Assistant in AI Lab']);

-- Marcus Preferences (Complete career preferences)
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('marcus-id', 60000, 85000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX', 'Austin, TX'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Software Development', 'Web Development', 'FinTech', 'Healthcare Technology'], 'entry_level', ARRAY['Tech Innovations', 'Microsoft', 'Google', 'Local Startups', 'Government Agencies']);

-- Alumni Profile 2: Samantha Rodriguez - Marketing Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('samantha-id', 'Samantha', 'Rodriguez', 'alumni', 'Marketing Manager | Brand Strategist | Digital Campaign Expert | Purple Knight Class of 2015', 'Marketing professional with 8 years of experience building brands and driving growth through innovative digital strategies. At St. Augustine, I was captain of the debate team and editor of the school newspaper, experiences that shaped my communication skills and strategic thinking. I graduated cum laude from Tulane and have since worked with Fortune 500 companies and local businesses to create impactful marketing campaigns. I''m passionate about using data-driven insights to tell compelling brand stories and mentor the next generation of marketers.', 2015, true, '504-555-0105', 'https://linkedin.com/in/samantharodriguez', 'https://samantharodriguez.marketing', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf', true, ARRAY['Salutatorian', 'Debate Team Captain', 'Newspaper Editor', 'Student Government Vice President', 'Marketing Intern of the Year 2019']);

-- Samantha Skills (12 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('samantha-id', 'Digital Marketing', 'industry', 'expert', 12),
('samantha-id', 'Brand Strategy', 'industry', 'expert', 10),
('samantha-id', 'Team Leadership', 'soft_skills', 'expert', 8),
('samantha-id', 'Campaign Management', 'industry', 'expert', 11),
('samantha-id', 'Analytics', 'technical', 'advanced', 6),
('samantha-id', 'Content Strategy', 'industry', 'expert', 9),
('samantha-id', 'Budget Management', 'soft_skills', 'advanced', 7),
('samantha-id', 'Public Speaking', 'soft_skills', 'expert', 10),
('samantha-id', 'SEO', 'technical', 'advanced', 5),
('samantha-id', 'Social Media Marketing', 'industry', 'expert', 11),
('samantha-id', 'Email Marketing', 'industry', 'advanced', 7),
('samantha-id', 'Market Research', 'industry', 'advanced', 6);

-- Samantha Experience (4 complete positions)
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('samantha-id', 'Current Marketing Agency', 'Marketing Manager', '2020-03-01', NULL, true, 'Lead team of 5 marketing specialists, manage $2.5M annual budget, develop integrated campaigns for Fortune 500 clients, increased client ROI by 35% through data-driven strategies, and mentor junior team members.', 'New Orleans, LA', 'Marketing'),
('samantha-id', 'Previous Digital Agency', 'Digital Marketing Specialist', '2017-06-01', '2020-02-28', false, 'Managed social media campaigns for 15+ clients, increased engagement rates by 45%, developed content calendars and marketing strategies, conducted A/B testing for optimization, and presented campaign results to clients.', 'New Orleans, LA', 'Marketing'),
('samantha-id', 'Retail Corporation', 'Marketing Coordinator', '2015-07-01', '2017-05-31', false, 'Coordinated marketing events and product launches, created promotional materials and email campaigns, managed social media accounts with 50K+ followers, and analyzed campaign performance metrics.', 'Baton Rouge, LA', 'Retail'),
('samantha-id', 'Tulane Marketing Department', 'Graduate Assistant', '2015-09-01', '2017-05-01', false, 'Assisted professors with marketing research projects, conducted market analysis for local businesses, helped organize marketing conferences, and tutored undergraduate students.', 'New Orleans, LA', 'Education');

-- Samantha Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('samantha-id', 'Tulane University', 'Master of Business Administration', 'Marketing', '2015-08-01', '2017-05-01', false, 3.8, ARRAY['Marketing Association President', 'Case Competition Winner', 'Graduate Assistant', 'Research Assistant', 'Business Journal Club']),
('samantha-id', 'Tulane University', 'Bachelor of Science', 'Marketing', '2011-08-01', '2015-05-01', false, 3.9, ARRAY['Debate Team Captain', 'Student Government VP', 'Marketing Club VP', 'Dean''s List', 'Honors Thesis']);

-- Alumni Profile 3: Robert Johnson - CEO/Mentor
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('robert-id', 'Robert', 'Johnson', 'alumni', 'CEO & Founder | Serial Entrepreneur | Angel Investor | Purple Knight Mentor | Class of 2000', 'Serial entrepreneur with 20+ years of experience founding and scaling technology companies. My journey started at St. Augustine where I learned the importance of discipline and community - values that have guided my entrepreneurial career. After graduating from MIT, I founded my first company in 2005 and successfully exited in 2010. I then built and sold a second company before founding my current SaaS platform which serves over 10,000 customers. I''m passionate about giving back to the Purple Knights community through mentorship and supporting the next generation of entrepreneurs.', 2000, true, '504-555-0107', 'https://linkedin.com/in/robertjohnson', 'https://robertjohnson.com', 'https://resumes.purpleknights.work/robert-johnson-resume.pdf', true, ARRAY['National Merit Scholar', 'Student Body President', 'Basketball Team Captain', 'Science Fair Winner', 'Perfect Attendance']);

-- Robert Skills (15 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('robert-id', 'Strategic Planning', 'soft_skills', 'expert', 25),
('robert-id', 'Business Development', 'industry', 'expert', 20),
('robert-id', 'Leadership', 'soft_skills', 'expert', 30),
('robert-id', 'Fundraising', 'industry', 'expert', 18),
('robert-id', 'Public Speaking', 'soft_skills', 'expert', 22),
('robert-id', 'Mentorship', 'soft_skills', 'expert', 35),
('robert-id', 'Startup Strategy', 'industry', 'expert', 20),
('robert-id', 'Investment Analysis', 'technical', 'expert', 15),
('robert-id', 'Mergers & Acquisitions', 'industry', 'expert', 10),
('robert-id', 'Board Governance', 'soft_skills', 'expert', 12),
('robert-id', 'Product Management', 'industry', 'advanced', 8),
('robert-id', 'Financial Modeling', 'technical', 'expert', 16),
('robert-id', 'Team Building', 'soft_skills', 'expert', 28),
('robert-id', 'Negotiation', 'soft_skills', 'expert', 20),
('robert-id', 'Innovation Strategy', 'industry', 'expert', 15);

-- Robert Experience (5 complete positions)
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('robert-id', 'Current SaaS Company', 'CEO & Founder', '2018-01-01', NULL, true, 'Built and scaled B2B SaaS platform to $50M ARR, raised $25M in Series B funding, lead team of 150+ employees across 5 countries, implemented scalable company culture, and achieved 200% year-over-year growth.', 'Austin, TX', 'Technology'),
('robert-id', 'Second Startup', 'Founder & CEO', '2010-05-01', '2017-12-31', false, 'Founded mobile app company, grew to 500K users in 3 years, raised $8M in Series A funding, successfully acquired by larger tech company for $15M, managed team of 45 employees.', 'San Francisco, CA', 'Technology'),
('robert-id', 'Investment Bank', 'Investment Analyst', '2009-07-01', '2010-04-30', false, 'Analyzed technology investments and supported due diligence for venture capital deals, evaluated startup pitches and business models, created financial models and investment memos, and worked with portfolio companies.', 'New York, NY', 'Finance'),
('robert-id', 'First Startup', 'Co-Founder', '2005-06-01', '2009-05-31', false, 'Co-founded e-commerce platform for local businesses, secured $500K in angel funding, developed product from concept to launch, managed team of 8 developers and marketers.', 'Boston, MA', 'Technology'),
('robert-id', 'MIT Research Lab', 'Research Assistant', '2000-09-01', '2004-05-01', false, 'Conducted research in artificial intelligence and machine learning, published 3 papers in peer-reviewed journals, presented at international conferences, and assisted in teaching graduate courses.', 'Cambridge, MA', 'Education');

-- Robert Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('robert-id', 'Massachusetts Institute of Technology', 'Master of Science', 'Computer Science', '2004-09-01', '2005-06-01', false, 3.9, ARRAY['Research Assistant', 'Teaching Assistant', 'Entrepreneurship Club', 'Innovation Competition Winner', 'Published Author']),
('robert-id', 'Massachusetts Institute of Technology', 'Bachelor of Science', 'Computer Science', '2000-09-01', '2004-05-01', false, 3.8, ARRAY['Dean''s List', 'Varsity Basketball', 'Student Government', 'Hackathon Organizer', 'Tutor']);

-- Alumni Profile 4: Patricia Brown - VP of Engineering
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('patricia-id', 'Patricia', 'Brown', 'alumni', 'VP of Engineering | Tech Leader | Women in STEM Advocate | Purple Knight Class of 1998', 'Technology executive with 20+ years of experience leading engineering teams and building scalable systems. At St. Augustine, I was one of the first girls to join the computer club and discovered my passion for technology. I broke barriers as a woman in tech and now advocate for diversity and inclusion in the workplace. I''ve led engineering teams at three major tech companies and am currently responsible for a global team of 200+ engineers. I''m committed to mentoring the next generation, especially women and minorities pursuing careers in technology.', 1998, true, '504-555-0108', 'https://linkedin.com/in/patriciabrown', 'https://patriciabrown.tech', 'https://resumes.purpleknights.work/patricia-brown-resume.pdf', true, ARRAY['First in Computer Club', 'Valedictorian', 'Science Fair Grand Champion', 'Girls in Tech Founder', 'Community Service Award']);

-- Patricia Skills (14 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('patricia-id', 'Engineering Leadership', 'soft_skills', 'expert', 22),
('patricia-id', 'Cloud Architecture', 'technical', 'expert', 18),
('patricia-id', 'Team Management', 'soft_skills', 'expert', 20),
('patricia-id', 'System Design', 'technical', 'expert', 16),
('patricia-id', 'Agile Methodologies', 'industry', 'expert', 15),
('patricia-id', 'Diversity & Inclusion', 'soft_skills', 'expert', 12),
('patricia-id', 'DevOps', 'technical', 'expert', 14),
('patricia-id', 'Mentoring', 'soft_skills', 'expert', 25),
('patricia-id', 'Strategic Planning', 'soft_skills', 'advanced', 10),
('patricia-id', 'Microservices', 'technical', 'expert', 12),
('patricia-id', 'API Design', 'technical', 'expert', 11),
('patricia-id', 'Performance Optimization', 'technical', 'advanced', 9),
('patricia-id', 'Public Speaking', 'soft_skills', 'expert', 18),
('patricia-id', 'Budget Management', 'soft_skills', 'advanced', 8);

-- Alumni Profile 5: James Miller - Attorney & Mentor
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('james-id', 'James', 'Miller', 'alumni', 'Partner | Corporate Attorney | Legal Advisor | Purple Knight Class of 1996', 'Corporate attorney with 25+ years of experience specializing in mergers, acquisitions, and corporate governance. My time at St. Augustine taught me the importance of integrity and service - values that guide my legal practice today. I graduated from Harvard Law School and have been a partner at a prominent New Orleans law firm for 15 years. I serve on several corporate boards and am passionate about mentoring young professionals, especially those interested in law and business. I believe in giving back to the community that shaped me.', 1996, true, '504-555-0109', 'https://linkedin.com/in/jamesmiller', NULL, 'https://resumes.purpleknights.work/james-miller-resume.pdf', true, ARRAY['National Honor Society President', 'Debate Team Captain', 'Mock Trial Champion', 'Student Council President', 'Community Service Award']);

-- James Skills (12 different skills)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('james-id', 'Corporate Law', 'industry', 'expert', 30),
('james-id', 'Mergers & Acquisitions', 'industry', 'expert', 25),
('james-id', 'Legal Research', 'technical', 'expert', 20),
('james-id', 'Contract Negotiation', 'soft_skills', 'expert', 22),
('james-id', 'Due Diligence', 'industry', 'expert', 18),
('james-id', 'Corporate Governance', 'industry', 'expert', 15),
('james-id', 'Public Speaking', 'soft_skills', 'expert', 25),
('james-id', 'Mentorship', 'soft_skills', 'expert', 20),
('james-id', 'Risk Management', 'industry', 'advanced', 12),
('james-id', 'Board Advisory', 'soft_skills', 'advanced', 10),
('james-id', 'Legal Writing', 'technical', 'expert', 18),
('james-id', 'Client Relations', 'soft_skills', 'expert', 22);

-- ===================================================================
-- EMPLOYER PROFILES (Complete with Full Company Details)
-- ===================================================================

-- Employer 1: Tech Innovations
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('techinnovations-id', 'Tech', 'Innovations', 'employer', 'Tech Innovations', 'Technology', '50-100', 'https://techinnovations.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=TI', 'New Orleans, LA', NULL);

-- Employer 2: Gulf Marketing Group
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('gulfmarketing-id', 'Gulf', 'Marketing', 'employer', 'Gulf Marketing Group', 'Marketing & Advertising', '25-50', 'https://gulfmarketing.com', 'https://via.placeholder.com/150x150/F59E0B/FFFFFF?text=GM', 'New Orleans, LA', NULL);

-- Employer 3: Financial Services LLC
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('financialservices-id', 'Financial', 'Services', 'employer', 'Financial Services LLC', 'Finance & Banking', '100-250', 'https://financialservicesllc.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=FS', 'New Orleans, LA', NULL);

-- Employer 4: Healthcare Plus
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('healthcare-id', 'Healthcare', 'Plus', 'employer', 'Healthcare Plus', 'Healthcare', '200-500', 'https://healthcareplus.com', 'https://via.placeholder.com/150x150/10B981/FFFFFF?text=HP', 'New Orleans, LA', NULL);

-- Employer 5: Education First
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('education-id', 'Education', 'First', 'employer', 'Education First', 'Education', '50-100', 'https://educationfirst.com', 'https://via.placeholder.com/150x150/8B5CF6/FFFFFF?text=EF', 'New Orleans, LA', NULL);

-- ===================================================================
-- COMPREHENSIVE JOB POSTINGS (100% Complete with Full Details)
-- ===================================================================

-- Job 1: Frontend Developer at Tech Innovations
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(1, 'techinnovations-id', 'Frontend Developer', 
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
- Opportunities for growth and advancement

**Why Tech Innovations?**
We are a fast-growing technology company that values innovation, collaboration, and community impact. We believe in hiring the best talent and providing them with the resources they need to succeed. Our team is comprised of passionate individuals who are committed to making a difference through technology. As a Purple Knight-friendly employer, we understand the value of hiring alumni who share our values of excellence, integrity, and service.

Join us in building cutting-edge solutions that make a real difference in people''s lives!', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 65000, 85000, 'USD', 
ARRAY['JavaScript', 'React', 'TypeScript', 'HTML5', 'CSS3'], 
ARRAY['Node.js', 'Git', 'Redux', 'Next.js', 'GraphQL'], 
'entry_level', true, 'open', '2024-01-01', '2024-02-15');

-- Job 2: Marketing Specialist at Gulf Marketing Group
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(2, 'gulfmarketing-id', 'Digital Marketing Specialist', 
'Gulf Marketing Group is looking for a creative and data-driven Digital Marketing Specialist to join our dynamic team in New Orleans. This role is perfect for St. Augustine High School alumni who are passionate about marketing and want to make an impact in the local business community. You will be responsible for developing and executing digital marketing campaigns across multiple platforms, analyzing campaign performance, and contributing to our clients'' success.

**Key Responsibilities:**
- Develop and implement comprehensive digital marketing strategies
- Manage social media campaigns across Facebook, Instagram, LinkedIn, and Twitter
- Create engaging content including blog posts, videos, and infographics
- Conduct market research and analyze competitor strategies
- Monitor and report on campaign performance using analytics tools
- Optimize campaigns based on data-driven insights
- Collaborate with creative teams to produce high-quality marketing materials
- Manage email marketing campaigns and newsletters

**Required Qualifications:**
- Bachelor''s degree in Marketing, Communications, or related field
- 2-4 years of experience in digital marketing
- Proven track record of successful marketing campaigns
- Strong understanding of social media platforms and digital marketing tools
- Excellent written and verbal communication skills
- Analytical mindset with experience using marketing analytics
- Creative thinking and problem-solving abilities
- Ability to manage multiple projects and deadlines

**Preferred Qualifications:**
- Experience with SEO and SEM strategies
- Knowledge of marketing automation tools
- Graphic design skills using Adobe Creative Suite
- Experience with paid advertising campaigns
- Understanding of marketing funnels and conversion optimization
- Purple Knight alumni with strong community connections

**What We Offer:**
- Competitive salary ($55,000 - $75,000)
- Performance-based bonuses and incentives
- Health, dental, and vision insurance
- Flexible work schedule with remote options
- Professional development opportunities
- Collaborative and creative work environment
- Chance to work with diverse clients across industries
- Growth opportunities within the company

**About Gulf Marketing Group:**
We are a full-service marketing agency that helps businesses grow through innovative digital strategies. Our team is passionate about creating meaningful connections between brands and their audiences. We particularly value Purple Knight alumni for their strong work ethic, creativity, and understanding of the local community. Join us in helping New Orleans businesses thrive in the digital age!', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'hybrid', 55000, 75000, 'USD', 
ARRAY['Digital Marketing', 'Social Media Management', 'Content Creation', 'Analytics', 'Communication'], 
ARRAY['SEO', 'Email Marketing', 'Graphic Design', 'Campaign Management', 'Market Research'], 
'mid_level', true, 'open', '2024-01-02', '2024-02-20');

-- Job 3: Financial Analyst at Financial Services LLC
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(3, 'financialservices-id', 'Financial Analyst', 
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

**Required Skills and Experience:**
- Bachelor''s degree in Finance, Economics, Business, or related field
- 1-3 years of experience in financial analysis or investment research
- Strong proficiency in Excel and financial modeling
- Excellent analytical and quantitative skills
- Knowledge of financial markets and investment principles
- Ability to interpret complex financial data and trends
- Strong attention to detail and accuracy
- Excellent written and verbal communication skills

**Preferred Qualifications:**
- Master''s degree in Finance or MBA
- Experience with financial data platforms (Bloomberg, FactSet)
- Knowledge of SQL and data analysis tools
- CFA charter or progress toward CFA designation
- Experience with portfolio management
- Understanding of regulatory requirements in financial services
- Purple Knight alumni with strong academic background

**Compensation and Benefits:**
- Competitive salary ($60,000 - $85,000)
- Performance-based bonuses
- Comprehensive benefits package including health insurance
- 401(k) plan with generous company match
- Professional development and CFA exam support
- Flexible work arrangements
- Opportunities for advancement within the firm
- Collaborative and intellectually stimulating environment

**About Financial Services LLC:**
We are a leading financial services firm that provides investment advisory and wealth management services to individuals and institutions. Our team combines deep industry expertise with cutting-edge technology to deliver superior investment solutions. We particularly value Purple Knight alumni for their analytical skills, integrity, and commitment to excellence. Join us in helping clients achieve their financial goals!', 'full_time', 'Finance & Banking', 'New Orleans, LA', 'on_site', 60000, 85000, 'USD', 
ARRAY['Financial Analysis', 'Excel', 'Financial Modeling', 'Research', 'Quantitative Analysis'], 
ARRAY['SQL', 'Power BI', 'Bloomberg Terminal', 'Valuation', 'Portfolio Management'], 
'entry_level', true, 'open', '2024-01-03', '2024-02-18');

-- Job 4: Healthcare Administrator at Healthcare Plus
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(4, 'healthcare-id', 'Healthcare Administrator', 
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

**Required Qualifications:**
- Bachelor''s degree in Healthcare Administration, Business, or related field
- 2-5 years of experience in healthcare management or administration
- Strong understanding of healthcare operations and regulations
- Excellent leadership and team management skills
- Knowledge of healthcare information systems and technology
- Strong problem-solving and decision-making abilities
- Excellent communication and interpersonal skills
- Ability to work in a fast-paced healthcare environment

**Preferred Qualifications:**
- Master''s degree in Healthcare Administration (MHA) or MBA
- Experience with electronic health records (EHR) systems
- Knowledge of healthcare finance and reimbursement
- Experience with quality improvement initiatives
- Understanding of healthcare compliance and risk management
- Purple Knight alumni with healthcare experience or interest
- Bilingual abilities (English/Spanish)

**Benefits and Compensation:**
- Competitive salary ($70,000 - $95,000)
- Comprehensive health, dental, and vision insurance
- Generous paid time off and holidays
- 401(k) plan with company matching
- Professional development and continuing education support
- Tuition reimbursement for advanced degrees
- Flexible scheduling options
- Opportunity to make a meaningful impact in healthcare

**About Healthcare Plus:**
We are a leading healthcare provider committed to delivering high-quality patient care in the New Orleans community. Our organization values compassion, excellence, and innovation in healthcare delivery. We particularly seek Purple Knight alumni who share our commitment to service and community health. Join us in our mission to improve healthcare outcomes and serve our community!', 'full_time', 'Healthcare', 'New Orleans, LA', 'hybrid', 70000, 95000, 'USD', 
ARRAY['Healthcare Management', 'Leadership', 'Operations Management', 'Regulatory Compliance', 'Budget Management'], 
ARRAY['EHR Systems', 'Quality Improvement', 'Risk Management', 'Healthcare Finance', 'Staff Development'], 
'mid_level', true, 'open', '2024-01-04', '2024-02-22');

-- Job 5: Education Program Manager at Education First
INSERT INTO job_postings (id, employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, salary_currency, required_skills, preferred_skills, experience_level, alumni_preferred, status, posted_date, deadline) VALUES
(5, 'education-id', 'Education Program Manager', 
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

**Required Qualifications:**
- Bachelor''s degree in Education, Program Management, or related field
- 3-5 years of experience in educational program management
- Strong understanding of curriculum development and educational best practices
- Excellent project management and organizational skills
- Ability to work collaboratively with diverse stakeholders
- Strong communication and presentation skills
- Experience with educational technology and learning management systems
- Passion for education and community service

**Preferred Qualifications:**
- Master''s degree in Education or related field
- Teaching certification or classroom experience
- Experience with grant writing and program funding
- Knowledge of educational assessment and evaluation methods
- Bilingual abilities (English/Spanish)
- Experience working with K-12 education systems
- Purple Knight alumni with strong ties to the local education community

**Compensation and Benefits:**
- Competitive salary ($60,000 - $80,000)
- Comprehensive benefits package including health insurance
- Professional development opportunities and tuition reimbursement
- Flexible work schedule with remote options
- Generous paid time off and school holiday breaks
- Opportunity to make a meaningful impact in education
- Collaborative and mission-driven work environment
- Growth opportunities within the organization

**About Education First:**
We are a nonprofit organization dedicated to improving educational outcomes for students in New Orleans. Our programs focus on innovative teaching methods, technology integration, and community partnerships. We particularly value Purple Knight alumni for their understanding of the local education landscape and commitment to academic excellence. Join us in our mission to transform education and empower the next generation!', 'full_time', 'Education', 'New Orleans, LA', 'hybrid', 60000, 80000, 'USD', 
ARRAY['Program Management', 'Curriculum Development', 'Educational Technology', 'Stakeholder Management', 'Assessment'], 
ARRAY['Grant Writing', 'Data Analysis', 'Teacher Training', 'Community Outreach', 'Educational Research'], 
'mid_level', true, 'open', '2024-01-05', '2024-02-25');

-- ===================================================================
-- APPLICATIONS, INTERVIEWS, AND OFFERS (Complete Workflows for Each User)
-- ===================================================================

-- Marcus Applications (3 applications with full workflow)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 1, 'marcus-id', 'techinnovations-id', '2024-01-08', 'direct_apply', 'offer_accepted', 'As a recent computer science graduate from LSU and proud St. Augustine Class of 2022 alumnus, I am excited about the Frontend Developer position at Tech Innovations. My experience with React, TypeScript, and modern web technologies, combined with my passion for creating user-friendly applications, makes me a strong candidate. During my internship at Tech Innovations, I developed responsive web components and contributed to a 15% improvement in page load speeds. I am particularly drawn to your company''s commitment to the Purple Knights community and would be proud to represent St. Augustine alumni on your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(2, 3, 'marcus-id', 'financialservices-id', '2024-01-10', 'system_match', 'interviewing', 'While my primary focus is software development, I have strong analytical skills and experience with data analysis that would transfer well to financial analysis. My computer science background has given me excellent quantitative abilities and experience with complex problem-solving. I am interested in exploring how my technical skills could bring value to financial services, and I believe my Purple Knight work ethic would be an asset to your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(3, 4, 'marcus-id', 'healthcare-id', '2024-01-12', 'direct_apply', 'applied', 'As a technology professional with strong organizational and leadership skills, I am interested in exploring how my background could support healthcare technology initiatives. My experience with system optimization and user experience design could be valuable for healthcare administration. I am particularly drawn to Healthcare Plus''s mission and would welcome the opportunity to contribute to improving healthcare in our community.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf');

-- Samantha Applications (3 applications)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(4, 2, 'samantha-id', 'gulfmarketing-id', '2024-01-09', 'direct_apply', 'offer_extended', 'With 8 years of marketing experience and proven success in digital campaign management, I am the ideal candidate for the Digital Marketing Specialist position. I have grown engagement rates by 45% in my current position and managed budgets up to $2.5M. As a St. Augustine alumna, I understand the local market and community, which would be valuable for your clients. I am excited about the opportunity to bring my expertise to Gulf Marketing Group while representing the Purple Knights community.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf'),
(5, 5, 'samantha-id', 'education-id', '2024-01-11', 'direct_apply', 'interviewing', 'My marketing experience includes developing educational campaigns and working with community organizations. I believe my skills in stakeholder management and program coordination would be valuable for education program management. As a Purple Knight alumna, I have a deep understanding of the local education landscape and am passionate about supporting educational initiatives in our community.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf'),
(6, 1, 'samantha-id', 'techinnovations-id', '2024-01-13', 'system_match', 'applied', 'While my background is primarily in marketing, I have experience with digital strategy and user engagement that could be valuable for tech companies. I am interested in exploring how marketing expertise could support technology companies, particularly in user acquisition and brand building. I would be excited to bring my Purple Knight perspective to the tech industry.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf');

-- Robert Applications (As Mentor/Employer - different role)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(7, 1, 'robert-id', 'techinnovations-id', '2024-01-07', 'employer_request', 'hired', 'As CEO and founder of a successful SaaS company, I am interested in exploring advisory opportunities with Tech Innovations. My experience in scaling technology companies and building high-performing teams could provide valuable insights for your growth. I am particularly interested in supporting fellow Purple Knights in the technology sector.', 'https://resumes.purpleknights.work/robert-johnson-resume.pdf');

-- Patricia Applications (2 applications)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(8, 1, 'patricia-id', 'techinnovations-id', '2024-01-06', 'direct_apply', 'reviewing', 'As VP of Engineering with 20+ years of experience leading technology teams, I am interested in exploring board advisory or consulting opportunities with promising tech companies. My expertise in scaling engineering organizations and building robust systems could provide strategic value. I am committed to supporting fellow Purple Knights in the technology industry.', 'https://resumes.purpleknights.work/patricia-brown-resume.pdf'),
(9, 3, 'patricia-id', 'financialservices-id', '2024-01-14', 'system_match', 'applied', 'My background in technology includes extensive experience with data systems and analytics that could be valuable for financial services companies. I am interested in exploring how technology leadership experience could support innovation in financial services. As a Purple Knight, I would be proud to contribute to the local business community.', 'https://resumes.purpleknights.work/patricia-brown-resume.pdf');

-- James Applications (2 applications)
INSERT INTO applications (id, job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(10, 3, 'james-id', 'financialservices-id', '2024-01-08', 'direct_apply', 'reviewing', 'As a corporate attorney with extensive experience in mergers and acquisitions, I am interested in exploring advisory or board opportunities with financial services companies. My legal expertise and business experience could provide valuable governance and strategic guidance. I am particularly interested in supporting Purple Knight-owned and operated businesses.', 'https://resumes.purpleknights.work/james-miller-resume.pdf'),
(11, 5, 'james-id', 'education-id', '2024-01-15', 'direct_apply', 'applied', 'My legal experience includes working with educational institutions and nonprofit organizations. I believe my expertise in governance and compliance could be valuable for educational program management. As a Purple Knight, I am passionate about supporting education initiatives in our community.', 'https://resumes.purpleknights.work/james-miller-resume.pdf');

-- ===================================================================
-- INTERVIEWS, OFFERS, AND HIRING RECORDS (Complete Workflows)
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
(1, 'robert-id', 'marcus-id', '2024-01-05', 'active', ARRAY['career_planning', 'entrepreneurship', 'networking', 'technical_skills', 'leadership'], 
'[
  {"date": "2024-01-10", "notes": "Initial meeting - discussed Marcus''s career goals and startup interests. Reviewed resume and identified key strengths."},
  {"date": "2024-01-17", "notes": "Discussed interview preparation and negotiation strategies. Provided insights into tech industry trends."},
  {"date": "2024-01-24", "notes": "Celebrated job offer success, discussed negotiation tactics and career path planning."},
  {"date": "2024-01-31", "notes": "Onboarding check-in - discussed first week experiences and long-term career goals."}
]', 5),
(2, 'robert-id', 'samantha-id', '2024-01-08', 'active', ARRAY['leadership', 'career_advancement', 'business_strategy', 'networking', 'work_life_balance'],
'[
  {"date": "2024-01-12", "notes": "Initial consultation - discussed Samantha''s leadership aspirations and current challenges."},
  {"date": "2024-01-19", "notes": "Reviewed job offer and discussed career advancement opportunities. Provided negotiation guidance."},
  {"date": "2024-01-26", "notes": "Discussed team leadership strategies and professional development planning."}
]', 4),
(3, 'patricia-id', 'marcus-id', '2024-01-06', 'active', ARRAY['technical_skills', 'career_development', 'industry_guidance', 'networking'],
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
(1, 'techinnovations-id', 'marcus-id', 'job_application', '1', 'Interview Request - Frontend Developer Position', 'Hi Marcus, thank you for your application! We were impressed with your background and would like to schedule an interview. Are you available next week for a video call with our tech lead? Go Purple Knights!', '2024-01-10 09:00:00', '2024-01-10 11:30:00'),
(2, 'marcus-id', 'techinnovations-id', 'job_application', '1', 'Re: Interview Request - Frontend Developer Position', 'Thank you for reaching out! I''m very excited about this opportunity. I''m available Tuesday afternoon or Wednesday morning next week. Looking forward to discussing how I can contribute to Tech Innovations!', '2024-01-10 11:45:00', '2024-01-10 14:00:00'),
(3, 'robert-id', 'marcus-id', 'mentorship', '1', 'Congratulations on the Job Offer!', 'Marcus, I heard you got an offer from Tech Innovations - that''s fantastic news! Let''s connect this week to discuss negotiation strategies and ensure you get the best possible package. Proud to see a Purple Knight succeeding in tech!', '2024-01-25 16:00:00', '2024-01-25 18:30:00'),
(4, 'marcus-id', 'robert-id', 'mentorship', '1', 'Re: Congratulations on the Job Offer!', 'Robert, thank you so much! Your guidance throughout this process has been invaluable. I''d love to get your advice on the offer details. I''m free Thursday afternoon if that works for you. Go Purple Knights!', '2024-01-25 19:00:00', '2024-01-26 09:00:00'),
(5, 'gulfmarketing-id', 'samantha-id', 'job_application', '4', 'Job Offer - Digital Marketing Specialist', 'Samantha, we were blown away by your interview and would like to extend an offer for the Digital Marketing Specialist position. The offer includes a competitive salary and opportunities for growth. We believe a Purple Knight like you would be perfect for our team!', '2024-01-28 10:00:00', '2024-01-28 14:00:00'),
(6, 'samantha-id', 'gulfmarketing-id', 'job_application', '4', 'Re: Job Offer - Digital Marketing Specialist', 'Thank you so much for the offer! I''m thrilled about this opportunity. I would like to discuss the details further, particularly around team leadership opportunities. When would be a good time to connect?', '2024-01-28 15:30:00', '2024-01-29 09:00:00');

-- ===================================================================
-- CAREER MILESTONES (Complete Achievement Tracking)
-- ===================================================================

-- Career Milestones (Complete milestone tracking)
INSERT INTO career_milestones (id, profile_id, milestone_type, details) VALUES
(1, 'marcus-id', 'profile_completed', '{"completion_date": "2023-12-01", "profile_strength": "excellent", "completion_percentage": 100}'),
(2, 'marcus-id', 'first_match', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "match_score": 95, "match_date": "2024-01-07"}'),
(3, 'marcus-id', 'first_application', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-08", "application_type": "direct_apply"}'),
(4, 'marcus-id', 'first_interview', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-15", "interview_type": "video"}'),
(5, 'marcus-id', 'first_offer', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "salary": 75000, "date": "2024-01-26"}'),
(6, 'marcus-id', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-05", "focus_areas": ["career_planning", "entrepreneurship"]}'),
(7, 'marcus-id', 'first_hire', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "start_date": "2024-02-01", "salary": 75000}'),
(8, 'marcus-id', 'skill_endorsed', '{"skill": "React", "endorser": "Sarah Chen", "endorsement_count": 5, "date": "2024-01-20"}'),

(9, 'samantha-id', 'profile_completed', '{"completion_date": "2023-12-15", "profile_strength": "excellent", "completion_percentage": 100}'),
(10, 'samantha-id', 'first_application', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "date": "2024-01-09"}'),
(11, 'samantha-id', 'first_interview', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "date": "2024-01-18", "interview_type": "in_person"}'),
(12, 'samantha-id', 'first_offer', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "salary": 70000, "date": "2024-01-28"}'),
(13, 'samantha-id', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-08", "focus_areas": ["leadership", "career_advancement"]}'),

(14, 'robert-id', 'mentor_matched', '{"mentee_name": "Marcus Thompson", "match_date": "2024-01-05", "outcome": "successful_placement"}'),
(15, 'robert-id', 'mentorship_completed', '{"mentee_name": "Marcus Thompson", "outcome": "successful_job_placement", "completion_date": "2024-02-01"}');

-- ===================================================================
-- NOTIFICATIONS (Complete Notification System)
-- ===================================================================

-- Notifications (Complete notification system)
INSERT INTO notifications (id, user_id, title, message, type, metadata, read) VALUES
(1, 'marcus-id', 'New Job Match', 'You have a 95% match for Frontend Developer at Tech Innovations! This company specifically seeks Purple Knights alumni.', 'job_match', '{"job_id": 1, "match_score": 95, "company": "Tech Innovations"}', false),
(2, 'marcus-id', 'Interview Request', 'Tech Innovations wants to schedule an interview for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "interview_scheduled"}', false),
(3, 'marcus-id', 'Job Offer Received', 'Congratulations! Tech Innovations has extended an offer for the Frontend Developer position with a salary of $75,000.', 'application_update', '{"application_id": 1, "status": "offer_extended", "salary": 75000}', false),
(4, 'marcus-id', 'New Message from Robert Johnson', 'Your mentor Robert Johnson has a message for you about your job offer!', 'message', '{"message_id": 3, "sender": "Robert Johnson"}', false),
(5, 'marcus-id', 'Offer Accepted', 'Congratulations! You have accepted the Frontend Developer position at Tech Innovations!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false),

(6, 'samantha-id', 'Application Update', 'Your application for Digital Marketing Specialist is being reviewed by Gulf Marketing Group.', 'application_update', '{"application_id": 4, "status": "reviewing"}', false),
(7, 'samantha-id', 'Interview Scheduled', 'Gulf Marketing Group has scheduled an interview for the Digital Marketing Specialist position.', 'application_update', '{"application_id": 4, "status": "interview_scheduled"}', false),
(8, 'samantha-id', 'Job Offer Received', 'Gulf Marketing Group has extended an offer for the Digital Marketing Specialist position!', 'application_update', '{"application_id": 4, "status": "offer_extended", "salary": 70000}', false),

(9, 'robert-id', 'Mentorship Request', 'Marcus Thompson (Class of 2022) has requested mentorship in career planning and entrepreneurship.', 'mentor_request', '{"mentee_id": "marcus-id", "focus_areas": ["career_planning", "entrepreneurship"]}', false),
(10, 'robert-id', 'Mentee Success', 'Congratulations! Your mentee Marcus Thompson has accepted a job offer from Tech Innovations!', 'mentorship_update', '{"mentee_id": "marcus-id", "outcome": "job_offer_accepted"}', false),

(11, 'techinnovations-id', 'New Application', 'Marcus Thompson (Purple Knight Class of 2022) has applied for the Frontend Developer position.', 'application_update', '{"application_id": 1, "applicant": "Marcus Thompson", "alumni": true}', false),
(12, 'techinnovations-id', 'Offer Accepted', 'Marcus Thompson has accepted your offer for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false);

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
