-- Purple Knights at Work - Fake Users for Realistic Interactions
-- Additional users to demonstrate platform functionality

-- ===================================================================
-- FAKE USER PROFILES (No auth users needed - fake profiles only)
-- These users create realistic interactions and platform activity
-- ===================================================================

-- Fake User 1: David Brown - Recent Graduate
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-001', 'David', 'Brown', 'alumni', 'Software Engineer | Purple Knight Class of 2023', 'Recent computer science graduate from Xavier University with a passion for mobile app development. During my time at St. Augustine, I was active in the computer club and developed my first mobile app for the school''s basketball team. I''m eager to contribute to the New Orleans tech community while staying connected to my Purple Knight brothers.', 2023, true, '504-555-0201', 'https://linkedin.com/in/davidbrown', 'https://davidbrown.dev', 'https://resumes.purpleknights.work/david-brown-resume.pdf', true, ARRAY['Computer Club Member', 'Basketball Team Manager', 'Dean''s List', 'Hackathon Participant 2023']);

-- Fake User 2: Kevin Jackson - Mid-Career Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-002', 'Kevin', 'Jackson', 'alumni', 'Project Manager | Purple Knight Class of 2012', 'Project manager with 10+ years of experience leading cross-functional teams in the technology sector. At St. Augustine, I learned discipline and teamwork through the JROTC program and debate team. I''ve successfully managed projects ranging from $100K to $5M and am passionate about mentoring young professionals entering the field.', 2012, true, '504-555-0202', 'https://linkedin.com/in/kevinjackson', NULL, 'https://resumes.purpleknights.work/kevin-jackson-resume.pdf', true, ARRAY['JROTC Captain', 'Debate Team Member', 'Student Council', 'Honor Roll']);

-- Fake User 3: Christopher White - Senior Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-003', 'Christopher', 'White', 'alumni', 'Senior Software Architect | Purple Knight Class of 2005', 'Senior software architect with 15+ years of experience designing scalable systems for Fortune 500 companies. My journey at St. Augustine taught me the importance of perseverance and excellence - values that guide my professional career. I specialize in cloud architecture and microservices, and I''m committed to mentoring the next generation of Purple Knights in technology.', 2005, true, '504-555-0203', 'https://linkedin.com/in/christopherwhite', 'https://christopherwhite.tech', 'https://resumes.purpleknights.work/christopher-white-resume.pdf', true, ARRAY['Computer Club President', 'Science Fair Winner', 'National Honor Society', 'Valedictorian']);

-- Fake User 4: Anthony Moore - Recent Graduate
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-004', 'Anthony', 'Moore', 'alumni', 'Business Analyst | Purple Knight Class of 2021', 'Business analyst with a background in data analysis and process optimization. I graduated from Southern University with honors and completed internships at two major corporations. At St. Augustine, I was treasurer of the student council and developed strong analytical skills that I now apply to business challenges. I''m seeking opportunities to grow professionally while contributing to the Purple Knights community.', 2021, true, '504-555-0204', 'https://linkedin.com/in/anthonyrmoore', NULL, 'https://resumes.purpleknights.work/anthony-moore-resume.pdf', true, ARRAY['Student Council Treasurer', 'Math Club President', 'National Honor Society', 'Honor Roll']);

-- Fake User 5: Daniel Harris - Mid-Career Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-005', 'Daniel', 'Harris', 'alumni', 'Marketing Director | Purple Knight Class of 2010', 'Marketing director with 12+ years of experience in digital marketing and brand strategy. I started my career in advertising and have since worked with major brands in the Southeast. At St. Augustine, I was captain of the football team and learned leadership skills that I now apply to managing marketing teams. I''m passionate about helping Purple Knights succeed in the business world.', 2010, true, '504-555-0205', 'https://linkedin.com/in/danielharris', 'https://danielharris.marketing', 'https://resumes.purpleknights.work/daniel-harris-resume.pdf', true, ARRAY['Football Team Captain', 'Student Government', 'Athletic Honor Roll', 'Community Service Award']);

-- Fake User 6: Richard Clark - Senior Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-006', 'Richard', 'Clark', 'alumni', 'Financial Controller | Purple Knight Class of 2002', 'Financial controller with 20+ years of experience in financial management and accounting. I''ve worked with companies ranging from startups to multinational corporations, specializing in financial planning and analysis. My time at St. Augustine instilled in me the values of integrity and excellence that guide my professional conduct. I''m available for mentorship and consulting for Purple Knights pursuing careers in finance.', 2002, true, '504-555-0206', 'https://linkedin.com/in/richardclark', NULL, 'https://resumes.purpleknights.work/richard-clark-resume.pdf', true, ARRAY['Academic Decathlon Captain', 'Student Body Vice President', 'National Honor Society', 'Perfect Attendance']);

-- Fake User 7: Joseph Lewis - Recent Graduate
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-007', 'Joseph', 'Lewis', 'alumni', 'UX Designer | Purple Knight Class of 2024', 'Recent graduate from Dillard University with a degree in graphic design and a passion for user experience. I completed internships at two design agencies and developed a portfolio of mobile app designs. At St. Augustine, I was art editor for the yearbook and discovered my love for visual storytelling. I''m excited to bring my design skills to the New Orleans tech community.', 2024, true, '504-555-0207', 'https://linkedin.com/in/josephlewis', 'https://josephlewis.design', 'https://resumes.purpleknights.work/joseph-lewis-resume.pdf', true, ARRAY['Yearbook Art Editor', 'Art Club President', 'National Art Honor Society', 'Design Competition Winner']);

-- Fake User 8: Thomas Walker - Mid-Career Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-008', 'Thomas', 'Walker', 'alumni', 'Sales Manager | Purple Knight Class of 2008', 'Sales manager with 15+ years of experience in B2B sales and business development. I''ve built successful sales teams and consistently exceeded revenue targets. At St. Augustine, I learned the importance of building relationships and effective communication - skills that have been crucial in my sales career. I''m passionate about mentoring young professionals interested in sales and business development.', 2008, true, '504-555-0208', 'https://linkedin.com/in/thomaswalker', NULL, 'https://resumes.purpleknights.work/thomas-walker-resume.pdf', true, ARRAY['Basketball Team Member', 'Student Government', 'Sales Club Founder', 'Community Service Leader']);

-- Fake User 9: Charles Allen - Senior Professional
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-009', 'Charles', 'Allen', 'alumni', 'Healthcare Administrator | Purple Knight Class of 1999', 'Healthcare administrator with 25+ years of experience in hospital management and healthcare operations. I''ve led major healthcare initiatives and improved patient outcomes through innovative programs. My St. Augustine education taught me the importance of service to others - a value that drives my work in healthcare. I''m committed to mentoring Purple Knights interested in healthcare careers.', 1999, true, '504-555-0209', 'https://linkedin.com/in/charlesallen', NULL, 'https://resumes.purpleknights.work/charles-allen-resume.pdf', true, ARRAY('Student Body President', 'Science Club Member', 'Community Service Award', 'Honor Roll']);

