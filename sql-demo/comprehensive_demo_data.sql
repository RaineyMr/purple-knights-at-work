-- Purple Knights at Work - Comprehensive Demo Scenarios
-- 5 Complete Demo Workflows Showing All Platform Features

-- DEMO SCENARIO 1: Recent Graduate Job Search Journey
-- Marcus Thompson (Class of 2022) - Software Developer seeking first job

-- Marcus Profile (Recent Graduate)
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, allow_employer_contact) VALUES
('marcus-id', 'Marcus', 'Thompson', 'alumni', 'Software Developer | React Enthusiast | Purple Knight', 'Recent computer science graduate passionate about web development and creating meaningful user experiences. Looking to kickstart my career in the New Orleans tech scene while staying connected to my St. Augustine roots.', 2022, true, '504-555-0101', 'linkedin.com/in/marcusthompson', 'marcusthompson.dev', true);

-- Marcus Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('marcus-id', 'JavaScript', 'technical', 'advanced', 3),
('marcus-id', 'React', 'technical', 'advanced', 2),
('marcus-id', 'Node.js', 'technical', 'intermediate', 1),
('marcus-id', 'Python', 'technical', 'intermediate', 1),
('marcus-id', 'Git', 'technical', 'intermediate', 2),
('marcus-id', 'Problem Solving', 'soft_skills', 'advanced', 4),
('marcus-id', 'Team Collaboration', 'soft_skills', 'advanced', 3),
('marcus-id', 'Communication', 'soft_skills', 'intermediate', 2);

-- Marcus Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('marcus-id', 'University Computer Lab', 'Teaching Assistant', '2021-09-01', '2022-05-01', false, 'Assisted students with programming assignments, conducted tutoring sessions, and maintained lab equipment.', 'New Orleans, LA', 'Education'),
('marcus-id', 'Tech Startup Internship', 'Frontend Developer Intern', '2021-06-01', '2021-08-31', false, 'Developed responsive web components using React, participated in code reviews, and collaborated with senior developers.', 'Remote', 'Technology');

-- Marcus Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('marcus-id', 'Louisiana State University', 'Bachelor of Science', 'Computer Science', '2018-08-01', '2022-05-01', false, 3.8, ARRAY['Computer Science Club President', 'Hackathon Winner 2021', 'Dean''s List']);

-- Marcus Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level) VALUES
('marcus-id', 55000, 75000, 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX'], true, ARRAY['full_time', 'internship'], ARRAY['Technology', 'Software Development', 'Web Development'], 'entry_level');

-- DEMO SCENARIO 2: Mid-Career Alumni Advancement
-- Samantha Rodriguez (Class of 2015) - Marketing Professional seeking leadership role

-- Samantha Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, allow_employer_contact) VALUES
('samantha-id', 'Samantha', 'Rodriguez', 'alumni', 'Marketing Manager | Brand Strategist | Digital Campaign Expert', 'Marketing professional with 8 years of experience building brands and driving growth through innovative digital strategies. Currently seeking a leadership role where I can mentor teams and shape marketing direction.', 2015, true, '504-555-0105', 'linkedin.com/in/samantharodriguez', true);

-- Samantha Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('samantha-id', 'Digital Marketing', 'industry', 'expert', 8),
('samantha-id', 'Brand Strategy', 'industry', 'advanced', 6),
('samantha-id', 'Team Leadership', 'soft_skills', 'advanced', 5),
('samantha-id', 'Campaign Management', 'industry', 'advanced', 7),
('samantha-id', 'Analytics', 'technical', 'advanced', 4),
('samantha-id', 'Content Strategy', 'industry', 'advanced', 5),
('samantha-id', 'Budget Management', 'soft_skills', 'intermediate', 3),
('samantha-id', 'Public Speaking', 'soft_skills', 'advanced', 4);

-- Samantha Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('samantha-id', 'Current Marketing Agency', 'Marketing Manager', '2020-03-01', NULL, true, 'Lead team of 5 marketing specialists, manage $2M annual budget, and develop integrated campaigns for Fortune 500 clients.', 'New Orleans, LA', 'Marketing'),
('samantha-id', 'Previous Agency', 'Digital Marketing Specialist', '2017-06-01', '2020-02-28', false, 'Managed social media campaigns for 15+ clients, increased engagement rates by 45%, and developed content calendars.', 'New Orleans, LA', 'Marketing'),
('samantha-id', 'First Job', 'Marketing Coordinator', '2015-07-01', '2017-05-31', false, 'Coordinated marketing events, created promotional materials, and assisted with campaign execution.', 'Baton Rouge, LA', 'Marketing');

