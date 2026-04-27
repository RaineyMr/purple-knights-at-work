-- Purple Knights at Work - Demo Data Script
-- Run this after setting up the database schema to create sample accounts and jobs

-- First, create auth users (you'll need to do this manually in Supabase Auth)
-- Then use their IDs in the profile insertions below

-- Demo Alumni Profiles
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, allow_employer_contact) VALUES
-- Recent Graduates
('alumni-1-id', 'Marcus', 'Thompson', 'alumni', 'Software Developer | Tech Enthusiast', 'Passionate full-stack developer with experience in React and Node.js. Looking to make an impact in the New Orleans tech scene.', 2022, true, '504-555-0101', 'linkedin.com/in/marcusthompson', 'marcusthompson.dev', true),
('alumni-2-id', 'Jasmine', 'Washington', 'alumni', 'Marketing Professional | Digital Strategist', 'Creative marketing professional with 3 years of experience in digital campaigns and brand management. Class of 2021.', 2021, true, '504-555-0102', 'linkedin.com/in/jasminewashington', NULL, true),
('alumni-3-id', 'Andre', 'Broussard', 'alumni', 'Business Analyst | Data-Driven Decision Maker', 'Recent graduate with strong analytical skills and experience in business intelligence tools. Seeking opportunities in finance.', 2023, true, '504-555-0103', 'linkedin.com/in/andrebroussard', NULL, true),

-- Mid-Career Alumni
('alumni-4-id', 'David', 'Chen', 'alumni', 'Senior Software Engineer | Team Lead', '10+ years of experience in software development, currently leading a team of 8 engineers at a Fortune 500 company. Class of 2014.', 2014, true, '504-555-0104', 'linkedin.com/in/davidchen', NULL, true),
('alumni-5-id', 'Samantha', 'Rodriguez', 'alumni', 'Marketing Director | Brand Strategist', 'Experienced marketing leader with proven track record of growing brands and managing multi-million dollar campaigns. Class of 2015.', 2015, true, '504-555-0105', 'linkedin.com/in/samantharodriguez', NULL, true),
('alumni-6-id', 'Michael', 'Williams', 'alumni', 'Finance Manager | CPA', 'Certified Public Accountant with extensive experience in financial planning and analysis. Currently working in investment banking. Class of 2012.', 2012, true, '504-555-0106', 'linkedin.com/in/michaelwilliams', NULL, true),

-- Senior Alumni (Potential Mentors)
('alumni-7-id', 'Robert', 'Johnson', 'alumni', 'CEO | Entrepreneur | Investor', 'Founded and sold two tech companies. Currently CEO of a growing SaaS company. Passionate about mentoring young entrepreneurs. Class of 2005.', 2005, true, '504-555-0107', 'linkedin.com/in/robertjohnson', 'robertjohnson.com', true),
('alumni-8-id', 'Patricia', 'Brown', 'alumni', 'VP of Engineering | Tech Leader', '20+ years in technology, currently VP of Engineering at a major tech company. Advocate for women in STEM. Class of 2000.', 2000, true, '504-555-0108', 'linkedin.com/in/patriciabrown', NULL, true),
('alumni-9-id', 'James', 'Miller', 'alumni', 'Partner | Law Firm | Corporate Attorney', 'Partner at a prominent New Orleans law firm specializing in corporate law. Active in alumni mentorship program. Class of 1998.', 1998, true, '504-555-0109', 'linkedin.com/in/jamesmiller', NULL, true),

-- Demo Employer Profiles
('employer-1-id', 'Tech', 'Innovations', 'employer', NULL, NULL, NULL, NULL, '504-555-0201', NULL, 'techinnovations.com', 'New Orleans, LA', NULL),
('employer-2-id', 'Gulf', 'Marketing Group', 'employer', NULL, NULL, NULL, NULL, '504-555-0202', NULL, 'gulfmarketing.com', 'New Orleans, LA', NULL),
('employer-3-id', 'Financial', 'Services LLC', 'employer', NULL, NULL, NULL, NULL, '504-555-0203', NULL, 'financialservicesllc.com', 'New Orleans, LA', NULL),