-- Fake User 10: Steven Young - Recent Graduate
INSERT INTO profiles (id, first_name, last_name, role, headline, bio, graduation_year, verified_alumni, phone, linkedin_url, portfolio_url, resume_url, allow_employer_contact, academic_achievements) VALUES
('fake-user-010', 'Steven', 'Young', 'alumni', 'Data Analyst | Purple Knight Class of 2023', 'Recent graduate from LSU with a degree in data science and statistics. I completed internships in data analysis and developed skills in Python, SQL, and data visualization. At St. Augustine, I was captain of the chess team and developed strong analytical thinking skills. I''m excited to apply my data analysis skills to help businesses make data-driven decisions.', 2023, true, '504-555-0210', 'https://linkedin.com/in/stevenyoung', 'https://stevenyoung.data', 'https://resumes.purpleknights.work/steven-young-resume.pdf', true, ARRAY['Chess Team Captain', 'Math Club Member', 'National Honor Society', 'Statistics Competition Winner']);

-- ===================================================================
-- FAKE USER SKILLS (Complete profiles with diverse skills)
-- ===================================================================

-- David Brown Skills (Mobile Developer)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-001', 'JavaScript', 'technical', 'advanced', 4),
('fake-user-001', 'React Native', 'technical', 'advanced', 3),
('fake-user-001', 'Mobile Development', 'industry', 'advanced', 4),
('fake-user-001', 'Swift', 'technical', 'intermediate', 2),
('fake-user-001', 'UI/UX Design', 'technical', 'intermediate', 3),
('fake-user-001', 'Problem Solving', 'soft_skills', 'advanced', 5),
('fake-user-001', 'Team Collaboration', 'soft_skills', 'intermediate', 3),
('fake-user-001', 'Communication', 'soft_skills', 'intermediate', 2),
('fake-user-001', 'Agile Methodology', 'industry', 'intermediate', 3),
('fake-user-001', 'Git', 'technical', 'intermediate', 2);

-- Kevin Jackson Skills (Project Manager)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-002', 'Project Management', 'industry', 'expert', 15),
('fake-user-002', 'Agile Methodology', 'industry', 'expert', 12),
('fake-user-002', 'Team Leadership', 'soft_skills', 'expert', 18),
('fake-user-002', 'Risk Management', 'industry', 'advanced', 8),
('fake-user-002', 'Budget Management', 'soft_skills', 'advanced', 10),
('fake-user-002', 'Stakeholder Management', 'soft_skills', 'expert', 14),
('fake-user-002', 'Communication', 'soft_skills', 'expert', 16),
('fake-user-002', 'Microsoft Project', 'technical', 'advanced', 7),
('fake-user-002', 'JIRA', 'technical', 'advanced', 9),
('fake-user-002', 'Scrum', 'industry', 'expert', 11),
('fake-user-002', 'Change Management', 'soft_skills', 'advanced', 6),
('fake-user-002', 'Process Improvement', 'industry', 'advanced', 8);

-- Christopher White Skills (Software Architect)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-003', 'Cloud Architecture', 'technical', 'expert', 22),
('fake-user-003', 'Microservices', 'technical', 'expert', 20),
('fake-user-003', 'System Design', 'technical', 'expert', 25),
('fake-user-003', 'AWS', 'technical', 'expert', 18),
('fake-user-003', 'Azure', 'technical', 'advanced', 12),
('fake-user-003', 'DevOps', 'industry', 'expert', 16),
('fake-user-003', 'Technical Leadership', 'soft_skills', 'expert', 20),
('fake-user-003', 'Strategic Planning', 'soft_skills', 'expert', 18),
('fake-user-003', 'API Design', 'technical', 'expert', 15),
('fake-user-003', 'Security Architecture', 'technical', 'advanced', 10),
('fake-user-003', 'Performance Optimization', 'technical', 'expert', 14),
('fake-user-003', 'Enterprise Architecture', 'industry', 'expert', 17);

-- Anthony Moore Skills (Business Analyst)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-004', 'Business Analysis', 'industry', 'expert', 12),
('fake-user-004', 'Data Analysis', 'technical', 'advanced', 8),
('fake-user-004', 'SQL', 'technical', 'advanced', 7),
('fake-user-004', 'Excel', 'technical', 'expert', 15),
('fake-user-004', 'Process Improvement', 'industry', 'advanced', 9),
('fake-user-004', 'Requirements Gathering', 'soft_skills', 'expert', 11),
('fake-user-004', 'Stakeholder Communication', 'soft_skills', 'advanced', 8),
('fake-user-004', 'Power BI', 'technical', 'intermediate', 4),
('fake-user-004', 'Tableau', 'technical', 'intermediate', 3),
('fake-user-004', 'Business Intelligence', 'industry', 'advanced', 6),
('fake-user-004', 'Project Management', 'industry', 'intermediate', 5),
('fake-user-004', 'Data Visualization', 'technical', 'advanced', 7);

-- Daniel Harris Skills (Marketing Director)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-005', 'Digital Marketing', 'industry', 'expert', 18),
('fake-user-005', 'Brand Strategy', 'industry', 'expert', 16),
('fake-user-005', 'Marketing Analytics', 'technical', 'advanced', 10),
('fake-user-005', 'Team Leadership', 'soft_skills', 'expert', 20),
('fake-user-005', 'Campaign Management', 'industry', 'expert', 15),
('fake-user-005', 'Content Strategy', 'industry', 'advanced', 12),
('fake-user-005', 'SEO', 'technical', 'advanced', 8),
('fake-user-005', 'Social Media Marketing', 'industry', 'expert', 14),
('fake-user-005', 'Budget Management', 'soft_skills', 'advanced', 11),
('fake-user-005', 'Google Analytics', 'technical', 'advanced', 9),
('fake-user-005', 'Copywriting', 'industry', 'advanced', 7),
('fake-user-005', 'Market Research', 'industry', 'advanced', 10);

-- Richard Clark Skills (Financial Controller)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-006', 'Financial Planning', 'industry', 'expert', 25),
('fake-user-006', 'Financial Analysis', 'technical', 'expert', 20),
('fake-user-006', 'Accounting', 'industry', 'expert', 22),
('fake-user-006', 'Budget Management', 'soft_skills', 'expert', 18),
('fake-user-006', 'Risk Management', 'industry', 'advanced', 12),
('fake-user-006', 'Financial Reporting', 'technical', 'expert', 16),
('fake-user-006', 'Excel', 'technical', 'expert', 20),
('fake-user-006', 'SAP', 'technical', 'advanced', 8),
('fake-user-006', 'ERP Systems', 'technical', 'advanced', 7),
('fake-user-006', 'Compliance', 'industry', 'advanced', 10),
('fake-user-006', 'Strategic Planning', 'soft_skills', 'advanced', 14),
('fake-user-006', 'Team Leadership', 'soft_skills', 'advanced', 15);