-- DEMO SCENARIO 3: Senior Alumni Mentorship Program
-- Robert Johnson (Class of 2005) - CEO mentoring young entrepreneurs

-- Robert Profile
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, allow_employer_contact) VALUES
('robert-id', 'Robert', 'Johnson', 'alumni', 'CEO & Founder | Serial Entrepreneur | Angel Investor | Purple Knight Mentor', 'Founded and successfully exited two technology companies. Currently CEO of a growing SaaS platform serving 10,000+ customers. Passionate about mentoring the next generation of entrepreneurs and giving back to the St. Augustine community.', 2005, true, '504-555-0107', 'linkedin.com/in/robertjohnson', 'robertjohnson.com', true);

-- Robert Skills
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('robert-id', 'Strategic Planning', 'soft_skills', 'expert', 15),
('robert-id', 'Business Development', 'industry', 'expert', 12),
('robert-id', 'Leadership', 'soft_skills', 'expert', 18),
('robert-id', 'Fundraising', 'industry', 'expert', 10),
('robert-id', 'Public Speaking', 'soft_skills', 'expert', 8),
('robert-id', 'Mentorship', 'soft_skills', 'expert', 20),
('robert-id', 'Startup Strategy', 'industry', 'expert', 14),
('robert-id', 'Investment Analysis', 'technical', 'advanced', 6);

-- Robert Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('robert-id', 'Current SaaS Company', 'CEO & Founder', '2018-01-01', NULL, true, 'Built and scaled B2B SaaS platform to $50M ARR, raised $25M in Series B funding, and lead team of 150+ employees.', 'Austin, TX', 'Technology'),
('robert-id', 'First Startup', 'Founder & CEO', '2010-05-01', '2017-12-31', false, 'Founded mobile app company, grew to 500K users, successfully acquired by larger tech company for $15M.', 'San Francisco, CA', 'Technology'),
('robert-id', 'Investment Bank', 'Investment Analyst', '2009-07-01', '2010-04-30', false, 'Analyzed technology investments and supported due diligence for venture capital deals.', 'New York, NY', 'Finance');

-- DEMO SCENARIO 4: Employer Hiring Multiple Purple Knights
-- Tech Innovations - Company actively recruiting St. Augustine alumni

-- Tech Innovations Profile
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('techinnovations-id', 'Tech', 'Innovations', 'employer', 'Tech Innovations', 'Technology', '50-100', 'https://techinnovations.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=TI', 'New Orleans, LA', NULL);

-- Tech Innovations Job Postings
INSERT INTO job_postings (employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, required_skills, preferred_skills, experience_level, alumni_preferred, status) VALUES
('techinnovations-id', 'Frontend Developer', 'Join our growing development team to build cutting-edge web applications. You''ll work with React, TypeScript, and modern web technologies to create amazing user experiences. We especially value St. Augustine alumni and their strong work ethic!', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 65000, 85000, ARRAY['JavaScript', 'React', 'CSS', 'HTML'], ARRAY['TypeScript', 'Next.js', 'Node.js', 'Git'], 'entry_level', true, 'open'),
('techinnovations-id', 'Marketing Coordinator', 'We''re looking for a creative marketing coordinator to help us tell our story and reach more customers. You''ll manage social media, create content, and support our marketing campaigns. Purple Knights encouraged to apply!', 'full_time', 'Technology', 'New Orleans, LA', 'hybrid', 45000, 60000, ARRAY['Marketing', 'Social Media', 'Content Creation'], ARRAY['Analytics', 'SEO', 'Graphic Design'], 'entry_level', true, 'open'),
('techinnovations-id', 'Software Engineering Intern', 'Paid summer internship for students or recent graduates. Gain hands-on experience in software development while working on real projects. Perfect opportunity for Purple Knights to start their tech careers!', 'internship', 'Technology', 'New Orleans, LA', 'on_site', 40000, 45000, ARRAY['Programming', 'Problem Solving', 'Team Work'], ARRAY['JavaScript', 'React', 'Git'], 'entry_level', true, 'open');

-- DEMO SCENARIO 5: Multi-Company Recruitment Campaign
-- Gulf Marketing Group and Financial Services LLC actively hiring

-- Gulf Marketing Group Profile
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('gulfmarketing-id', 'Gulf', 'Marketing', 'employer', 'Gulf Marketing Group', 'Marketing & Advertising', '25-50', 'https://gulfmarketing.com', 'https://via.placeholder.com/150x150/F59E0B/FFFFFF?text=GM', 'New Orleans, LA', NULL);