-- Demo Mentor Profile (also an alumni)
('mentor-1-id', 'Thomas', 'Anderson', 'mentor', 'Executive Coach | Career Development Expert', 'Retired executive with 30+ years of experience. Now dedicated to helping the next generation of leaders succeed. Class of 1990.', 1990, true, '504-555-0301', 'linkedin.com/in/thomasanderson', NULL, true),

-- Demo Admin Profile
('admin-1-id', 'Admin', 'User', 'admin', 'Platform Administrator', 'System administrator for Purple Knights Network.', 2010, true, '504-555-0401', NULL, NULL, true);

-- Update employer profiles with company details
UPDATE profiles SET 
    company_name = 'Tech Innovations',
    industry = 'Technology',
    company_size = '50-100',
    website = 'https://techinnovations.com',
    logo_url = 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=TI'
WHERE id = 'employer-1-id';

UPDATE profiles SET 
    company_name = 'Gulf Marketing Group',
    industry = 'Marketing & Advertising',
    company_size = '25-50',
    website = 'https://gulfmarketing.com',
    logo_url = 'https://via.placeholder.com/150x150/F59E0B/FFFFFF?text=GM'
WHERE id = 'employer-2-id';

UPDATE profiles SET 
    company_name = 'Financial Services LLC',
    industry = 'Finance & Banking',
    company_size = '100-250',
    website = 'https://financialservicesllc.com',
    logo_url = 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=FS'
WHERE id = 'employer-3-id';

-- Alumni Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level) VALUES
-- Marcus Thompson (Software Developer)
('alumni-1-id', 'JavaScript', 'technical', 'advanced'),
('alumni-1-id', 'React', 'technical', 'advanced'),
('alumni-1-id', 'Node.js', 'technical', 'intermediate'),
('alumni-1-id', 'Python', 'technical', 'intermediate'),
('alumni-1-id', 'Problem Solving', 'soft_skills', 'advanced'),
('alumni-1-id', 'Team Collaboration', 'soft_skills', 'advanced'),

-- Jasmine Washington (Marketing Professional)
('alumni-2-id', 'Digital Marketing', 'industry', 'advanced'),
('alumni-2-id', 'Social Media Management', 'industry', 'advanced'),
('alumni-2-id', 'Content Strategy', 'industry', 'intermediate'),
('alumni-2-id', 'Analytics', 'technical', 'intermediate'),
('alumni-2-id', 'Communication', 'soft_skills', 'advanced'),
('alumni-2-id', 'Creativity', 'soft_skills', 'advanced'),

-- Andre Broussard (Business Analyst)
('alumni-3-id', 'Data Analysis', 'technical', 'advanced'),
('alumni-3-id', 'Excel', 'technical', 'advanced'),
('alumni-3-id', 'SQL', 'technical', 'intermediate'),
('alumni-3-id', 'Business Intelligence', 'industry', 'intermediate'),
('alumni-3-id', 'Critical Thinking', 'soft_skills', 'advanced'),
('alumni-3-id', 'Presentation Skills', 'soft_skills', 'intermediate'),

-- David Chen (Senior Software Engineer)
('alumni-4-id', 'Software Architecture', 'technical', 'expert'),
('alumni-4-id', 'Team Leadership', 'soft_skills', 'advanced'),
('alumni-4-id', 'Cloud Computing', 'technical', 'advanced'),
('alumni-4-id', 'DevOps', 'technical', 'advanced'),
('alumni-4-id', 'Mentoring', 'soft_skills', 'advanced'),
('alumni-4-id', 'Project Management', 'soft_skills', 'advanced'),

-- Robert Johnson (CEO/Mentor)
('alumni-7-id', 'Strategic Planning', 'soft_skills', 'expert'),
('alumni-7-id', 'Business Development', 'industry', 'expert'),
('alumni-7-id', 'Leadership', 'soft_skills', 'expert'),
('alumni-7-id', 'Fundraising', 'industry', 'advanced'),
('alumni-7-id', 'Public Speaking', 'soft_skills', 'advanced'),
('alumni-7-id', 'Mentorship', 'soft_skills', 'expert');