-- Joseph Lewis Skills (UX Designer)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-007', 'UX Design', 'industry', 'expert', 12),
('fake-user-007', 'UI Design', 'technical', 'advanced', 10),
('fake-user-007', 'Figma', 'technical', 'expert', 15),
('fake-user-007', 'Adobe Creative Suite', 'technical', 'advanced', 8),
('fake-user-007', 'User Research', 'industry', 'advanced', 7),
('fake-user-007', 'Prototyping', 'technical', 'advanced', 9),
('fake-user-008', 'Wireframing', 'technical', 'expert', 11),
('fake-user-007', 'Design Systems', 'industry', 'intermediate', 4),
('fake-user-007', 'Mobile Design', 'industry', 'advanced', 8),
('fake-user-007', 'Web Design', 'technical', 'advanced', 7),
('fake-user-007', 'Creative Thinking', 'soft_skills', 'expert', 13),
('fake-user-007', 'Collaboration', 'soft_skills', 'advanced', 9);

-- Thomas Walker Skills (Sales Manager)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-008', 'B2B Sales', 'industry', 'expert', 20),
('fake-user-008', 'Sales Management', 'industry', 'expert', 18),
('fake-user-008', 'Business Development', 'industry', 'expert', 16),
('fake-user-008', 'Negotiation', 'soft_skills', 'expert', 22),
('fake-user-008', 'Relationship Building', 'soft_skills', 'expert', 19),
('fake-user-008', 'CRM Software', 'technical', 'advanced', 12),
('fake-user-008', 'Salesforce', 'technical', 'advanced', 10),
('fake-user-008', 'Lead Generation', 'industry', 'expert', 15),
('fake-user-008', 'Account Management', 'industry', 'expert', 14),
('fake-user-008', 'Presentation Skills', 'soft_skills', 'expert', 17),
('fake-user-008', 'Team Leadership', 'soft_skills', 'advanced', 11),
('fake-user-008', 'Sales Strategy', 'industry', 'advanced', 13);

-- Charles Allen Skills (Healthcare Administrator)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-009', 'Healthcare Management', 'industry', 'expert', 25),
('fake-user-009', 'Hospital Administration', 'industry', 'expert', 22),
('fake-user-009', 'Healthcare Operations', 'industry', 'expert', 20),
('fake-user-009', 'Regulatory Compliance', 'industry', 'expert', 18),
('fake-user-009', 'Budget Management', 'soft_skills', 'expert', 16),
('fake-user-009', 'Quality Improvement', 'industry', 'advanced', 12),
('fake-user-009', 'EHR Systems', 'technical', 'advanced', 8),
('fake-user-009', 'Strategic Planning', 'soft_skills', 'expert', 15),
('fake-user-009', 'Team Leadership', 'soft_skills', 'expert', 20),
('fake-user-009', 'Patient Care', 'industry', 'advanced', 10),
('fake-user-009', 'Healthcare Policy', 'industry', 'intermediate', 6),
('fake-user-009', 'Operations Management', 'industry', 'advanced', 14);

-- Steven Young Skills (Data Analyst)
INSERT INTO alumni_skills (profile_id, skill_name, category, proficiency_level, endorsement_count) VALUES
('fake-user-010', 'Data Analysis', 'technical', 'expert', 12),
('fake-user-010', 'Python', 'technical', 'advanced', 8),
('fake-user-010', 'SQL', 'technical', 'expert', 10),
('fake-user-010', 'Statistics', 'technical', 'advanced', 9),
('fake-user-010', 'Data Visualization', 'technical', 'advanced', 7),
('fake-user-010', 'Machine Learning', 'technical', 'intermediate', 3),
('fake-user-010', 'Excel', 'technical', 'expert', 14),
('fake-user-010', 'Tableau', 'technical', 'advanced', 6),
('fake-user-010', 'Power BI', 'technical', 'intermediate', 4),
('fake-user-010', 'Business Intelligence', 'industry', 'advanced', 8),
('fake-user-010', 'Problem Solving', 'soft_skills', 'expert', 11),
('fake-user-010', 'Communication', 'soft_skills', 'intermediate', 5);

-- ===================================================================
-- FAKE USER EXPERIENCE (Complete work histories)
-- ===================================================================

-- David Brown Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('fake-user-001', 'Tech Startup', 'Mobile Developer Intern', '2023-06-01', '2023-08-31', false, 'Developed mobile applications using React Native, participated in code reviews, collaborated with design team, and contributed to app store releases.', 'New Orleans, LA', 'Technology'),
('fake-user-001', 'Xavier University', 'Teaching Assistant', '2022-08-01', '2023-05-01', false, 'Assisted 30+ students per semester with programming assignments, conducted tutoring sessions for mobile development, and helped organize coding workshops.', 'New Orleans, LA', 'Education'),
('fake-user-001', 'St. Augustine', 'Yearbook Developer', '2022-06-01', '2022-08-31', false, 'Developed mobile app for basketball team stats tracking, designed user interfaces, and presented final project to school administration.', 'New Orleans, LA', 'Education');

-- Kevin Jackson Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('fake-user-002', 'Current Tech Company', 'Senior Project Manager', '2018-01-01', NULL, true, 'Lead team of 8 project managers, oversee portfolio of projects worth $10M+, implement agile methodologies, and improve project delivery efficiency by 25%.', 'New Orleans, LA', 'Technology'),
('fake-user-002', 'Previous Tech Company', 'Project Manager', '2014-06-01', '2017-12-31', false, 'Managed software development projects, coordinated with stakeholders, implemented project management tools, and delivered 15+ projects on time and budget.', 'Baton Rouge, LA', 'Technology'),
('fake-user-002', 'Consulting Firm', 'Junior Project Manager', '2012-07-01', '2014-05-31', false, 'Assisted senior project managers, managed small-scale projects, developed project documentation, and participated in client presentations.', 'New Orleans, LA', 'Consulting'),
('fake-user-002', 'University Project', 'Project Coordinator', '2010-09-01', '2012-05-01', false, 'Coordinated university research projects, managed timelines and resources, collaborated with faculty and students, and ensured project deliverables.', 'Baton Rouge, LA', 'Education');