-- Financial Services LLC Profile  
INSERT INTO profiles (id, first_name, last_name, role, company_name, industry, company_size, website, logo_url, location, allow_employer_contact) VALUES
('financialservices-id', 'Financial', 'Services', 'employer', 'Financial Services LLC', 'Finance & Banking', '100-250', 'https://financialservicesllc.com', 'https://via.placeholder.com/150x150/6B46C1/FFFFFF?text=FS', 'New Orleans, LA', NULL);

-- Gulf Marketing Jobs
INSERT INTO job_postings (employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, required_skills, preferred_skills, experience_level, alumni_preferred, status) VALUES
('gulfmarketing-id', 'Digital Marketing Specialist', 'Seeking a creative digital marketer to manage our online presence and develop engaging campaigns. Experience with social media, content creation, and analytics required. Purple Knights alumni strongly preferred!', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'hybrid', 50000, 70000, ARRAY['Digital Marketing', 'Social Media', 'Content Creation'], ARRAY['SEO', 'Analytics', 'Email Marketing'], 'mid_level', true, 'open'),
('gulfmarketing-id', 'Content Creator', 'Create compelling content for our clients across multiple platforms. Strong writing skills and creativity essential. Perfect role for recent Purple Knight graduates with marketing passion!', 'full_time', 'Marketing & Advertising', 'New Orleans, LA', 'hybrid', 40000, 55000, ARRAY['Content Creation', 'Writing', 'Social Media'], ARRAY['Video Production', 'Graphic Design', 'Photography'], 'entry_level', true, 'open');

-- Financial Services Jobs
INSERT INTO job_postings (employer_id, title, description, job_type, industry, location, remote_option, salary_min, salary_max, required_skills, preferred_skills, experience_level, alumni_preferred, status) VALUES
('financialservices-id', 'Financial Analyst', 'Join our finance team to analyze investment opportunities and support client portfolios. Strong analytical skills and attention to detail required. Purple Knights with finance background encouraged!', 'full_time', 'Finance & Banking', 'New Orleans, LA', 'on_site', 60000, 80000, ARRAY['Finance', 'Excel', 'Analytical Skills'], ARRAY['SQL', 'Financial Modeling', 'Power BI'], 'entry_level', true, 'open'),
('financialservices-id', 'Investment Banking Analyst', 'Fast-paced role supporting M&A transactions and capital raising. Excellent opportunity for ambitious Purple Knights to launch their finance careers.', 'full_time', 'Finance & Banking', 'New Orleans, LA', 'on_site', 80000, 120000, ARRAY['Finance', 'Accounting', 'Research'], ARRAY['Valuation', 'Due Diligence', 'Presentation Skills'], 'entry_level', true, 'open');

-- ===================================================================
-- INTERACTIONS AND WORKFLOWS
-- ===================================================================