-- Alumni Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('alumni-1-id', 'Tech Startup', 'Junior Developer', '2022-06-01', '2023-08-15', false, 'Developed React applications and maintained backend services', 'New Orleans, LA', 'Technology'),
('alumni-1-id', 'University Computer Lab', 'Student Assistant', '2020-09-01', '2022-05-01', false, 'Provided technical support and assisted students with coding projects', 'New Orleans, LA', 'Education'),

('alumni-2-id', 'Marketing Agency', 'Digital Marketing Coordinator', '2021-06-01', '2023-12-01', true, 'Managed social media campaigns and developed content strategies', 'New Orleans, LA', 'Marketing'),
('alumni-2-id', 'Local Business', 'Marketing Intern', '2020-06-01', '2021-05-01', false, 'Assisted with social media management and event planning', 'New Orleans, LA', 'Retail'),

('alumni-4-id', 'Fortune 500 Tech Company', 'Senior Software Engineer', '2018-03-01', NULL, true, 'Lead development team for enterprise software solutions', 'Houston, TX', 'Technology'),
('alumni-4-id', 'Mid-size Tech Company', 'Software Engineer', '2014-07-01', '2018-02-28', false, 'Full-stack development for web applications', 'Dallas, TX', 'Technology'),

('alumni-7-id', 'Current SaaS Company', 'CEO', '2020-01-01', NULL, true, 'Leading company through growth phase and expansion', 'Austin, TX', 'Technology'),
('alumni-7-id', 'First Tech Startup', 'Founder & CEO', '2010-05-01', '2019-12-31', false, 'Founded and grew company to successful acquisition', 'San Francisco, CA', 'Technology');

-- Alumni Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('alumni-1-id', 'Louisiana State University', 'Bachelor of Science', 'Computer Science', '2018-08-01', '2022-05-01', false, 3.8, ARRAY['Computer Science Club', 'Hackathon Participant']),
('alumni-2-id', 'Tulane University', 'Bachelor of Arts', 'Marketing', '2017-08-01', '2021-05-01', false, 3.6, ARRAY['Marketing Club', 'Student Government']),
('alumni-3-id', 'Xavier University of Louisiana', 'Bachelor of Business Administration', 'Finance', '2019-08-01', '2023-05-01', false, 3.7, ARRAY['Finance Club', 'Investment Club']),
('alumni-4-id', 'Georgia Tech', 'Bachelor of Science', 'Computer Engineering', '2010-08-01', '2014-05-01', false, 3.9, ARRAY['Engineering Honor Society', 'Robotics Club']);

-- Alumni Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level) VALUES
('alumni-1-id', 55000, 75000, 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Austin, TX'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Software Development'], 'entry_level'),
('alumni-2-id', 45000, 65000, 'fully_remote', ARRAY['New Orleans, LA', 'Baton Rouge, LA'], false, ARRAY['full_time'], ARRAY['Marketing', 'Advertising', 'Digital Media'], 'entry_level'),
('alumni-3-id', 50000, 70000, 'on_site', ARRAY['New Orleans, LA', 'Baton Rouge, LA'], true, ARRAY['full_time'], ARRAY['Finance', 'Banking', 'Consulting'], 'entry_level'),
('alumni-4-id', 120000, 150000, 'hybrid', ARRAY['Houston, TX', 'Austin, TX', 'Dallas, TX'], false, ARRAY['full_time'], ARRAY['Technology', 'Software Development'], 'senior_level'),
('alumni-7-id', 200000, 300000, 'fully_remote', ARRAY[] , true, ARRAY['contract', 'freelance'], ARRAY['Technology', 'Consulting', 'Investment'], 'executive');