-- Christopher White Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('fake-user-003', 'Current Fortune 500', 'Senior Software Architect', '2015-01-01', NULL, true, 'Lead architecture team for enterprise applications, design scalable cloud solutions, mentor junior architects, and drive technical innovation across the organization.', 'Houston, TX', 'Technology'),
('fake-user-003', 'Previous Tech Company', 'Software Architect', '2010-08-01', '2014-12-31', false, 'Designed microservices architecture, led cloud migration projects, established development standards, and improved system scalability.', 'Austin, TX', 'Technology'),
('fake-user-003', 'Mid-size Tech Company', 'Senior Software Engineer', '2007-06-01', '2010-07-31', false, 'Developed enterprise software applications, led technical design reviews, mentored development team, and implemented best practices.', 'Dallas, TX', 'Technology'),
('fake-user-003', 'First Tech Job', 'Software Engineer', '2005-07-01', '2007-05-31', false, 'Developed web applications, participated in full development lifecycle, collaborated with cross-functional teams, and contributed to product launches.', 'Atlanta, GA', 'Technology');

-- Anthony Moore Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('fake-user-004', 'Current Consulting Firm', 'Business Analyst', '2021-08-01', NULL, true, 'Analyze business processes, identify improvement opportunities, develop data-driven recommendations, and present findings to executive leadership.', 'New Orleans, LA', 'Consulting'),
('fake-user-004', 'Major Corporation', 'Business Analyst Intern', '2020-06-01', '2021-05-31', false, 'Assisted senior analysts with data collection and analysis, created business requirement documents, participated in stakeholder interviews, and supported project implementation.', 'Baton Rouge, LA', 'Corporate'),
('fake-user-004', 'University Research', 'Research Assistant', '2019-09-01', '2020-05-01', false, 'Conducted market research projects, analyzed survey data, prepared research reports, and assisted professors with academic publications.', 'New Orleans, LA', 'Education');

-- Daniel Harris Experience
INSERT INTO alumni_experience (profile_id, company_name, position, start_date, end_date, current_position, description, location, industry) VALUES
('fake-user-005', 'Current Marketing Agency', 'Marketing Director', '2018-03-01', NULL, true, 'Lead marketing team of 15 professionals, manage $5M annual budget, develop integrated marketing campaigns, and drive brand growth across multiple markets.', 'New Orleans, LA', 'Marketing'),
('fake-user-005', 'Previous Agency', 'Senior Marketing Manager', '2014-06-01', '2018-02-28', false, 'Managed team of 8 marketing specialists, oversaw digital marketing campaigns, developed brand strategies, and improved marketing ROI by 30%.', 'Houston, TX', 'Marketing'),
('fake-user-005', 'Retail Company', 'Marketing Manager', '2010-07-01', '2014-05-31', false, 'Developed and executed marketing campaigns, managed marketing budget, coordinated with sales team, and analyzed campaign performance.', 'Dallas, TX', 'Retail'),
('fake-user-005', 'Advertising Agency', 'Marketing Coordinator', '2008-06-01', '2010-06-30', false, 'Coordinated advertising campaigns, managed client relationships, prepared campaign reports, and supported creative team.', 'New Orleans, LA', 'Advertising');

-- ===================================================================
-- FAKE USER EDUCATION
-- ===================================================================

-- David Brown Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-001', 'Xavier University', 'Bachelor of Science', 'Computer Science', '2019-08-01', '2023-05-01', false, 3.8, ARRAY['Computer Club Member', 'Hackathon Participant', 'Dean''s List', 'Tutor for Programming Courses']);

-- Kevin Jackson Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-002', 'University of New Orleans', 'Master of Business Administration', 'Project Management', '2010-08-01', '2012-05-01', false, 3.9, ARRAY['Project Management Association', 'Case Competition Winner', 'Graduate Assistant', 'Business Journal Club']),
('fake-user-002', 'University of New Orleans', 'Bachelor of Science', 'Business Administration', '2006-08-01', '2010-05-01', false, 3.7, ARRAY['Student Government', 'Business Club', 'Dean''s List', 'Community Service']);

-- Christopher White Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-003', 'Georgia Tech', 'Master of Science', 'Computer Science', '2005-09-01', '2007-05-01', false, 3.9, ARRAY['Research Assistant', 'Teaching Assistant', 'Engineering Honor Society', 'Published Papers']),
('fake-user-003', 'Georgia Tech', 'Bachelor of Science', 'Computer Engineering', '2001-08-01', '2005-05-01', false, 3.8, ARRAY['Dean''s List', 'Engineering Club', 'Hackathon Organizer', 'Tutor']);

-- Anthony Moore Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-004', 'Southern University', 'Bachelor of Business Administration', 'Business Analytics', '2017-08-01', '2021-05-01', false, 3.9, ARRAY['Math Club President', 'Statistics Competition Winner', 'Dean''s List', 'Honor Thesis']);

-- Daniel Harris Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-005', 'LSU', 'Master of Business Administration', 'Marketing', '2008-08-01', '2010-05-01', false, 3.8, ARRAY['Marketing Association', 'Case Competition Winner', 'Graduate Assistant', 'Research Assistant']),
('fake-user-005', 'LSU', 'Bachelor of Science', 'Marketing', '2004-08-01', '2008-05-01', false, 3.7, ARRAY['Marketing Club', 'Student Government', 'Athletic Honor Roll', 'Community Service']);

-- Richard Clark Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-006', 'Tulane University', 'Master of Business Administration', 'Finance', '2002-08-01', '2004-05-01', false, 3.9, ARRAY['Finance Association', 'Case Competition Winner', 'Graduate Assistant', 'Research Assistant']),
('fake-user-006', 'Tulane University', 'Bachelor of Science', 'Accounting', '1998-08-01', '2002-05-01', false, 3.8, ARRAY['Accounting Club', 'Student Body Vice President', 'Dean''s List', 'Honor Roll']);

-- Joseph Lewis Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-007', 'Dillard University', 'Bachelor of Fine Arts', 'Graphic Design', '2020-08-01', '2024-05-01', false, 3.8, ARRAY['Art Club President', 'Design Competition Winner', 'National Art Honor Society', 'Yearbook Art Editor']);

-- Thomas Walker Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-008', 'University of Southern Mississippi', 'Bachelor of Business Administration', 'Marketing', '2004-08-01', '2008-05-01', false, 3.6, ARRAY['Sales Club Founder', 'Marketing Association', 'Basketball Team Member', 'Student Government']);

-- Charles Allen Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-009', 'Tulane University', 'Master of Public Health', 'Healthcare Administration', '1999-08-01', '2001-05-01', false, 3.8, ARRAY['Public Health Association', 'Research Assistant', 'Community Service Award', 'Dean''s List']),
('fake-user-009', 'Tulane University', 'Bachelor of Science', 'Healthcare Management', '1995-08-01', '1999-05-01', false, 3.7, ARRAY['Student Body President', 'Science Club Member', 'Community Service Award', 'Honor Roll']);