-- Job Applications from Marcus (Scenario 1)
INSERT INTO applications (job_id, profile_id, employer_id, application_type, status, cover_note, resume_url) VALUES
(1, 'marcus-id', 'techinnovations-id', 'direct_apply', 'interviewing', 'As a recent computer science graduate from LSU and St. Augustine Class of 2022, I''m excited about this Frontend Developer opportunity. My experience with React and modern web technologies, combined with my passion for creating user-friendly applications, makes me a strong candidate. I''ve been following Tech Innovations'' work and would love to contribute to your team while representing the Purple Knights community!', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf'),
(6, 'marcus-id', 'financialservices-id', 'system_match', 'applied', 'While my primary focus is software development, I have strong analytical skills and experience with data analysis that would transfer well to financial analysis. I''m interested in exploring how my technical background could bring value to financial services, and I believe my problem-solving abilities would be an asset to your team.', 'https://resumes.purpleknights.work/marcus-thompson-resume.pdf');

-- Job Applications from Samantha (Scenario 2)
INSERT INTO applications (job_id, profile_id, employer_id, application_type, status, cover_note, resume_url) VALUES
(4, 'samantha-id', 'gulfmarketing-id', 'direct_apply', 'offer_extended', 'With 8 years of marketing experience and proven success in digital campaign management, I believe I''m the ideal candidate for this Digital Marketing Specialist role. I''ve grown engagement rates by 45% in my current position and managed budgets up to $2M. As a St. Augustine alumna, I understand the importance of community and would bring both expertise and Purple Knight pride to your team.', 'https://resumes.purpleknights.work/samantha-rodriguez-resume.pdf');

-- Interview Records
INSERT INTO interview_records (application_id, interview_date, interview_type, interviewer_name, notes, rating) VALUES
(1, '2024-01-15 14:00:00', 'video', 'Sarah Chen (Tech Lead)', 'Strong technical skills, good communication, showed enthusiasm for the company culture. React knowledge is solid.', 4),
(1, '2024-01-22 10:00:00', 'video', 'Mike Johnson (CTO)', 'Excellent problem-solving approach, asked thoughtful questions about our tech stack, would fit well with the team.', 5),
(4, '2024-01-18 15:30:00', 'in_person', 'Jennifer Davis (Marketing Director)', 'Impressive portfolio of campaigns, strong leadership experience, great cultural fit. Very interested in Purple Knights connection.', 5);

-- Offer Records
INSERT INTO offer_records (application_id, salary_offered, salary_currency, position_title, start_date, offer_date, status, notes) VALUES
(1, 70000, 'USD', 'Frontend Developer', '2024-02-01', '2024-01-25', 'accepted', 'Competitive salary with benefits package, includes professional development budget.'),
(4, 65000, 'USD', 'Digital Marketing Specialist', '2024-02-15', '2024-01-28', 'pending', 'Above market rate with performance bonuses and team leadership opportunities.');

-- Mentorship Relationships (Scenario 3)
INSERT INTO mentorship_records (mentor_id, mentee_id, status, focus_areas, meeting_notes, progress_rating) VALUES
('robert-id', 'marcus-id', 'active', ARRAY['career_planning', 'entrepreneurship', 'networking'], 
'[
  {"date": "2024-01-10", "notes": "Initial meeting - discussed Marcus''s career goals and startup interests"},
  {"date": "2024-01-24", "notes": "Reviewed Marcus''s resume and discussed interview preparation"},
  {"date": "2024-02-07", "notes": "Celebrated Marcus''s job offer, discussed negotiation strategies"}
]', 5),
('robert-id', 'samantha-id', 'active', ARRAY['leadership', 'career_advancement', 'work_life_balance'],
'[
  {"date": "2024-01-15", "notes": "Discussed Samantha''s leadership aspirations and current challenges"},
  {"date": "2024-01-29", "notes": "Reviewed her job offer and discussed career growth opportunities"}
]', 4);

-- Messages Between Users
INSERT INTO messages (from_user_id, to_user_id, context, context_id, subject, body, sent_at, read_at) VALUES
('techinnovations-id', 'marcus-id', 'job_application', '1', 'Interview Request - Frontend Developer Position', 'Hi Marcus, thank you for your application! We were impressed with your background and would like to schedule an interview. Are you available next week for a video call with our tech lead?', '2024-01-10 09:00:00', '2024-01-10 11:30:00'),
('marcus-id', 'techinnovations-id', 'job_application', '1', 'Re: Interview Request - Frontend Developer Position', 'Thank you for reaching out! I''m very excited about this opportunity. I''m available Tuesday afternoon or Wednesday morning next week. Looking forward to discussing how I can contribute to Tech Innovations!', '2024-01-10 11:45:00', '2024-01-10 14:00:00'),
('robert-id', 'marcus-id', 'mentorship', '1', 'Congratulations on the Job Offer!', 'Marcus, I heard you got an offer from Tech Innovations - that''s fantastic news! Let''s connect this week to discuss negotiation strategies and ensure you get the best possible package. Proud to see a Purple Knight succeeding in tech!', '2024-01-25 16:00:00', '2024-01-25 18:30:00'),
('marcus-id', 'robert-id', 'mentorship', '1', 'Re: Congratulations on the Job Offer!', 'Robert, thank you so much! Your guidance throughout this process has been invaluable. I''d love to get your advice on the offer details. I''m free Thursday afternoon if that works for you. Go Purple Knights!', '2024-01-25 19:00:00', '2024-01-26 09:00:00');

-- Career Milestones
INSERT INTO career_milestones (profile_id, milestone_type, details) VALUES
('marcus-id', 'profile_completed', '{"completion_date": "2023-12-01", "profile_strength": "strong"}'),
('marcus-id', 'first_match', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "match_score": 92}'),
('marcus-id', 'first_application', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-08"}'),
('marcus-id', 'first_interview', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-15"}'),
('marcus-id', 'first_offer', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "salary": 70000, "date": "2024-01-25"}'),
('marcus-id', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-05"}'),
('marcus-id', 'first_hire', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "start_date": "2024-02-01"}'),

('samantha-id', 'profile_completed', '{"completion_date": "2023-12-15", "profile_strength": "excellent"}'),
('samantha-id', 'first_application', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "date": "2024-01-12"}'),
('samantha-id', 'first_interview', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "date": "2024-01-18"}'),
('samantha-id', 'first_offer', '{"job_title": "Digital Marketing Specialist", "company": "Gulf Marketing Group", "salary": 65000, "date": "2024-01-28"}'),

('robert-id', 'mentor_matched', '{"mentee_name": "Marcus Thompson", "match_date": "2024-01-05"}'),
('robert-id', 'mentorship_completed', '{"mentee_name": "Marcus Thompson", "outcome": "successful_job_placement", "date": "2024-02-01"}');

-- Analytics Events
INSERT INTO analytics_events (user_id, event_type, entity_type, entity_id, metadata, timestamp) VALUES
('marcus-id', 'profile_view', 'profile', 'marcus-id', '{"viewed_by": "employer", "company": "Tech Innovations"}', '2024-01-08 10:00:00'),
('marcus-id', 'job_search', 'job', NULL, '{"search_query": "frontend developer", "filters": ["new orleans", "entry level"], "results_count": 3}', '2024-01-07 14:30:00'),
('marcus-id', 'job_view', 'job', '1', '{"view_duration": 180, "company": "Tech Innovations"}', '2024-01-08 11:00:00'),
('marcus-id', 'application', 'job', '1', '{"application_type": "direct_apply", "cover_letter_length": 245}', '2024-01-08 11:45:00'),
('marcus-id', 'message_received', 'message', '1', '{"sender": "Tech Innovations", "context": "interview_request"}', '2024-01-10 09:00:00'),
('marcus-id', 'message_sent', 'message', '2', '{"recipient": "Tech Innovations", "response_time": 165}', '2024-01-10 11:45:00'),
('marcus-id', 'interview_scheduled', 'application', '1', '{"interview_type": "video", "date": "2024-01-15"}', '2024-01-10 14:00:00'),
('marcus-id', 'interview_completed', 'application', '1', '{"interview_type": "video", "rating": 4}', '2024-01-15 15:00:00'),
('marcus-id', 'offer_received', 'application', '1', '{"salary": 70000, "position": "Frontend Developer"}', '2024-01-25 09:00:00'),
('marcus-id', 'offer_accepted', 'application', '1', '{"acceptance_date": "2024-01-26"}', '2024-01-26 16:00:00'),

('samantha-id', 'job_search', 'job', NULL, '{"search_query": "marketing manager", "filters": ["mid level", "new orleans"], "results_count": 5}', '2024-01-10 10:00:00'),
('samantha-id', 'application', 'job', '4', '{"application_type": "direct_apply", "cover_letter_length": 312}', '2024-01-12 14:30:00'),
('samantha-id', 'interview_completed', 'application', '4', '{"interview_type": "in_person", "rating": 5}', '2024-01-18 17:00:00'),
('samantha-id', 'offer_received', 'application', '4', '{"salary": 65000, "position": "Digital Marketing Specialist"}', '2024-01-28 10:00:00'),

('robert-id', 'mentorship_request', 'mentorship', '1', '{"mentee": "Marcus Thompson", "request_date": "2024-01-03"}', '2024-01-03 09:00:00'),
('robert-id', 'mentorship_accepted', 'mentorship', '1', '{"mentee": "Marcus Thompson", "acceptance_date": "2024-01-05"}', '2024-01-05 11:00:00'),
('robert-id', 'mentorship_meeting', 'mentorship', '1', '{"meeting_date": "2024-01-10", "duration": 45}', '2024-01-10 15:00:00'),

('techinnovations-id', 'job_posted', 'job', '1', '{"job_title": "Frontend Developer", "alumni_preferred": true}', '2024-01-01 09:00:00'),
('techinnovations-id', 'application_received', 'application', '1', '{"applicant": "Marcus Thompson", "alumni": true, "graduation_year": 2022}', '2024-01-08 11:45:00'),
('techinnovations-id', 'candidate_viewed', 'profile', 'marcus-id', '{"view_reason": "application_review", "alumni_status": "verified"}', '2024-01-08 13:00:00'),
('techinnovations-id', 'interview_scheduled', 'application', '1', '{"candidate": "Marcus Thompson", "interview_type": "video"}', '2024-01-10 14:00:00'),
('techinnovations-id', 'offer_extended', 'application', '1', '{"candidate": "Marcus Thompson", "salary": 70000}', '2024-01-25 09:00:00'),
('techinnovations-id', 'offer_accepted', 'application', '1', '{"candidate": "Marcus Thompson", "hire_date": "2024-02-01"}', '2024-01-26 16:00:00');

-- Notifications
INSERT INTO notifications (user_id, title, message, type, metadata, read) VALUES
('marcus-id', 'New Job Match', 'You have a 92% match for Frontend Developer at Tech Innovations! This company specifically seeks Purple Knights alumni.', 'job_match', '{"job_id": 1, "match_score": 92, "company": "Tech Innovations"}', false),
('marcus-id', 'Interview Request', 'Tech Innovations wants to schedule an interview for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "interview_scheduled"}', false),
('marcus-id', 'Job Offer Received', 'Congratulations! Tech Innovations has extended an offer for the Frontend Developer position with a salary of $70,000.', 'application_update', '{"application_id": 1, "status": "offer_extended", "salary": 70000}', false),
('marcus-id', 'New Message from Robert Johnson', 'Your mentor Robert Johnson has a message for you about your job offer!', 'message', '{"message_id": 3, "sender": "Robert Johnson"}', false),

('samantha-id', 'Application Update', 'Your application for Digital Marketing Specialist is being reviewed by Gulf Marketing Group.', 'application_update', '{"application_id": 4, "status": "reviewing"}', false),
('samantha-id', 'Interview Scheduled', 'Gulf Marketing Group has scheduled an interview for the Digital Marketing Specialist position.', 'application_update', '{"application_id": 4, "status": "interview_scheduled"}', false),
('samantha-id', 'Job Offer Received', 'Gulf Marketing Group has extended an offer for the Digital Marketing Specialist position!', 'application_update', '{"application_id": 4, "status": "offer_extended", "salary": 65000}', false),

('robert-id', 'Mentorship Request', 'Marcus Thompson (Class of 2022) has requested mentorship in career planning and entrepreneurship.', 'mentor_request', '{"mentee_id": "marcus-id", "focus_areas": ["career_planning", "entrepreneurship"]}', false),
('robert-id', 'Mentee Success', 'Congratulations! Your mentee Marcus Thompson has accepted a job offer from Tech Innovations!', 'mentorship_update', '{"mentee_id": "marcus-id", "outcome": "job_offer_accepted"}', false),

('techinnovations-id', 'New Application', 'Marcus Thompson (Purple Knight Class of 2022) has applied for the Frontend Developer position.', 'application_update', '{"application_id": 1, "applicant": "Marcus Thompson", "alumni": true}', false),
('techinnovations-id', 'Offer Accepted', 'Marcus Thompson has accepted your offer for the Frontend Developer position!', 'application_update', '{"application_id": 1, "status": "offer_accepted", "start_date": "2024-02-01"}', false);

-- Platform Metrics
INSERT INTO platform_metrics (metric_name, metric_value, metric_date, breakdown) VALUES
('total_alumni', 3, CURRENT_DATE, '{"verified": 3, "unverified": 0, "recent_graduates": 1, "mid_career": 1, "senior": 1}'),
('total_employers', 3, CURRENT_DATE, '{"active": 3, "alumni_friendly": 3, "hiring": 3}'),
('total_jobs', 7, CURRENT_DATE, '{"open": 7, "alumni_preferred": 7, "entry_level": 4, "mid_level": 2, "internship": 1}'),
('total_applications', 4, CURRENT_DATE, '{"applied": 4, "reviewing": 1, "interviewing": 1, "offer_extended": 2, "hired": 1}'),
('total_interviews', 3, CURRENT_DATE, '{"scheduled": 3, "completed": 3, "video": 2, "in_person": 1}'),
('total_offers', 2, CURRENT_DATE, '{"extended": 2, "accepted": 1, "pending": 1, "declined": 0}'),
('total_hires', 1, CURRENT_DATE, '{"purple_knights": 1, "recent_graduates": 1, "tech_industry": 1}'),
('total_mentorships', 2, CURRENT_DATE, '{"active": 2, "completed": 1, "successful_placements": 1}'),
('total_messages', 4, CURRENT_DATE, '{"sent": 4, "read": 3, "job_related": 3, "mentorship": 1}'),
('engagement_rate', 87.5, CURRENT_DATE, '{"profile_completion": 100, "application_rate": 75, "response_rate": 90}');