-- Job Postings
INSERT INTO job_postings (employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, required_skills, preferred_skills, experience_level, alumni_preferred, status) VALUES
-- Tech Innovations Jobs
('employer-1-id', 'Frontend Developer', 'We are looking for a talented Frontend Developer to join our growing team. You will be responsible for building user interfaces using React and modern web technologies.', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 60000, 80000, ARRAY['JavaScript', 'React', 'CSS', 'HTML'], ARRAY['TypeScript', 'Next.js', 'Node.js'], 'entry_level', true, 'open'),
('employer-1-id', 'Full Stack Developer', 'Seeking an experienced Full Stack Developer to work on our core platform. Experience with both frontend and backend technologies required.', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 75000, 95000, ARRAY['JavaScript', 'React', 'Node.js', 'SQL'], ARRAY['Python', 'AWS', 'Docker'], 'mid_level', true, 'open'),
('employer-1-id', 'Software Engineering Intern', 'Paid internship opportunity for current students or recent graduates to gain hands-on experience in software development.', 'internship', 'Technology', 'New Orleans, LA', 'on_site', 40000, 45000, ARRAY['JavaScript', 'HTML', 'CSS'], ARRAY['React', 'Git', 'Problem Solving'], 'entry_level', true, 'open'),

-- Gulf Marketing Group Jobs
('employer-2-id', 'Digital Marketing Specialist', 'Join our marketing team to create and execute digital campaigns across multiple platforms. Experience with social media and content creation required.', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'hybrid', 45000, 60000, ARRAY['Digital Marketing', 'Social Media', 'Content Creation'], ARRAY['SEO', 'Analytics', 'Graphic Design'], 'entry_level', true, 'open'),
('employer-2-id', 'Marketing Coordinator', 'Support our marketing team with campaign coordination, event planning, and client communication. Great opportunity for recent graduates.', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'on_site', 40000, 55000, ARRAY['Marketing', 'Communication', 'Organization'], ARRAY['Event Planning', 'Social Media', 'Microsoft Office'], 'entry_level', true, 'open'),

-- Financial Services LLC Jobs
('employer-3-id', 'Financial Analyst', 'We are seeking a detail-oriented Financial Analyst to join our team. You will be responsible for financial modeling, reporting, and analysis.', 'full_time', 'Finance & Banking', 'New Orleans, LA', 'on_site', 55000, 70000, ARRAY['Finance', 'Excel', 'Analytical Skills'], ARRAY['SQL', 'Financial Modeling', 'Power BI'], 'entry_level', true, 'open'),
('employer-3-id', 'Business Analyst Intern', 'Summer internship opportunity for students interested in finance and business analysis. Gain real-world experience in financial services.', 'internship', 'Finance & Banking', 'New Orleans, LA', 'on_site', 35000, 40000, ARRAY['Business Analysis', 'Excel', 'Communication'], ARRAY['Finance', 'Research', 'Presentation Skills'], 'entry_level', true, 'open');

-- Job Requirements
INSERT INTO job_requirements (job_id, skill_name, required, proficiency_level, years_experience) VALUES
-- Frontend Developer requirements
(1, 'JavaScript', true, 'intermediate', 1),
(1, 'React', true, 'intermediate', 1),
(1, 'CSS', true, 'intermediate', 1),
(1, 'HTML', true, 'intermediate', 1),
(1, 'TypeScript', false, 'beginner', 0),
(1, 'Next.js', false, 'beginner', 0),

-- Digital Marketing Specialist requirements
(4, 'Digital Marketing', true, 'intermediate', 1),
(4, 'Social Media', true, 'intermediate', 1),
(4, 'Content Creation', true, 'intermediate', 1),
(4, 'SEO', false, 'beginner', 0),
(4, 'Analytics', false, 'beginner', 0),

-- Financial Analyst requirements
(6, 'Finance', true, 'intermediate', 1),
(6, 'Excel', true, 'advanced', 2),
(6, 'Analytical Skills', true, 'intermediate', 1),
(6, 'SQL', false, 'beginner', 0),
(6, 'Financial Modeling', false, 'intermediate', 0);

-- Sample Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_type, status, cover_note) VALUES
(1, 'alumni-1-id', 'employer-1-id', 'direct_apply', 'applied', 'Excited about this opportunity! My experience with React and modern web technologies makes me a great fit for this role.'),
(4, 'alumni-2-id', 'employer-2-id', 'direct_apply', 'reviewing', 'As a recent graduate with a marketing degree and hands-on digital experience, I believe I can bring fresh perspectives to your team.'),
(6, 'alumni-3-id', 'employer-3-id', 'direct_apply', 'applied', 'My finance background and strong analytical skills align perfectly with this Financial Analyst position.');