-- Steven Young Education
INSERT INTO alumni_education (profile_id, institution_name, degree, field_of_study, start_date, end_date, current_student, gpa, activities) VALUES
('fake-user-010', 'LSU', 'Bachelor of Science', 'Data Science', '2019-08-01', '2023-05-01', false, 3.9, ARRAY['Chess Team Captain', 'Math Club Member', 'National Honor Society', 'Statistics Competition Winner']);

-- ===================================================================
-- FAKE USER PREFERENCES
-- ===================================================================

-- David Brown Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-001', 55000, 75000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Mobile Development', 'Web Development', 'FinTech'], 'entry_level', ARRAY['Tech Companies', 'Startups', 'Mobile App Companies']);

-- Kevin Jackson Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-002', 90000, 130000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Atlanta, GA'], false, ARRAY['full_time'], ARRAY['Technology', 'Consulting', 'Finance', 'Healthcare'], 'senior_level', ARRAY['Fortune 500', 'Tech Companies', 'Consulting Firms']);

-- Christopher White Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-003', 150000, 250000, 'USD', 'fully_remote', ARRAY[] , false, ARRAY['full_time', 'contract', 'advisory'], ARRAY['Technology', 'Cloud Computing', 'Enterprise Software', 'Consulting'], 'senior_level', ARRAY['Big Tech', 'Enterprise Companies', 'Consulting Firms']);

-- Anthony Moore Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-004', 60000, 85000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX'], true, ARRAY['full_time'], ARRAY['Consulting', 'Technology', 'Finance', 'Healthcare'], 'entry_level', ARRAY['Consulting Firms', 'Tech Companies', 'Large Corporations']);

-- Daniel Harris Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-005', 100000, 150000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Dallas, TX'], false, ARRAY['full_time'], ARRAY['Marketing', 'Advertising', 'Technology', 'Retail'], 'senior_level', ARRAY['Marketing Agencies', 'Tech Companies', 'Large Corporations']);

-- Richard Clark Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-006', 120000, 180000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Atlanta, GA'], false, ARRAY['full_time'], ARRAY['Finance', 'Healthcare', 'Technology', 'Consulting'], 'senior_level', ARRAY['Financial Institutions', 'Healthcare Organizations', 'Tech Companies']);

-- Joseph Lewis Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-007', 50000, 70000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Austin, TX', 'San Francisco, CA'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Design', 'Marketing', 'Education'], 'entry_level', ARRAY['Design Agencies', 'Tech Companies', 'Startups']);

-- Thomas Walker Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-008', 80000, 120000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Houston, TX', 'Dallas, TX'], false, ARRAY['full_time'], ARRAY['Sales', 'Marketing', 'Technology', 'Consulting'], 'mid_level', ARRAY['Sales Organizations', 'Tech Companies', 'Consulting Firms']);

-- Charles Allen Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-009', 100000, 150000, 'USD', 'on_site', ARRAY['New Orleans, LA', 'Houston, TX', 'Baton Rouge, LA'], false, ARRAY['full_time'], ARRAY['Healthcare', 'Education', 'Nonprofit', 'Government'], 'senior_level', ARRAY['Hospitals', 'Healthcare Organizations', 'Educational Institutions']);

-- Steven Young Preferences
INSERT INTO alumni_preferences (profile_id, salary_min, salary_max, salary_currency, remote_preference, preferred_locations, willing_to_relocate, job_types_interested, industries_interested, career_level, company_preferences) VALUES
('fake-user-010', 55000, 75000, 'USD', 'hybrid', ARRAY['New Orleans, LA', 'Baton Rouge, LA', 'Houston, TX'], true, ARRAY['full_time', 'contract'], ARRAY['Technology', 'Finance', 'Healthcare', 'Consulting'], 'entry_level', ARRAY['Tech Companies', 'Financial Institutions', 'Consulting Firms']);

-- ===================================================================
-- FAKE USER APPLICATIONS (Applications to existing jobs)
-- ===================================================================

-- David Brown Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'fake-user-001', 'UUID_HERE', '2024-01-09', 'direct_apply', 'applied', 'As a recent computer science graduate with strong mobile development skills, I am excited about the Frontend Developer position at Tech Innovations. My experience with React Native and mobile app development, combined with my passion for creating user-friendly applications, makes me a strong candidate. During my internship, I developed a mobile app for the St. Augustine basketball team that improved team communication and performance tracking. I am particularly drawn to your company''s commitment to the Purple Knights community and would be proud to represent St. Augustine alumni.', 'https://resumes.purpleknights.work/david-brown-resume.pdf'),
(4, 'fake-user-001', 'UUID_HERE', '2024-01-11', 'system_match', 'reviewing', 'While my primary focus is mobile development, I have experience with healthcare technology projects and understand the importance of user-centered design in healthcare applications. My background in creating intuitive mobile interfaces and my passion for technology that helps people would be valuable for healthcare administration. I am particularly interested in Healthcare Plus''s mission of improving patient care through technology.', 'https://resumes.purpleknights.work/david-brown-resume.pdf');

-- Kevin Jackson Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(2, 'fake-user-002', 'UUID_HERE', '2024-01-10', 'direct_apply', 'interviewing', 'With 10+ years of project management experience in the technology sector, I am the ideal candidate for the Marketing Manager position. I have managed teams of 8+ project managers and overseen projects worth $10M+. While my background is primarily in technology project management, I have extensive experience managing cross-functional teams and developing marketing strategies for technology products. I am excited about the opportunity to bring my project management expertise to Gulf Marketing Group.', 'https://resumes.purpleknights.work/kevin-jackson-resume.pdf'),
(5, 'fake-user-002', 'UUID_HERE', '2024-01-12', 'system_match', 'applied', 'My project management experience includes developing educational programs and managing stakeholder relationships. I believe my skills in program coordination and team management would be valuable for education program management. As a Purple Knight alumnus, I have a strong understanding of the local education landscape and am passionate about supporting educational initiatives.', 'https://resumes.purpleknights.work/kevin-jackson-resume.pdf');

-- Christopher White Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'fake-user-003', 'UUID_HERE', '2024-01-08', 'employer_request', 'hired', 'As a senior software architect with 15+ years of experience, I am interested in exploring advisory opportunities with Tech Innovations. My expertise in cloud architecture, microservices, and scalable systems could provide valuable strategic insights for your growth. I am particularly interested in supporting fellow Purple Knights in the technology sector through mentorship and technical guidance.', 'https://resumes.purpleknights.work/christopher-white-resume.pdf'),
(3, 'fake-user-003', 'UUID_HERE', '2024-01-15', 'direct_apply', 'reviewing', 'My background in technology architecture includes extensive experience with data systems and financial technology applications that could be valuable for financial services companies. I am interested in exploring how my technical leadership experience could support innovation in financial services. As a Purple Knight, I would be proud to contribute to the local business community.', 'https://resumes.purpleknights.work/christopher-white-resume.pdf');

-- Anthony Moore Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'fake-user-004', 'UUID_HERE', '2024-01-11', 'direct_apply', 'reviewing', 'As a business analyst with strong data analysis skills and experience in process optimization, I am interested in exploring opportunities in technology companies. My background includes analyzing business processes, identifying improvement opportunities, and developing data-driven recommendations. I believe my analytical skills and business acumen would be valuable for frontend development roles that require understanding user needs and business objectives.', 'https://resumes.purpleknights.work/anthony-moore-resume.pdf'),
(3, 'fake-user-004', 'UUID_HERE', '2024-01-16', 'direct_apply', 'applied', 'With a background in business analysis and financial modeling, I am interested in exploring opportunities in financial services. My experience with data analysis, SQL, and business intelligence tools would transfer well to financial analysis roles. I am particularly interested in Financial Services LLC''s focus on investment advisory and wealth management.', 'https://resumes.purpleknights.work/anthony-moore-resume.pdf');

-- Daniel Harris Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(2, 'fake-user-005', 'UUID_HERE', '2024-01-09', 'direct_apply', 'offer_extended', 'With 12+ years of marketing experience and proven success in digital campaign management, I am the ideal candidate for the Marketing Manager position. I have led marketing teams of 15+ professionals and managed budgets up to $5M. As a St. Augustine alumnus, I understand the local market and community, which would be valuable for your clients. I am excited about the opportunity to bring my expertise to Gulf Marketing Group.', 'https://resumes.purpleknights.work/daniel-harris-resume.pdf'),
(6, 'fake-user-005', 'UUID_HERE', '2024-01-14', 'direct_apply', 'interviewing', 'My marketing experience includes developing educational campaigns and working with community organizations. I believe my skills in stakeholder management and program coordination would be valuable for education program management. As a Purple Knight alumnus, I have a deep understanding of the local education landscape and am passionate about supporting educational initiatives.', 'https://resumes.purpleknights.work/daniel-harris-resume.pdf');

-- Richard Clark Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(3, 'fake-user-006', 'UUID_HERE', '2024-01-10', 'direct_apply', 'reviewing', 'As a financial controller with 20+ years of experience in financial management and accounting, I am interested in exploring opportunities in financial services companies. My expertise in financial planning, analysis, and risk management could provide valuable governance and strategic guidance. I am particularly interested in supporting Purple Knight-owned and operated businesses in the financial sector.', 'https://resumes.purpleknights.work/richard-clark-resume.pdf'),
(5, 'fake-user-006', 'UUID_HERE', '2024-01-17', 'direct_apply', 'applied', 'My financial management experience includes working with educational institutions and nonprofit organizations. I believe my expertise in governance, compliance, and financial planning would be valuable for educational program management. As a Purple Knight, I am passionate about supporting education initiatives that benefit our community.', 'https://resumes.purpleknights.work/richard-clark-resume.pdf');

-- Joseph Lewis Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'fake-user-007', 'UUID_HERE', '2024-01-12', 'direct_apply', 'applied', 'As a UX designer with strong frontend development skills, I am excited about the Frontend Developer position at Tech Innovations. My experience with Figma, React, and user-centered design would allow me to create exceptional user experiences. During my internships, I developed mobile apps with intuitive interfaces and received positive feedback on my design work. I am particularly drawn to your company''s commitment to creating user-friendly applications.', 'https://resumes.purpleknights.work/joseph-lewis-resume.pdf'),
(4, 'fake-user-007', 'UUID_HERE', '2024-01-18', 'direct_apply', 'applied', 'While my background is primarily in UX design, I have experience with healthcare technology projects and understand the importance of user-centered design in healthcare applications. My skills in user research, prototyping, and interface design would be valuable for healthcare administration roles that focus on improving patient experience and operational efficiency.', 'https://resumes.purpleknights.work/joseph-lewis-resume.pdf');

-- Thomas Walker Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(2, 'fake-user-008', 'UUID_HERE', '2024-01-11', 'direct_apply', 'reviewing', 'With 15+ years of experience in B2B sales and business development, I am interested in exploring opportunities in marketing management. My sales experience includes building relationships with clients, developing sales strategies, and managing sales teams. I believe my business development expertise would be valuable for marketing management roles that require client relationship management and revenue growth.', 'https://resumes.purpleknights.work/thomas-walker-resume.pdf'),
(6, 'fake-user-008', 'UUID_HERE', '2024-01-19', 'direct_apply', 'applied', 'My business development experience includes working with educational organizations and community partners. I believe my skills in relationship building and stakeholder management would be valuable for education program management. As a Purple Knight, I am passionate about supporting educational initiatives that benefit our community.', 'https://resumes.purpleknights.work/thomas-walker-resume.pdf');

-- Charles Allen Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(4, 'fake-user-009', 'UUID_HERE', '2024-01-13', 'direct_apply', 'interviewing', 'As a healthcare administrator with 25+ years of experience in hospital management and healthcare operations, I am excited about the Healthcare Administrator position at Healthcare Plus. My expertise in healthcare management, regulatory compliance, and quality improvement would be valuable for your organization. I am particularly drawn to your mission of delivering high-quality patient care.', 'https://resumes.purpleknights.work/charles-allen-resume.pdf'),
(5, 'fake-user-009', 'UUID_HERE', '2024-01-20', 'direct_apply', 'applied', 'My healthcare management experience includes working with educational institutions and community health programs. I believe my expertise in healthcare operations, program management, and stakeholder coordination would be valuable for education program management. As a Purple Knight, I am passionate about supporting educational initiatives that benefit our community.', 'https://resumes.purpleknights.work/charles-allen-resume.pdf');

-- Steven Young Applications
INSERT INTO applications (job_id, profile_id, employer_id, application_date, application_type, status, cover_note, resume_url) VALUES
(1, 'fake-user-010', 'UUID_HERE', '2024-01-14', 'direct_apply', 'reviewing', 'As a data analyst with strong programming skills and experience in data visualization, I am interested in exploring opportunities in technology companies. My background includes Python, SQL, and data analysis, which would be valuable for frontend development roles that require understanding data and analytics. I am particularly excited about Tech Innovations'' focus on creating data-driven applications.', 'https://resumes.purpleknights.work/steven-young-resume.pdf'),
(3, 'fake-user-010', 'UUID_HERE', '2024-01-21', 'direct_apply', 'applied', 'As a data analyst with expertise in statistical analysis and business intelligence, I am interested in exploring opportunities in financial services. My experience with Python, SQL, and data visualization tools would transfer well to financial analysis roles. I am particularly interested in Financial Services LLC''s focus on investment advisory and wealth management.', 'https://resumes.purpleknights.work/steven-young-resume.pdf');