-- Sample Mentorship Relationships
INSERT INTO mentorship_records (mentor_id, mentee_id, status, focus_areas, progress_rating) VALUES
('alumni-7-id', 'alumni-1-id', 'active', ARRAY['career_planning', 'skill_development', 'networking'], 4),
('alumni-8-id', 'alumni-2-id', 'active', ARRAY['leadership', 'industry_guidance', 'work_life_balance'], 5),
('alumni-9-id', 'alumni-3-id', 'active', ARRAY['career_planning', 'interview_prep', 'industry_guidance'], 3);

-- Sample Messages
INSERT INTO messages (from_user_id, to_user_id, context, context_id, subject, body) VALUES
('employer-1-id', 'alumni-1-id', 'job_application', '1', 'Regarding your Frontend Developer application', 'Hi Marcus, thank you for your interest in the Frontend Developer position. We would like to schedule an interview with you next week. Are you available?'),
('alumni-7-id', 'alumni-1-id', 'mentorship', '1', 'Career Development Check-in', 'Hi Marcus, how is your job search going? Let me know if you need help with interview preparation or networking strategies.'),
('alumni-1-id', 'alumni-7-id', 'mentorship', '1', 'Re: Career Development Check-in', 'Hi Robert, thanks for checking in! The job search is going well. I have an interview next week and would love some tips.');

-- Career Milestones
INSERT INTO career_milestones (profile_id, milestone_type, details) VALUES
('alumni-1-id', 'profile_completed', '{"completion_date": "2023-08-15"}'),
('alumni-1-id', 'first_application', '{"job_title": "Frontend Developer", "company": "Tech Innovations"}'),
('alumni-1-id', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2023-08-20"}'),
('alumni-2-id', 'profile_completed', '{"completion_date": "2023-08-16"}'),
('alumni-2-id', 'first_application', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group"}'),
('alumni-3-id', 'profile_completed', '{"completion_date": "2023-08-17"}'),
('alumni-3-id', 'first_application', '{"job_title": "Financial Analyst", "company": "Financial Services LLC"}');

-- Analytics Events (sample tracking)
INSERT INTO analytics_events (user_id, event_type, entity_type, entity_id, metadata) VALUES
('alumni-1-id', 'profile_view', 'profile', 'alumni-1-id', '{"viewed_by": "employer"}'),
('alumni-1-id', 'job_search', 'job', NULL, '{"search_query": "frontend developer", "filters": ["new orleans"]}'),
('alumni-2-id', 'application', 'job', '4', '{"application_type": "direct_apply"}'),
('alumni-3-id', 'login', 'user', 'alumni-3-id', '{"login_method": "email"}');

-- Notifications
INSERT INTO notifications (user_id, title, message, type, metadata) VALUES
('alumni-1-id', 'New Job Match', 'You have a new job match: Frontend Developer at Tech Innovations (85% match)', 'job_match', '{"job_id": 1, "match_score": 85}'),
('alumni-2-id', 'Application Update', 'Your application for Digital Marketing Specialist is being reviewed', 'application_update', '{"application_id": 2, "status": "reviewing"}'),
('alumni-3-id', 'New Message', 'You have a new message from Robert Johnson', 'message', '{"message_id": 3, "sender": "Robert Johnson"}');

-- Platform Metrics
INSERT INTO platform_metrics (metric_name, metric_value, metric_date, breakdown) VALUES
('total_alumni', 9, CURRENT_DATE, '{"verified": 9, "unverified": 0}'),
('total_employers', 3, CURRENT_DATE, '{"active": 3, "inactive": 0}'),
('total_jobs', 7, CURRENT_DATE, '{"open": 7, "filled": 0, "closed": 0}'),
('total_applications', 3, CURRENT_DATE, '{"applied": 3, "reviewing": 1, "interviewing": 0, "hired": 0}'),
('total_mentorships', 3, CURRENT_DATE, '{"active": 3, "completed": 0, "paused": 0}');