-- ===================================================================
-- ADDITIONAL INTERVIEWS, OFFERS, AND HIRING RECORDS
-- ===================================================================

-- Additional Interview Records
INSERT INTO interview_records (application_id, interview_date, interview_type, interviewer_name, notes, rating) VALUES
(12, '2024-01-16 10:00:00', 'video', 'Sarah Chen (Tech Lead)', 'Strong mobile development skills, good understanding of React Native, showed enthusiasm for company culture. Asked thoughtful questions about mobile development best practices.', 4),
(13, '2024-01-23 14:00:00', 'in_person', 'Jennifer Martinez (Marketing Director)', 'Excellent project management experience, strong leadership skills, great cultural fit. Very interested in Purple Knights connection and local market knowledge.', 5),
(14, '2024-01-17 11:00:00', 'video', 'Lisa Davis (CEO)', 'Outstanding technical leadership experience, impressive portfolio of projects, would be valuable in advisory role. Purple Knight pride evident.', 5),
(15, '2024-01-20 15:00:00', 'video', 'David Wilson (Program Director)', 'Good understanding of educational landscape, strong program management skills. Passionate about education and community impact.', 4),
(16, '2024-01-25 13:00:00', 'in_person', 'Michael Johnson (CTO)', 'Excellent technical skills, good understanding of architecture principles, would fit well with team. Strong analytical thinking.', 4);

-- Additional Offer Records
INSERT INTO offer_records (application_id, salary_offered, salary_currency, position_title, start_date, offer_date, status, notes) VALUES
(4, 85000, 'USD', 'Marketing Manager', '2024-02-15', '2024-02-05', 'accepted', 'Competitive salary with performance bonuses and team leadership opportunities.'),
(5, 65000, 'USD', 'Education Program Manager', '2024-02-20', '2024-02-10', 'pending', 'Competitive salary with professional development opportunities.'),
(6, 150000, 'USD', 'Technical Advisor', '2024-02-01', '2024-01-28', 'accepted', 'Part-time advisory role with equity compensation and flexible schedule.');

-- Additional Hiring Records
INSERT INTO hiring_records (offer_id, start_date, feedback_score, feedback_text, alumni_rating) VALUES
(4, '2024-02-15', 5, 'Excellent addition to the marketing team. Strong leadership skills and great cultural fit. Purple Knight work ethic is evident.', 5),
(6, '2024-02-01', 5, 'Valuable strategic insights and guidance. Great mentor for our team. Proud to have Purple Knight expertise.', 5);

-- ===================================================================
-- ADDITIONAL MENTORSHIP RELATIONSHIPS
-- ===================================================================

-- Additional Mentorship Records
INSERT INTO mentorship_records (mentor_id, mentee_id, matched_date, status, focus_areas, meeting_notes, progress_rating) VALUES
('UUID_HERE', 'fake-user-001', '2024-01-06', 'active', ARRAY['career_planning', 'technical_skills', 'industry_guidance'], 
'[
  {"date": "2024-01-11", "notes": "Initial meeting - discussed David''s career goals and mobile development interests. Reviewed portfolio and identified key strengths."},
  {"date": "2024-01-18", "notes": "Discussed interview preparation and portfolio development. Provided insights into mobile development trends."},
  {"date": "2024-01-25", "notes": "Celebrated application success, discussed next steps and career path planning."}
]', 4),
('UUID_HERE', 'fake-user-002', '2024-01-07', 'active', ARRAY['leadership', 'career_advancement', 'business_strategy'], 
'[
  {"date": "2024-01-14", "notes": "Initial consultation - discussed Kevin''s leadership aspirations and current challenges."},
  {"date": "2024-01-21", "notes": "Reviewed job offer and discussed career advancement opportunities. Provided negotiation guidance."},
  {"date": "2024-01-28", "notes": "Discussed team leadership strategies and professional development planning."}
]', 5),
('UUID_HERE', 'fake-user-003', '2024-01-08', 'active', ARRAY['technical_leadership', 'career_guidance', 'industry_mentoring'], 
'[
  {"date": "2024-01-15", "notes": "Technical mentorship session - discussed architecture patterns and system design."},
  {"date": "2024-01-22", "notes": "Career guidance - discussed senior-level career paths and technical leadership."},
  {"date": "2024-01-29", "notes": "Networking introduction - connected with industry contacts and potential opportunities."}
]', 5);

-- ===================================================================
-- ADDITIONAL MESSAGES
-- ===================================================================

-- Additional Messages
INSERT INTO messages (from_user_id, to_user_id, context, context_id, subject, body, sent_at, read_at) VALUES
('UUID_HERE', 'fake-user-001', 'mentorship', '1', 'Welcome to the Purple Knights Network!', 'David, welcome to our mentorship program! I''m excited to work with you as you begin your career journey. Your mobile development skills are impressive, and I see great potential for your growth in the tech industry. Let''s schedule our first meeting to discuss your goals and how I can best support you.', '2024-01-06 09:00:00', '2024-01-06 18:30:00'),
('fake-user-001', 'UUID_HERE', 'mentorship', '1', 'Re: Welcome to the Purple Knights Network!', 'Robert, thank you so much for reaching out! I''m thrilled to be part of the mentorship program. Your experience as a CEO and entrepreneur is exactly what I need as I start my career. I would love to schedule our first meeting to discuss my goals and learn from your experience.', '2024-01-06 19:00:00', '2024-01-07 09:00:00'),
('UUID_HERE', 'fake-user-002', 'job_application', '4', 'Congratulations on the Offer!', 'Kevin, we were blown away by your interview and would like to extend an offer for the Marketing Manager position. The offer includes a competitive salary and opportunities for growth. We believe a Purple Knight like you would be perfect for our team!', '2024-02-05 10:00:00', '2024-02-05 14:00:00'),
('fake-user-002', 'UUID_HERE', 'job_application', '4', 'Re: Congratulations on the Offer!', 'Thank you so much for the offer! I''m thrilled about this opportunity. I would like to discuss the details further, particularly around team leadership opportunities. When would be a good time to connect?', '2024-02-05 15:30:00', '2024-02-06 09:00:00'),
('UUID_HERE', 'fake-user-003', 'job_application', '1', 'Advisor Role Discussion', 'Christopher, your technical expertise and leadership experience would be invaluable to Tech Innovations. We would like to discuss a potential advisory role where you could provide strategic guidance to our technical team while maintaining your current position. This would be a great opportunity to support fellow Purple Knights in the tech sector.', '2024-01-08 11:00:00', '2024-01-08 16:00:00'),
('fake-user-003', 'UUID_HERE', 'job_application', '1', 'Re: Advisor Role Discussion', 'I appreciate the opportunity to discuss an advisory role with Tech Innovations. I would be interested in learning more about how I can contribute while supporting Purple Knights in technology. Let''s schedule a call to discuss the details and potential collaboration.', '2024-01-08 17:00:00', '2024-01-09 10:00:00');

-- ===================================================================
-- ADDITIONAL CAREER MILESTONES
-- ===================================================================

-- Additional Career Milestones
INSERT INTO career_milestones (profile_id, milestone_type, details) VALUES
('fake-user-001', 'profile_completed', '{"completion_date": "2023-12-15", "profile_strength": "excellent", "completion_percentage": 100}'),
('fake-user-001', 'first_application', '{"job_title": "Frontend Developer", "company": "Tech Innovations", "date": "2024-01-09", "application_type": "direct_apply"}'),
('fake-user-001', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-06", "focus_areas": ["career_planning", "technical_skills"]}'),
('fake-user-001', 'skill_endorsed', '{"skill": "React Native", "endorser": "Sarah Chen", "endorsement_count": 3, "date": "2024-01-20"}'),

('fake-user-002', 'profile_completed', '{"completion_date": "2023-12-20", "profile_strength": "excellent", "completion_percentage": 100}'),
('fake-user-002', 'first_application', '{"job_title": "Marketing Manager", "company": "Gulf Marketing Group", "date": "2024-01-10", "application_type": "direct_apply"}'),
('fake-user-002', 'first_interview', '{"job_title": "Marketing Manager", "company": "Gulf Marketing Group", "date": "2024-01-16", "interview_type": "in_person"}'),
('fake-user-002', 'first_offer', '{"job_title": "Marketing Manager", "company": "Gulf Marketing Group", "salary": 85000, "date": "2024-02-05"}'),
('fake-user-002', 'mentor_matched', '{"mentor_name": "Robert Johnson", "match_date": "2024-01-07", "focus_areas": ["leadership", "career_advancement"]}'),

('fake-user-003', 'mentor_matched', '{"mentee_name": "David Brown", "match_date": "2024-01-06", "outcome": "active_mentorship"}'),
('fake-user-003', 'mentor_matched', '{"mentee_name": "Kevin Jackson", "match_date": "2024-01-07", "outcome": "active_mentorship"}'),
('fake-user-003', 'mentor_matched', '{"mentee_name": "Christopher White", "match_date": "2024-01-08", "outcome": "active_mentorship"}');

-- ===================================================================
-- ADDITIONAL NOTIFICATIONS
-- ===================================================================

-- Additional Notifications
INSERT INTO notifications (user_id, title, message, type, metadata, read) VALUES
('fake-user-001', 'New Job Match', 'You have a 90% match for Frontend Developer at Tech Innovations! This company specifically seeks Purple Knights alumni.', 'job_match', '{"job_id": 1, "match_score": 90, "company": "Tech Innovations"}', false),
('fake-user-001', 'Mentorship Request', 'Robert Johnson has requested to mentor you! He specializes in entrepreneurship and career planning.', 'mentor_request', '{"mentor_id": "robert-johnson", "focus_areas": ["career_planning", "technical_skills"]}', false),
('fake-user-001', 'New Message from Robert Johnson', 'Your mentor Robert Johnson has a message for you about your career goals!', 'message', '{"message_id": 1, "sender": "Robert Johnson"}', false),

('fake-user-002', 'Interview Request', 'Gulf Marketing Group wants to schedule an interview for the Marketing Manager position!', 'application_update', '{"application_id": 4, "status": "interview_scheduled"}', false),
('fake-user-002', 'Job Offer Received', 'Congratulations! Gulf Marketing Group has extended an offer for the Marketing Manager position!', 'application_update', '{"application_id": 4, "status": "offer_extended", "salary": 85000}', false),
('fake-user-002', 'New Message from Robert Johnson', 'Your mentor Robert Johnson has a message for you about your career advancement!', 'message', '{"message_id": 3, "sender": "Robert Johnson"}', false),
('fake-user-002', 'Offer Accepted', 'Congratulations! You have accepted the Marketing Manager position at Gulf Marketing Group!', 'application_update', '{"application_id": 4, "status": "offer_accepted", "start_date": "2024-02-15"}', false),

('fake-user-003', 'Advisor Request', 'Tech Innovations is interested in discussing an advisory role with you!', 'application_update', '{"application_id": 1, "status": "employer_request"}', false),
('fake-user-003', 'Mentorship Success', 'Congratulations! Your mentees David Brown and Kevin Jackson are making great progress!', 'mentorship_update', '{"mentee_count": 2, "outcomes": ["active_mentorship", "job_offer_received"]}', false),

('UUID_HERE', 'New Application', 'David Brown (Purple Knight Class of 2023) has applied for the Frontend Developer position!', 'application_update', '{"application_id": 12, "applicant": "David Brown", "alumni": true}', false),
('UUID_HERE', 'New Application', 'Kevin Jackson (Purple Knight Class of 2012) has applied for the Marketing Manager position!', 'application_update', '{"application_id": 13, "applicant": "Kevin Jackson", "alumni": true}', false);

-- ===================================================================
-- UPDATED PLATFORM METRICS
-- ===================================================================

-- Update Platform Metrics to include fake users
UPDATE platform_metrics SET metric_value = 15, breakdown = '{"verified": 15, "unverified": 0, "recent_graduates": 3, "mid_career": 5, "senior": 7}' WHERE metric_name = 'total_alumni';
UPDATE platform_metrics SET metric_value = 17, breakdown = '{"applied": 17, "reviewing": 4, "interviewing": 3, "offer_extended": 4, "hired": 3}' WHERE metric_name = 'total_applications';
UPDATE platform_metrics SET metric_value = 8, breakdown = '{"scheduled": 8, "completed": 8, "video": 5, "in_person": 3}' WHERE metric_name = 'total_interviews';
UPDATE platform_metrics SET metric_value = 4, breakdown = '{"extended": 4, "accepted": 3, "pending": 1, "declined": 0}' WHERE metric_name = 'total_offers';
UPDATE platform_metrics SET metric_value = 3, breakdown = '{"purple_knights": 3, "recent_graduates": 1, "mid_career": 2}' WHERE metric_name = 'total_hires';
UPDATE platform_metrics SET metric_value = 6, breakdown = '{"active": 6, "completed": 1, "successful_placements": 1}' WHERE metric_name = 'total_mentorships';
UPDATE platform_metrics SET metric_value = 10, breakdown = '{"sent": 10, "read": 6, "job_related": 8, "mentorship": 2}' WHERE metric_name = 'total_messages';
UPDATE platform_metrics SET metric_value = 17.6, breakdown = '{"application_to_hire": 17.6, "interview_to_offer": 50, "offer_acceptance": 75}' WHERE metric_name = 'success_rate';
