-- Purple Knights at Work - Complete Demo Data Setup
-- St. Augustine High School Alumni Platform

-- =================================================================
-- DATABASE SCHEMA CREATION
-- =================================================================

-- Drop existing tables to ensure clean schema creation
DROP TABLE IF EXISTS event_attendees CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS mentorship_relationships CASCADE;
DROP TABLE IF EXISTS job_applications CASCADE;
DROP TABLE IF EXISTS job_postings CASCADE;
DROP TABLE IF EXISTS experience CASCADE;
DROP TABLE IF EXISTS education CASCADE;
DROP TABLE IF EXISTS user_skills CASCADE;
DROP TABLE IF EXISTS skills CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS companies CASCADE;

-- Companies table
CREATE TABLE companies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    industry VARCHAR(100),
    website VARCHAR(500),
    logo_url VARCHAR(500),
    location VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Users table (unified roles for alumni, employers, mentors)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    graduation_year INTEGER,
    role VARCHAR(50) NOT NULL CHECK (role IN ('alumni', 'employer', 'mentor')),
    company_id UUID REFERENCES companies(id),
    bio TEXT,
    location VARCHAR(255),
    linkedin_url VARCHAR(500),
    profile_image_url VARCHAR(500),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Skills table
CREATE TABLE skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) UNIQUE NOT NULL,
    category VARCHAR(50)
);

-- User skills junction table
CREATE TABLE user_skills (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    skill_id UUID REFERENCES skills(id) ON DELETE CASCADE,
    proficiency_level INTEGER CHECK (proficiency_level BETWEEN 1 AND 5),
    PRIMARY KEY (user_id, skill_id)
);

-- Education table
CREATE TABLE education (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    institution VARCHAR(255) NOT NULL,
    degree VARCHAR(255),
    field_of_study VARCHAR(255),
    start_year INTEGER,
    end_year INTEGER,
    gpa DECIMAL(3,2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Experience table
CREATE TABLE experience (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    company_id UUID REFERENCES companies(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    current BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Job postings table
CREATE TABLE job_postings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    requirements TEXT,
    company_id UUID REFERENCES companies(id),
    posted_by UUID REFERENCES users(id),
    location VARCHAR(255),
    job_type VARCHAR(50) CHECK (job_type IN ('full-time', 'part-time', 'contract', 'internship')),
    salary_range VARCHAR(100),
    application_deadline DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Job applications table
CREATE TABLE job_applications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    job_id UUID REFERENCES job_postings(id) ON DELETE CASCADE,
    applicant_id UUID REFERENCES users(id) ON DELETE CASCADE,
    cover_letter TEXT,
    resume_url VARCHAR(500),
    status VARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'reviewing', 'accepted', 'rejected')),
    applied_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Mentorship relationships table
CREATE TABLE mentorship_relationships (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mentor_id UUID REFERENCES users(id) ON DELETE CASCADE,
    mentee_id UUID REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(50) DEFAULT 'active' CHECK (status IN ('active', 'completed', 'paused')),
    focus_areas TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(mentor_id, mentee_id)
);

-- Messages table
CREATE TABLE messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID REFERENCES users(id) ON DELETE CASCADE,
    receiver_id UUID REFERENCES users(id) ON DELETE CASCADE,
    subject VARCHAR(255),
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Events table
CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date TIMESTAMP WITH TIME ZONE,
    location VARCHAR(255),
    event_type VARCHAR(50) CHECK (event_type IN ('networking', 'career_fair', 'workshop', 'reunion')),
    organizer_id UUID REFERENCES users(id),
    max_attendees INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Event attendees table
CREATE TABLE event_attendees (
    event_id UUID REFERENCES events(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    registration_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    PRIMARY KEY (event_id, user_id)
);

-- =================================================================
-- DEMO DATA INSERTION
-- =================================================================

-- Insert companies
INSERT INTO companies (name, description, industry, website, location) VALUES
('Microsoft', 'Leading tech company developing software, services, and solutions', 'Technology', 'https://microsoft.com', 'Redmond, WA'),
('Google', 'Multinational tech company specializing in Internet-related services', 'Technology', 'https://google.com', 'Mountain View, CA'),
('Apple', 'Tech company that designs, develops, and sells consumer electronics', 'Technology', 'https://apple.com', 'Cupertino, CA'),
('Amazon', 'E-commerce and cloud computing giant', 'Retail and Tech', 'https://amazon.com', 'Seattle, WA'),
('JP Morgan Chase', 'Global investment bank and financial services company', 'Finance', 'https://jpmorgan.com', 'New York, NY'),
('Goldman Sachs', 'Global investment banking and securities firm', 'Finance', 'https://goldmansachs.com', 'New York, NY'),
('Johnson & Johnson', 'Pharmaceutical and medical devices company', 'Healthcare', 'https://jnj.com', 'New Brunswick, NJ'),
('Pfizer', 'Biopharmaceutical company', 'Healthcare', 'https://pfizer.com', 'New York, NY'),
('Procter & Gamble', 'Consumer goods corporation', 'Consumer Goods', 'https://pg.com', 'Cincinnati, OH'),
('Nike', 'Athletic footwear and apparel company', 'Retail', 'https://nike.com', 'Beaverton, OR'),
('ESPN', 'Sports broadcasting and media company', 'Media', 'https://espn.com', 'Bristol, CT'),
('NBA', 'Professional basketball league', 'Sports', 'https://nba.com', 'New York, NY'),
('NFL', 'Professional football league', 'Sports', 'https://nfl.com', 'New York, NY'),
('Nike Sports Marketing', 'Sports marketing division of Nike', 'Sports Marketing', 'https://nike.com', 'Beaverton, OR'),
('Adidas', 'Athletic footwear and apparel company', 'Retail', 'https://adidas.com', 'Herzogenaurach, Germany');

-- Insert skills
INSERT INTO skills (name, category) VALUES
('JavaScript', 'Programming'),
('Python', 'Programming'),
('Java', 'Programming'),
('React', 'Frontend'),
('Node.js', 'Backend'),
('SQL', 'Database'),
('MongoDB', 'Database'),
('AWS', 'Cloud'),
('Azure', 'Cloud'),
('Docker', 'DevOps'),
('Kubernetes', 'DevOps'),
('Machine Learning', 'AI/ML'),
('Data Analysis', 'Data Science'),
('Project Management', 'Management'),
('Leadership', 'Management'),
('Communication', 'Soft Skills'),
('Marketing', 'Business'),
('Sales', 'Business'),
('Financial Analysis', 'Finance'),
('Sports Management', 'Sports'),
('Athletic Training', 'Sports'),
('Physical Therapy', 'Healthcare'),
('Sports Journalism', 'Media'),
('Digital Marketing', 'Marketing'),
('Social Media Marketing', 'Marketing'),
('CSS', 'Frontend'),
('Problem Solving', 'Soft Skills'),
('Computer Vision', 'AI/ML'),
('TensorFlow', 'AI/ML'),
('Research', 'Soft Skills'),
('CI/CD', 'DevOps'),
('Automation', 'DevOps'),
('Swift', 'Programming');

-- Insert main alumni users
INSERT INTO users (email, first_name, last_name, graduation_year, role, company_id, bio, location, linkedin_url) VALUES
('marcus.johnson@email.com', 'Marcus', 'Johnson', 2010, 'alumni', (SELECT id FROM companies WHERE name = 'Microsoft'), 'Software Engineer specializing in cloud computing and distributed systems. Passionate about mentoring young programmers.', 'Seattle, WA', 'https://linkedin.com/in/marcusjohnson'),
('david.williams@email.com', 'David', 'Williams', 2012, 'alumni', (SELECT id FROM companies WHERE name = 'Google'), 'Product Manager working on AI/ML initiatives. St. Augustine basketball team captain 2012.', 'Mountain View, CA', 'https://linkedin.com/in/davidwilliams'),
('james.brown@email.com', 'James', 'Brown', 2011, 'alumni', (SELECT id FROM companies WHERE name = 'Apple'), 'iOS Developer creating innovative mobile experiences. Former student council president.', 'Cupertino, CA', 'https://linkedin.com/in/jamesbrown'),
('robert.davis@email.com', 'Robert', 'Davis', 2013, 'alumni', (SELECT id FROM companies WHERE name = 'Amazon'), 'Data Scientist focusing on recommendation systems and machine learning.', 'Seattle, WA', 'https://linkedin.com/in/robertdavis'),
('michael.wilson@email.com', 'Michael', 'Wilson', 2010, 'alumni', (SELECT id FROM companies WHERE name = 'JP Morgan Chase'), 'Investment Banking Associate specializing in tech sector M&A.', 'New York, NY', 'https://linkedin.com/in/michaelwilson'),
('richard.moore@email.com', 'Richard', 'Moore', 2014, 'alumni', (SELECT id FROM companies WHERE name = 'Goldman Sachs'), 'Quantitative Analyst developing trading algorithms and risk models.', 'New York, NY', 'https://linkedin.com/in/richardmoore'),
('thomas.taylor@email.com', 'Thomas', 'Taylor', 2012, 'alumni', (SELECT id FROM companies WHERE name = 'Johnson & Johnson'), 'Pharmaceutical Research Scientist developing new drug formulations.', 'New Brunswick, NJ', 'https://linkedin.com/in/thomastaylor'),
('charles.anderson@email.com', 'Charles', 'Anderson', 2013, 'alumni', (SELECT id FROM companies WHERE name = 'Pfizer'), 'Clinical Research Manager overseeing vaccine development trials.', 'New York, NY', 'https://linkedin.com/in/charlesanderson'),
('daniel.thomas@email.com', 'Daniel', 'Thomas', 2011, 'alumni', (SELECT id FROM companies WHERE name = 'Procter & Gamble'), 'Brand Manager leading marketing strategy for consumer products.', 'Cincinnati, OH', 'https://linkedin.com/in/danielthomas'),
('matthew.jackson@email.com', 'Matthew', 'Jackson', 2014, 'alumni', (SELECT id FROM companies WHERE name = 'Nike'), 'Sports Marketing Manager working with professional athletes.', 'Beaverton, OR', 'https://linkedin.com/in/matthewjackson'),
('anthony.white@email.com', 'Anthony', 'White', 2012, 'alumni', (SELECT id FROM companies WHERE name = 'ESPN'), 'Sports Producer covering college basketball and football.', 'Bristol, CT', 'https://linkedin.com/in/anthonywhite'),
('christopher.harris@email.com', 'Christopher', 'Harris', 2013, 'alumni', (SELECT id FROM companies WHERE name = 'NBA'), 'Basketball Operations Manager working with player development.', 'New York, NY', 'https://linkedin.com/in/christopherharris'),
('joseph.martin@email.com', 'Joseph', 'Martin', 2010, 'alumni', (SELECT id FROM companies WHERE name = 'NFL'), 'Player Development Coordinator helping athletes transition to careers after sports.', 'New York, NY', 'https://linkedin.com/in/josephmartin'),
('andrew.thompson@email.com', 'Andrew', 'Thompson', 2011, 'alumni', (SELECT id FROM companies WHERE name = 'Nike Sports Marketing'), 'Athletic Marketing Director managing endorsement deals.', 'Beaverton, OR', 'https://linkedin.com/in/andrewthompson'),
('joshua.garcia@email.com', 'Joshua', 'Garcia', 2014, 'alumni', (SELECT id FROM companies WHERE name = 'Adidas'), 'Product Designer creating innovative athletic footwear.', 'Herzogenaurach, Germany', 'https://linkedin.com/in/joshuagarcia');

-- Insert employer users
INSERT INTO users (email, first_name, last_name, role, company_id, bio, location) VALUES
('hr.microsoft@company.com', 'Sarah', 'Chen', 'employer', (SELECT id FROM companies WHERE name = 'Microsoft'), 'HR Manager at Microsoft looking for talented St. Augustine alumni.', 'Redmond, WA'),
('hr.google@company.com', 'Emily', 'Rodriguez', 'employer', (SELECT id FROM companies WHERE name = 'Google'), 'Tech Recruiter seeking diverse talent for Google teams.', 'Mountain View, CA'),
('hr.apple@company.com', 'Lisa', 'Wang', 'employer', (SELECT id FROM companies WHERE name = 'Apple'), 'Talent Acquisition Specialist for Apple iOS team.', 'Cupertino, CA'),
('hr.amazon@company.com', 'Jennifer', 'Kim', 'employer', (SELECT id FROM companies WHERE name = 'Amazon'), 'Senior Recruiter for Amazon Web Services.', 'Seattle, WA'),
('hr.jpmorgan@company.com', 'Amanda', 'Johnson', 'employer', (SELECT id FROM companies WHERE name = 'JP Morgan Chase'), 'Investment Banking Recruiter.', 'New York, NY'),
('hr.goldmansachs@company.com', 'Robert', 'Taylor', 'employer', (SELECT id FROM companies WHERE name = 'Goldman Sachs'), 'Quantitative Finance Recruiter.', 'New York, NY'),
('hr.jj@company.com', 'Maria', 'Garcia', 'employer', (SELECT id FROM companies WHERE name = 'Johnson & Johnson'), 'Healthcare Research Recruiter.', 'New Brunswick, NJ'),
('hr.pfizer@company.com', 'David', 'Lee', 'employer', (SELECT id FROM companies WHERE name = 'Pfizer'), 'Pharmaceutical Research Recruiter.', 'New York, NY'),
('hr.pg@company.com', 'Jennifer', 'White', 'employer', (SELECT id FROM companies WHERE name = 'Procter & Gamble'), 'Consumer Goods Marketing Recruiter.', 'Cincinnati, OH'),
('hr.nike@company.com', 'Michael', 'Jordan', 'employer', (SELECT id FROM companies WHERE name = 'Nike'), 'Sports Marketing Recruiter.', 'Beaverton, OR'),
('hr.espn@company.com', 'Chris', 'Berman', 'employer', (SELECT id FROM companies WHERE name = 'ESPN'), 'Sports Media Recruiter.', 'Bristol, CT'),
('hr.nba@company.com', 'LeBron', 'James', 'employer', (SELECT id FROM companies WHERE name = 'NBA'), 'Basketball Operations Recruiter.', 'New York, NY'),
('hr.nfl@company.com', 'Tom', 'Brady', 'employer', (SELECT id FROM companies WHERE name = 'NFL'), 'Player Development Recruiter.', 'New York, NY'),
('hr.nikemarketing@company.com', 'Kobe', 'Bryant', 'employer', (SELECT id FROM companies WHERE name = 'Nike Sports Marketing'), 'Athletic Marketing Recruiter.', 'Beaverton, OR'),
('hr.adidas@company.com', 'Lionel', 'Messi', 'employer', (SELECT id FROM companies WHERE name = 'Adidas'), 'Sports Product Recruiter.', 'Herzogenaurach, Germany');

-- Insert mentor users (some alumni also serve as mentors)
INSERT INTO users (email, first_name, last_name, graduation_year, role, company_id, bio, location) VALUES
('mentor.alex@email.com', 'Alexander', 'Washington', 2005, 'mentor', (SELECT id FROM companies WHERE name = 'Microsoft'), 'Senior Software Engineer with 15+ years experience. Passionate about mentoring the next generation.', 'Seattle, WA'),
('mentor.benjamin@email.com', 'Benjamin', 'Franklin', 2008, 'mentor', (SELECT id FROM companies WHERE name = 'Google'), 'Engineering Director. Mentor for career development and tech leadership.', 'Mountain View, CA'),
('mentor.caleb@email.com', 'Caleb', 'Jefferson', 2006, 'mentor', (SELECT id FROM companies WHERE name = 'Apple'), 'Principal Engineer. Mentor for iOS development and mobile architecture.', 'Cupertino, CA');

-- Insert education records for main users
INSERT INTO education (user_id, institution, degree, field_of_study, start_year, end_year, gpa) VALUES
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2006, 2010, 3.8),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 'Stanford University', 'Bachelor of Science', 'Computer Science', 2010, 2014, 3.9),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2008, 2012, 3.7),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), 'MIT', 'Bachelor of Science', 'Computer Science', 2012, 2016, 3.8),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2007, 2011, 3.6),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), 'UC Berkeley', 'Bachelor of Science', 'Electrical Engineering', 2011, 2015, 3.7),
((SELECT id FROM users WHERE email = 'robert.davis@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2009, 2013, 3.9),
((SELECT id FROM users WHERE email = 'robert.davis@email.com'), 'Harvard University', 'Bachelor of Arts', 'Statistics', 2013, 2017, 3.8);

-- Insert experience records
INSERT INTO experience (user_id, company_id, title, description, start_date, end_date, current) VALUES
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM companies WHERE name = 'Microsoft'), 'Software Engineer II', 'Developing cloud-based solutions for Azure platform.', '2018-06-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM companies WHERE name = 'Microsoft'), 'Software Engineer I', 'Full-stack development for Microsoft Office suite.', '2014-06-01', '2018-05-31', FALSE),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM companies WHERE name = 'Google'), 'Product Manager II', 'Leading AI/ML product initiatives.', '2019-08-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM companies WHERE name = 'Google'), 'Associate Product Manager', 'Working on Google Search features.', '2016-06-01', '2019-07-31', FALSE),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM companies WHERE name = 'Apple'), 'Senior iOS Developer', 'Developing core iOS features and applications.', '2017-03-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM companies WHERE name = 'Apple'), 'iOS Developer', 'Working on iPhone and iPad applications.', '2015-06-01', '2017-02-28', FALSE);

-- Insert user skills
INSERT INTO user_skills (user_id, skill_id, proficiency_level) VALUES
-- Marcus Johnson skills
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM skills WHERE name = 'JavaScript'), 5),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM skills WHERE name = 'Python'), 4),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM skills WHERE name = 'AWS'), 5),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM skills WHERE name = 'Docker'), 4),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM skills WHERE name = 'Kubernetes'), 3),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM skills WHERE name = 'Leadership'), 4),
-- David Williams skills
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM skills WHERE name = 'Python'), 5),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM skills WHERE name = 'Machine Learning'), 4),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM skills WHERE name = 'Project Management'), 5),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM skills WHERE name = 'Communication'), 4),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM skills WHERE name = 'Data Analysis'), 4),
-- James Brown skills
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM skills WHERE name = 'React'), 5),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM skills WHERE name = 'JavaScript'), 5),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM skills WHERE name = 'Swift'), 4),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM skills WHERE name = 'Node.js'), 3),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM skills WHERE name = 'Leadership'), 3);

-- Insert job postings
INSERT INTO job_postings (title, description, requirements, company_id, posted_by, location, job_type, salary_range, application_deadline, is_active) VALUES
('Senior Software Engineer', E'We are looking for a Senior Software Engineer to join our cloud computing team. You will work on enterprise-scale distributed systems and help shape the future of cloud tech.', E'5+ years of software development experience, strong knowledge of cloud platforms, experience with distributed systems, excellent problem-solving skills.', (SELECT id FROM companies WHERE name = 'Microsoft'), (SELECT id FROM users WHERE email = 'hr.microsoft@company.com'), 'Redmond, WA', 'full-time', '$150,000 - $200,000', '2024-06-30', TRUE),
('Product Manager - AI/ML', 'Join our AI/ML team to drive product strategy and development for cutting-edge machine learning products. You will work with engineering teams to bring innovative AI solutions to market.', '3+ years of product management experience, technical background in AI/ML, experience with data-driven decision making, excellent communication skills.', (SELECT id FROM companies WHERE name = 'Google'), (SELECT id FROM users WHERE email = 'hr.google@company.com'), 'Mountain View, CA', 'full-time', '$140,000 - $180,000', '2024-07-15', TRUE),
('iOS Developer', 'Looking for talented iOS developers to join our mobile apps team. You will work on core iOS applications used by millions of customers worldwide.', '3+ years of iOS development experience, strong Swift and Objective-C skills, experience with iOS frameworks, portfolio of published apps.', (SELECT id FROM companies WHERE name = 'Apple'), (SELECT id FROM users WHERE email = 'hr.apple@company.com'), 'Cupertino, CA', 'full-time', '$120,000 - $160,000', '2024-06-30', TRUE),
('Data Scientist - Recommendation Systems', 'Join our data science team to work on cutting-edge recommendation algorithms that power personalized experiences for millions of customers.', '4+ years of data science experience, strong programming skills in Python/R, experience with machine learning algorithms, knowledge of recommendation systems.', (SELECT id FROM companies WHERE name = 'Amazon'), (SELECT id FROM users WHERE email = 'hr.amazon@company.com'), 'Seattle, WA', 'full-time', '$130,000 - $170,000', '2024-07-01', TRUE),
('Investment Banking Analyst', E'Seeking talented analysts for our tech investment banking team. You will work on M&A transactions, IPOs, and strategic advisory for tech companies.', E'Bachelor''s degree from top university, strong analytical skills, experience in finance or investment banking, excellent communication skills.', (SELECT id FROM companies WHERE name = 'JP Morgan Chase'), (SELECT id FROM users WHERE email = 'hr.jpmorgan@company.com'), 'New York, NY', 'full-time', '$100,000 - $150,000', '2024-06-15', TRUE),
('Sports Marketing Coordinator', 'Join our sports marketing team to work with professional athletes and manage endorsement campaigns. Great opportunity for sports enthusiasts.', '2+ years of marketing experience, passion for sports, strong communication skills, experience with social media marketing.', (SELECT id FROM companies WHERE name = 'Nike'), (SELECT id FROM users WHERE email = 'hr.nike@company.com'), 'Beaverton, OR', 'full-time', '$70,000 - $90,000', '2024-07-31', TRUE),
('Sports Producer', 'Looking for creative sports producers to join our programming team. You will work on college sports coverage and special features.', '3+ years of sports production experience, knowledge of college basketball and football, creative storytelling skills, ability to work under deadlines.', (SELECT id FROM companies WHERE name = 'ESPN'), (SELECT id FROM users WHERE email = 'hr.espn@company.com'), 'Bristol, CT', 'full-time', '$80,000 - $120,000', '2024-06-30', TRUE),
('Basketball Operations Manager', 'Join our basketball operations team to work with player development and league initiatives. Great role for former basketball players.', 'Experience in basketball operations or player development, understanding of NBA systems, strong analytical skills, excellent communication.', (SELECT id FROM companies WHERE name = 'NBA'), (SELECT id FROM users WHERE email = 'hr.nba@company.com'), 'New York, NY', 'full-time', '$90,000 - $130,000', '2024-07-15', TRUE),
('Player Development Coordinator', 'Help NFL players transition to successful careers after football. You will coordinate career development programs and resources.', 'Experience in career counseling or player development, understanding of professional sports, strong networking skills, empathy for athletes.', (SELECT id FROM companies WHERE name = 'NFL'), (SELECT id FROM users WHERE email = 'hr.nfl@company.com'), 'New York, NY', 'full-time', '$75,000 - $100,000', '2024-06-30', TRUE),
('Athletic Marketing Director', 'Lead athletic marketing initiatives and manage endorsement deals with professional athletes. High-impact role in sports industry.', '5+ years of sports marketing experience, experience with athlete endorsements, strong business development skills, understanding of sports industry.', (SELECT id FROM companies WHERE name = 'Nike Sports Marketing'), (SELECT id FROM users WHERE email = 'hr.nikemarketing@company.com'), 'Beaverton, OR', 'full-time', '$120,000 - $160,000', '2024-07-31', TRUE);

-- Insert job applications
INSERT INTO job_applications (job_id, applicant_id, cover_letter, status) VALUES
((SELECT id FROM job_postings WHERE title = 'Senior Software Engineer'), (SELECT id FROM users WHERE email = 'robert.davis@email.com'), 'I am excited to apply for the Senior Software Engineer position at Microsoft. With my background in data science and machine learning, I bring strong programming skills and experience with distributed systems.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Product Manager - AI/ML'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 'As a software engineer with experience in cloud computing, I have a strong technical background and product sense that would be valuable for the AI/ML Product Manager role.', 'reviewing'),
((SELECT id FROM job_postings WHERE title = 'iOS Developer'), (SELECT id FROM users WHERE email = 'david.williams@email.com'), E'While my background is in product management, I have coding experience and a passion for mobile tech. I would bring a unique perspective to the iOS Developer role.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Data Scientist - Recommendation Systems'), (SELECT id FROM users WHERE email = 'james.brown@email.com'), 'My experience in iOS development has given me strong analytical skills and understanding of user behavior that would translate well to data science.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Investment Banking Analyst'), (SELECT id FROM users WHERE email = 'michael.wilson@email.com'), E'I am currently in investment banking and looking to transition to a firm with stronger tech focus. My experience would be immediately valuable.', 'accepted'),
((SELECT id FROM job_postings WHERE title = 'Sports Marketing Coordinator'), (SELECT id FROM users WHERE email = 'matthew.jackson@email.com'), 'Currently working in sports marketing at Nike, I am looking for new challenges and opportunities to grow in the field.', 'reviewing'),
((SELECT id FROM job_postings WHERE title = 'Sports Producer'), (SELECT id FROM users WHERE email = 'anthony.white@email.com'), 'With my experience at ESPN covering college sports, I have the perfect background for this Sports Producer role.', 'accepted'),
((SELECT id FROM job_postings WHERE title = 'Basketball Operations Manager'), (SELECT id FROM users WHERE email = 'christopher.harris@email.com'), 'My current role at NBA has prepared me well for this position. I understand the basketball operations landscape thoroughly.', 'accepted'),
((SELECT id FROM job_postings WHERE title = 'Player Development Coordinator'), (SELECT id FROM users WHERE email = 'joseph.martin@email.com'), 'Working in player development at NFL has given me exactly the experience needed for this coordinator role.', 'reviewing'),
((SELECT id FROM job_postings WHERE title = 'Athletic Marketing Director'), (SELECT id FROM users WHERE email = 'andrew.thompson@email.com'), 'I am ready to step up to a director role in athletic marketing. My experience at Nike Sports Marketing has prepared me well.', 'pending');

-- Insert mentorship relationships
INSERT INTO mentorship_relationships (mentor_id, mentee_id, status, focus_areas) VALUES
((SELECT id FROM users WHERE email = 'mentor.alex@email.com'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), E'active', E'Career development, tech leadership, cloud computing'),
((SELECT id FROM users WHERE email = 'mentor.benjamin@email.com'), (SELECT id FROM users WHERE email = 'david.williams@email.com'), 'active', 'Product management, AI/ML strategy, team leadership'),
((SELECT id FROM users WHERE email = 'mentor.caleb@email.com'), (SELECT id FROM users WHERE email = 'james.brown@email.com'), 'active', 'iOS development, mobile architecture, career advancement'),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM users WHERE email = 'robert.davis@email.com'), E'active', E'Software engineering, cloud techs, career transition'),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM users WHERE email = 'james.brown@email.com'), E'active', E'Product development, tech skills, career growth'),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM users WHERE email = 'matthew.jackson@email.com'), E'active', E'Tech in sports, career development, industry transition');

-- Insert messages
INSERT INTO messages (sender_id, receiver_id, subject, content, is_read) VALUES
((SELECT id FROM users WHERE email = 'mentor.alex@email.com'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 'Welcome to Mentorship Program', 'Hi Marcus! I''m excited to be your mentor. Let me know what specific areas you''d like to focus on in our sessions.', TRUE),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM users WHERE email = 'mentor.alex@email.com'), 'Re: Welcome to Mentorship Program', E'Thank you Alex! I''d love to discuss career advancement strategies and how to move into tech leadership roles.', TRUE),
((SELECT id FROM users WHERE email = 'hr.microsoft@company.com'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 'Senior Software Engineer Application', 'Hi Marcus, we received your application and would like to schedule an interview. Are you available next week?', TRUE),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM users WHERE email = 'hr.microsoft@company.com'), 'Re: Senior Software Engineer Application', 'Yes, I''m available next week. Please let me know what times work for you.', FALSE),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM users WHERE email = 'james.brown@email.com'), 'Catch Up', 'Hey James! It''s been a while. How are things going at Apple? We should grab coffee sometime.', TRUE),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM users WHERE email = 'david.williams@email.com'), 'Re: Catch Up', 'Hey David! Things are great at Apple. Would love to catch up. How about next weekend?', FALSE),
((SELECT id FROM users WHERE email = 'anthony.white@email.com'), (SELECT id FROM users WHERE email = 'christopher.harris@email.com'), 'NBA Collaboration', 'Hi Chris, I''m working on a special about NBA player development. Would love to get your insights for the piece.', TRUE),
((SELECT id FROM users WHERE email = 'christopher.harris@email.com'), (SELECT id FROM users WHERE email = 'anthony.white@email.com'), 'Re: NBA Collaboration', 'That sounds great! I''d be happy to contribute. Let me know what specific topics you''d like to cover.', FALSE);

-- Insert events
INSERT INTO events (title, description, event_date, location, event_type, organizer_id, max_attendees) VALUES
('St. Augustine Alumni Networking Night', 'Annual networking event for St. Augustine alumni to connect and share opportunities.', '2024-06-15 18:00:00', 'New Orleans, LA', 'networking', (SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 100),
(E'Tech Career Fair for HBCU Alumni', E'Career fair featuring top tech companies looking to hire HBCU alumni.', '2024-07-20 10:00:00', 'Virtual', 'career_fair', (SELECT id FROM users WHERE email = 'david.williams@email.com'), 500),
('Leadership Development Workshop', 'Workshop focused on developing leadership skills for professionals.', '2024-08-10 09:00:00', 'Virtual', 'workshop', (SELECT id FROM users WHERE email = 'mentor.alex@email.com'), 50),
('St. Augustine Class of 2010-2014 Reunion', 'Reunion for alumni who graduated between 2010-2014.', '2024-09-01 14:00:00', 'New Orleans, LA', 'reunion', (SELECT id FROM users WHERE email = 'james.brown@email.com'), 75),
('Sports Industry Career Panel', 'Panel discussion with alumni working in sports industry sharing career insights.', '2024-07-25 19:00:00', 'Virtual', 'networking', (SELECT id FROM users WHERE email = 'matthew.jackson@email.com'), 200);

-- Insert event attendees
INSERT INTO event_attendees (event_id, user_id) VALUES
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'david.williams@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'james.brown@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'robert.davis@email.com')),
((SELECT id FROM events WHERE title = E'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com')),
((SELECT id FROM events WHERE title = E'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'david.williams@email.com')),
((SELECT id FROM events WHERE title = E'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'james.brown@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'david.williams@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'mentor.alex@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Class of 2010-2014 Reunion'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Class of 2010-2014 Reunion'), (SELECT id FROM users WHERE email = 'david.williams@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Class of 2010-2014 Reunion'), (SELECT id FROM users WHERE email = 'james.brown@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'matthew.jackson@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'anthony.white@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'christopher.harris@email.com'));

-- =================================================================
-- ADDITIONAL FAKE USERS FOR REALISTIC PLATFORM INTERACTIONS
-- =================================================================

-- Insert additional fake alumni users
INSERT INTO users (email, first_name, last_name, graduation_year, role, company_id, bio, location, linkedin_url) VALUES
('kevin.mitchell@email.com', 'Kevin', 'Mitchell', 2015, 'alumni', (SELECT id FROM companies WHERE name = 'Microsoft'), 'Frontend Developer passionate about creating intuitive user interfaces.', 'Seattle, WA', 'https://linkedin.com/in/kevinmitchell'),
('brian.scott@email.com', 'Brian', 'Scott', 2016, 'alumni', (SELECT id FROM companies WHERE name = 'Google'), 'Backend Engineer working on scalable infrastructure.', 'Mountain View, CA', 'https://linkedin.com/in/brianscott'),
('eric.hill@email.com', 'Eric', 'Hill', 2015, 'alumni', (SELECT id FROM companies WHERE name = 'Apple'), 'Machine Learning Engineer working on computer vision projects.', 'Cupertino, CA', 'https://linkedin.com/in/erichill'),
('ryan.adams@email.com', 'Ryan', 'Adams', 2017, 'alumni', (SELECT id FROM companies WHERE name = 'Amazon'), 'DevOps Engineer specializing in containerization and CI/CD.', 'Seattle, WA', 'https://linkedin.com/in/ryandams'),
('kevin.baker@email.com', 'Kevin', 'Baker', 2016, 'alumni', (SELECT id FROM companies WHERE name = 'JP Morgan Chase'), 'Financial Analyst working on risk assessment models.', 'New York, NY', 'https://linkedin.com/in/kevinbaker'),
('timothy.nelson@email.com', 'Timothy', 'Nelson', 2018, 'alumni', (SELECT id FROM companies WHERE name = 'Goldman Sachs'), 'Investment Analyst focusing on tech sector investments.', 'New York, NY', 'https://linkedin.com/in/timothynelson'),
('jason.carter@email.com', 'Jason', 'Carter', 2017, 'alumni', (SELECT id FROM companies WHERE name = 'Johnson & Johnson'), 'Biomedical Engineer developing medical devices.', 'New Brunswick, NJ', 'https://linkedin.com/in/jasoncarter'),
('adam.mitchell@email.com', 'Adam', 'Mitchell', 2018, 'alumni', (SELECT id FROM companies WHERE name = 'Pfizer'), 'Research Scientist working on drug discovery.', 'New York, NY', 'https://linkedin.com/in/adammitchell'),
('sean.perez@email.com', 'Sean', 'Perez', 2016, 'alumni', (SELECT id FROM companies WHERE name = 'Procter & Gamble'), 'Marketing Analyst specializing in consumer insights.', 'Cincinnati, OH', 'https://linkedin.com/in/seanperez'),
('jordan.roberts@email.com', 'Jordan', 'Roberts', 2019, 'alumni', (SELECT id FROM companies WHERE name = 'Nike'), 'Digital Marketing Manager leading social media campaigns.', 'Beaverton, OR', 'https://linkedin.com/in/jordanroberts'),
('kyle.turner@email.com', 'Kyle', 'Turner', 2017, 'alumni', (SELECT id FROM companies WHERE name = 'ESPN'), 'Sports Analyst covering basketball and football statistics.', 'Bristol, CT', 'https://linkedin.com/in/kyleturner'),
('tyler.phillips@email.com', 'Tyler', 'Phillips', 2018, 'alumni', (SELECT id FROM companies WHERE name = 'NBA'), 'Data Analyst working on player performance metrics.', 'New York, NY', 'https://linkedin.com/in/tylerphillips'),
('connor.campbell@email.com', 'Connor', 'Campbell', 2019, 'alumni', (SELECT id FROM companies WHERE name = 'NFL'), 'Marketing Coordinator for NFL community programs.', 'New York, NY', 'https://linkedin.com/in/connorcampbell'),
('blake.parker@email.com', 'Blake', 'Parker', 2017, 'alumni', (SELECT id FROM companies WHERE name = 'Nike Sports Marketing'), 'Brand Manager working with athlete endorsements.', 'Beaverton, OR', 'https://linkedin.com/in/blakeparker'),
('austin.collins@email.com', 'Austin', 'Collins', 2020, 'alumni', (SELECT id FROM companies WHERE name = 'Adidas'), 'Product Developer creating innovative athletic footwear.', 'Herzogenaurach, Germany', 'https://linkedin.com/in/austincollins'),
('owen.edwards@email.com', 'Owen', 'Edwards', 2018, 'alumni', (SELECT id FROM companies WHERE name = 'Microsoft'), 'Cloud Solutions Architect helping customers migrate to Azure.', 'Seattle, WA', 'https://linkedin.com/in/owenedwards'),
('hunter.stewart@email.com', 'Hunter', 'Stewart', 2019, 'alumni', (SELECT id FROM companies WHERE name = 'Google'), 'Security Engineer protecting Google infrastructure.', 'Mountain View, CA', 'https://linkedin.com/in/hunterstewart'),
('ethan.sanchez@email.com', 'Ethan', 'Sanchez', 2020, 'alumni', (SELECT id FROM companies WHERE name = 'Apple'), 'AR/VR Developer working on next-generation experiences.', 'Cupertino, CA', 'https://linkedin.com/in/ethansanchez'),
('mason.morris@email.com', 'Mason', 'Morris', 2018, 'alumni', (SELECT id FROM companies WHERE name = 'Amazon'), 'Business Intelligence Analyst creating dashboards and reports.', 'Seattle, WA', 'https://linkedin.com/in/masonmorris'),
('isaac.rogers@email.com', 'Isaac', 'Rogers', 2021, 'alumni', (SELECT id FROM companies WHERE name = 'JP Morgan Chase'), 'Quantitative Analyst developing trading strategies.', 'New York, NY', 'https://linkedin.com/in/isaacrogers');

-- Insert education for fake users
INSERT INTO education (user_id, institution, degree, field_of_study, start_year, end_year, gpa) VALUES
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2011, 2015, 3.7),
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), 'Georgia Tech', 'Bachelor of Science', 'Computer Science', 2015, 2019, 3.8),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2012, 2016, 3.6),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), 'Carnegie Mellon', 'Bachelor of Science', 'Computer Science', 2016, 2020, 3.7),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2011, 2015, 3.8),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), 'Caltech', 'Bachelor of Science', 'Computer Science', 2015, 2019, 3.9),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), 'St. Augustine High School', 'High School Diploma', 'General Studies', 2013, 2017, 3.5),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), 'University of Washington', 'Bachelor of Science', 'Computer Science', 2017, 2021, 3.6);

-- Insert experience for fake users
INSERT INTO experience (user_id, company_id, title, description, start_date, end_date, current) VALUES
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM companies WHERE name = 'Microsoft'), 'Frontend Developer', 'Developing user interfaces for Microsoft Teams and Office 365.', '2019-07-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM companies WHERE name = 'Google'), 'Backend Engineer', 'Working on Google Cloud Platform infrastructure and scalability.', '2020-06-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM companies WHERE name = 'Apple'), 'Machine Learning Engineer', 'Developing computer vision algorithms for iOS camera features.', '2019-08-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), (SELECT id FROM companies WHERE name = 'Amazon'), 'DevOps Engineer', 'Managing CI/CD pipelines and container orchestration for AWS services.', '2021-07-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'kevin.baker@email.com'), (SELECT id FROM companies WHERE name = 'JP Morgan Chase'), 'Financial Analyst', 'Analyzing financial risks and developing assessment models.', '2020-06-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'timothy.nelson@email.com'), (SELECT id FROM companies WHERE name = 'Goldman Sachs'), 'Investment Analyst', 'Researching and analyzing technology sector investment opportunities.', '2021-08-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'jason.carter@email.com'), (SELECT id FROM companies WHERE name = 'Johnson & Johnson'), 'Biomedical Engineer', 'Designing and testing medical devices for patient care.', '2020-07-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'adam.mitchell@email.com'), (SELECT id FROM companies WHERE name = 'Pfizer'), 'Research Scientist', 'Conducting research for new drug discovery and development.', '2021-06-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'sean.perez@email.com'), (SELECT id FROM companies WHERE name = 'Procter & Gamble'), 'Marketing Analyst', 'Analyzing consumer behavior and market trends for product development.', '2020-08-01', NULL, TRUE),
((SELECT id FROM users WHERE email = 'jordan.roberts@email.com'), (SELECT id FROM companies WHERE name = 'Nike'), 'Digital Marketing Manager', 'Managing social media campaigns and digital marketing strategies.', '2021-07-01', NULL, TRUE);

-- Insert skills for fake users
INSERT INTO user_skills (user_id, skill_id, proficiency_level) VALUES
-- Kevin Mitchell skills
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM skills WHERE name = 'React'), 5),
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM skills WHERE name = 'JavaScript'), 5),
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM skills WHERE name = 'CSS'), 4),
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM skills WHERE name = 'Node.js'), 3),
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM skills WHERE name = 'Communication'), 4),
-- Brian Scott skills
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM skills WHERE name = 'Python'), 5),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM skills WHERE name = 'Java'), 4),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM skills WHERE name = 'SQL'), 4),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM skills WHERE name = 'MongoDB'), 3),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM skills WHERE name = 'Problem Solving'), 5),
-- Eric Hill skills
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM skills WHERE name = 'Python'), 5),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM skills WHERE name = 'Machine Learning'), 5),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM skills WHERE name = 'Computer Vision'), 4),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM skills WHERE name = 'TensorFlow'), 4),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM skills WHERE name = 'Research'), 4),
-- Ryan Adams skills
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), (SELECT id FROM skills WHERE name = 'Docker'), 5),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), (SELECT id FROM skills WHERE name = 'Kubernetes'), 4),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), (SELECT id FROM skills WHERE name = 'AWS'), 4),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), (SELECT id FROM skills WHERE name = 'CI/CD'), 5),
((SELECT id FROM users WHERE email = 'ryan.adams@email.com'), (SELECT id FROM skills WHERE name = 'Automation'), 4);

-- Insert job applications from fake users
INSERT INTO job_applications (job_id, applicant_id, cover_letter, status) VALUES
((SELECT id FROM job_postings WHERE title = 'Senior Software Engineer'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), 'As a frontend developer at Microsoft, I have strong experience with modern web technologies and would bring valuable perspective to this senior role.', 'reviewing'),
((SELECT id FROM job_postings WHERE title = 'Product Manager - AI/ML'), (SELECT id FROM users WHERE email = 'brian.scott@email.com'), 'My backend engineering experience has given me deep technical understanding that would be valuable for product management in AI/ML.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'iOS Developer'), (SELECT id FROM users WHERE email = 'eric.hill@email.com'), 'While I work in ML at Apple, I have strong programming skills and would be excited to transition to iOS development.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Data Scientist - Recommendation Systems'), (SELECT id FROM users WHERE email = 'ryan.adams@email.com'), 'My DevOps background has given me strong data skills and understanding of large-scale systems that would apply well to data science.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Investment Banking Analyst'), (SELECT id FROM users WHERE email = 'kevin.baker@email.com'), 'Currently working as a financial analyst, I am ready to take the next step into investment banking.', 'reviewing'),
((SELECT id FROM job_postings WHERE title = 'Sports Marketing Coordinator'), (SELECT id FROM users WHERE email = 'jordan.roberts@email.com'), 'My digital marketing experience at Nike has prepared me well for this sports marketing coordinator role.', 'accepted'),
((SELECT id FROM job_postings WHERE title = 'Sports Producer'), (SELECT id FROM users WHERE email = 'kyle.turner@email.com'), 'As a sports analyst, I have deep understanding of sports that would translate well to sports production.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Basketball Operations Manager'), (SELECT id FROM users WHERE email = 'tyler.phillips@email.com'), 'My data analysis experience at NBA would be valuable for basketball operations management.', 'reviewing'),
((SELECT id FROM job_postings WHERE title = 'Player Development Coordinator'), (SELECT id FROM users WHERE email = 'connor.campbell@email.com'), 'My marketing coordination experience and passion for helping athletes makes me ideal for this role.', 'pending'),
((SELECT id FROM job_postings WHERE title = 'Athletic Marketing Director'), (SELECT id FROM users WHERE email = 'blake.parker@email.com'), 'Ready to step up to director level with my brand management experience at Nike Sports Marketing.', 'reviewing');

-- Insert additional mentorship relationships
INSERT INTO mentorship_relationships (mentor_id, mentee_id, status, focus_areas) VALUES
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), 'active', 'Frontend development, career growth at Microsoft'),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM users WHERE email = 'brian.scott@email.com'), 'active', 'Backend engineering, transition to product management'),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM users WHERE email = 'eric.hill@email.com'), 'active', 'Machine learning, iOS development, Apple career growth'),
((SELECT id FROM users WHERE email = 'robert.davis@email.com'), (SELECT id FROM users WHERE email = 'ryan.adams@email.com'), 'active', 'Data science, DevOps, cloud technologies'),
((SELECT id FROM users WHERE email = 'michael.wilson@email.com'), (SELECT id FROM users WHERE email = 'kevin.baker@email.com'), 'active', 'Finance careers, investment banking, risk analysis'),
((SELECT id FROM users WHERE email = 'matthew.jackson@email.com'), (SELECT id FROM users WHERE email = 'jordan.roberts@email.com'), 'active', 'Sports marketing, digital marketing, brand management'),
((SELECT id FROM users WHERE email = 'anthony.white@email.com'), (SELECT id FROM users WHERE email = 'kyle.turner@email.com'), 'active', 'Sports media, analytics, broadcasting'),
((SELECT id FROM users WHERE email = 'christopher.harris@email.com'), (SELECT id FROM users WHERE email = 'tyler.phillips@email.com'), 'active', 'Basketball operations, data analysis, player development'),
((SELECT id FROM users WHERE email = 'joseph.martin@email.com'), (SELECT id FROM users WHERE email = 'connor.campbell@email.com'), 'active', 'Player development, sports marketing, career transition'),
((SELECT id FROM users WHERE email = 'andrew.thompson@email.com'), (SELECT id FROM users WHERE email = 'blake.parker@email.com'), 'active', 'Athletic marketing, brand management, endorsements');

-- Insert additional messages between fake and real users
INSERT INTO messages (sender_id, receiver_id, subject, content, is_read) VALUES
((SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), (SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), 'Microsoft Career Advice', 'Hi Marcus! I saw you''re also at Microsoft. Would love to hear about your experience and get some advice.', TRUE),
((SELECT id FROM users WHERE email = 'marcus.johnson@email.com'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com'), 'Re: Microsoft Career Advice', 'Hey Kevin! Great to connect with another Purple Knight at Microsoft. Let''s grab coffee next week.', FALSE),
((SELECT id FROM users WHERE email = 'brian.scott@email.com'), (SELECT id FROM users WHERE email = 'david.williams@email.com'), 'Google Opportunities', 'Hi David, I''m interested in transitioning to product management at Google. Any advice?', TRUE),
((SELECT id FROM users WHERE email = 'david.williams@email.com'), (SELECT id FROM users WHERE email = 'brian.scott@email.com'), 'Re: Google Opportunities', 'Hi Brian! I''d be happy to share insights about PM roles at Google. Let''s schedule a call.', FALSE),
((SELECT id FROM users WHERE email = 'eric.hill@email.com'), (SELECT id FROM users WHERE email = 'james.brown@email.com'), 'Apple ML Team', 'Hey James! I heard you work on iOS at Apple. I''m in ML here - would love to collaborate.', TRUE),
((SELECT id FROM users WHERE email = 'james.brown@email.com'), (SELECT id FROM users WHERE email = 'eric.hill@email.com'), 'Re: Apple ML Team', 'That sounds great! There are some interesting ML opportunities in iOS. Let''s discuss.', FALSE),
((SELECT id FROM users WHERE email = 'jordan.roberts@email.com'), (SELECT id FROM users WHERE email = 'matthew.jackson@email.com'), 'Nike Marketing', 'Hi Matthew! I saw you work in sports marketing at Nike. I''d love to learn about your experience.', TRUE),
((SELECT id FROM users WHERE email = 'matthew.jackson@email.com'), (SELECT id FROM users WHERE email = 'jordan.roberts@email.com'), 'Re: Nike Marketing', 'Hey Jordan! Great to connect with another Purple Knight at Nike. Let me know what specific questions you have.', FALSE),
((SELECT id FROM users WHERE email = 'kyle.turner@email.com'), (SELECT id FROM users WHERE email = 'anthony.white@email.com'), 'Sports Analytics', 'Hi Anthony! I love your work at ESPN. I''m doing sports analytics and would value your perspective.', TRUE),
((SELECT id FROM users WHERE email = 'anthony.white@email.com'), (SELECT id FROM users WHERE email = 'kyle.turner@email.com'), 'Re: Sports Analytics', 'Thanks Kyle! Analytics is huge in sports media now. Let''s connect and share insights.', FALSE),
((SELECT id FROM users WHERE email = 'tyler.phillips@email.com'), (SELECT id FROM users WHERE email = 'christopher.harris@email.com'), 'NBA Analytics', 'Hi Chris! I work in analytics at NBA and saw your role in basketball operations. Would love to connect.', TRUE),
((SELECT id FROM users WHERE email = 'christopher.harris@email.com'), (SELECT id FROM users WHERE email = 'tyler.phillips@email.com'), 'Re: NBA Analytics', 'Hey Tyler! Analytics is transforming basketball operations. Let''s definitely connect and share ideas.', FALSE);

-- Insert additional event attendees
INSERT INTO event_attendees (event_id, user_id) VALUES
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'brian.scott@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'eric.hill@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Alumni Networking Night'), (SELECT id FROM users WHERE email = 'ryan.adams@email.com')),
((SELECT id FROM events WHERE title = 'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com')),
((SELECT id FROM events WHERE title = 'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'brian.scott@email.com')),
((SELECT id FROM events WHERE title = 'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'eric.hill@email.com')),
((SELECT id FROM events WHERE title = 'Tech Career Fair for HBCU Alumni'), (SELECT id FROM users WHERE email = 'ryan.adams@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'brian.scott@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'eric.hill@email.com')),
((SELECT id FROM events WHERE title = 'Leadership Development Workshop'), (SELECT id FROM users WHERE email = 'ryan.adams@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Class of 2010-2014 Reunion'), (SELECT id FROM users WHERE email = 'kevin.mitchell@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Class of 2010-2014 Reunion'), (SELECT id FROM users WHERE email = 'brian.scott@email.com')),
((SELECT id FROM events WHERE title = 'St. Augustine Class of 2010-2014 Reunion'), (SELECT id FROM users WHERE email = 'eric.hill@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'jordan.roberts@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'kyle.turner@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'tyler.phillips@email.com')),
((SELECT id FROM events WHERE title = 'Sports Industry Career Panel'), (SELECT id FROM users WHERE email = 'connor.campbell@email.com'));

-- =================================================================
-- INDEXES FOR PERFORMANCE OPTIMIZATION
-- =================================================================

CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_company_id ON users(company_id);
CREATE INDEX IF NOT EXISTS idx_users_graduation_year ON users(graduation_year);

CREATE INDEX IF NOT EXISTS idx_job_postings_company_id ON job_postings(company_id);
CREATE INDEX IF NOT EXISTS idx_job_postings_posted_by ON job_postings(posted_by);
CREATE INDEX IF NOT EXISTS idx_job_postings_is_active ON job_postings(is_active);

CREATE INDEX IF NOT EXISTS idx_job_applications_job_id ON job_applications(job_id);
CREATE INDEX IF NOT EXISTS idx_job_applications_applicant_id ON job_applications(applicant_id);
CREATE INDEX IF NOT EXISTS idx_job_applications_status ON job_applications(status);

CREATE INDEX IF NOT EXISTS idx_mentorship_relationships_mentor_id ON mentorship_relationships(mentor_id);
CREATE INDEX IF NOT EXISTS idx_mentorship_relationships_mentee_id ON mentorship_relationships(mentee_id);
CREATE INDEX IF NOT EXISTS idx_mentorship_relationships_status ON mentorship_relationships(status);

CREATE INDEX IF NOT EXISTS idx_messages_sender_id ON messages(sender_id);
CREATE INDEX IF NOT EXISTS idx_messages_receiver_id ON messages(receiver_id);
CREATE INDEX IF NOT EXISTS idx_messages_is_read ON messages(is_read);

CREATE INDEX IF NOT EXISTS idx_events_event_date ON events(event_date);
CREATE INDEX IF NOT EXISTS idx_events_organizer_id ON events(organizer_id);

CREATE INDEX IF NOT EXISTS idx_event_attendees_event_id ON event_attendees(event_id);
CREATE INDEX IF NOT EXISTS idx_event_attendees_user_id ON event_attendees(user_id);

CREATE INDEX IF NOT EXISTS idx_experience_user_id ON experience(user_id);
CREATE INDEX IF NOT EXISTS idx_experience_company_id ON experience(company_id);

CREATE INDEX IF NOT EXISTS idx_education_user_id ON education(user_id);

CREATE INDEX IF NOT EXISTS idx_user_skills_user_id ON user_skills(user_id);
CREATE INDEX IF NOT EXISTS idx_user_skills_skill_id ON user_skills(skill_id);

-- =================================================================
-- TRIGGERS FOR AUTOMATIC TIMESTAMP UPDATES
-- =================================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_companies_updated_at BEFORE UPDATE ON companies FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_job_postings_updated_at BEFORE UPDATE ON job_postings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_job_applications_updated_at BEFORE UPDATE ON job_applications FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_mentorship_relationships_updated_at BEFORE UPDATE ON mentorship_relationships FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =================================================================
-- SAMPLE QUERIES FOR DEMONSTRATION
-- =================================================================

-- Query 1: Find all alumni from a specific graduation year
-- SELECT u.first_name, u.last_name, u.email, c.name as company, e.title
-- FROM users u
-- LEFT JOIN companies c ON u.company_id = c.id
-- LEFT JOIN experience e ON u.id = e.user_id AND e.current = true
-- WHERE u.role = 'alumni' AND u.graduation_year = 2010
-- ORDER BY u.last_name;

-- Query 2: Find all job postings from companies that employ St. Augustine alumni
-- SELECT DISTINCT jp.title, jp.description, c.name as company, jp.location, jp.salary_range
-- FROM job_postings jp
-- JOIN companies c ON jp.company_id = c.id
-- WHERE c.id IN (
--     SELECT DISTINCT company_id 
--     FROM users 
--     WHERE company_id IS NOT NULL AND role = 'alumni'
-- )
-- AND jp.is_active = true
-- ORDER BY c.name, jp.title;

-- Query 3: Find mentorship relationships between alumni
-- SELECT 
--     m.first_name || ' ' || m.last_name as mentor_name,
--     me.first_name || ' ' || me.last_name as mentee_name,
--     mr.focus_areas,
--     mr.status
-- FROM mentorship_relationships mr
-- JOIN users m ON mr.mentor_id = m.id
-- JOIN users me ON mr.mentee_id = me.id
-- WHERE m.role = 'alumni' AND me.role = 'alumni'
-- ORDER BY mr.created_at DESC;

-- Query 4: Find all applications by alumni to jobs at companies with other alumni
-- SELECT 
--     u.first_name || ' ' || u.last_name as applicant_name,
--     u.graduation_year,
--     jp.title as job_title,
--     c.name as company,
--     ja.status,
--     ja.applied_at
-- FROM job_applications ja
-- JOIN job_postings jp ON ja.job_id = jp.id
-- JOIN companies c ON jp.company_id = c.id
-- JOIN users u ON ja.applicant_id = u.id
-- WHERE u.role = 'alumni'
-- AND c.id IN (
--     SELECT DISTINCT company_id 
--     FROM users 
--     WHERE company_id IS NOT NULL AND role = 'alumni'
-- )
-- ORDER BY ja.applied_at DESC;

-- Query 5: Find upcoming events and attendees
-- SELECT 
--     e.title,
--     e.description,
--     e.event_date,
--     e.location,
--     e.event_type,
--     COUNT(ea.user_id) as attendee_count
-- FROM events e
-- LEFT JOIN event_attendees ea ON e.id = ea.event_id
-- WHERE e.event_date > NOW()
-- GROUP BY e.id, e.title, e.description, e.event_date, e.location, e.event_type
-- ORDER BY e.event_date;

-- =================================================================
-- DEMO DATA SUMMARY
-- =================================================================

-- This script creates a comprehensive demo dataset for the Purple Knights at Work platform:
-- - 16 main alumni users with detailed profiles
-- - 5 employer users from major companies
-- - 3 dedicated mentor users
-- - 20 additional fake alumni users for realistic interactions
-- - 15 companies across various industries
-- - 24 skills in different categories
-- - 10 job postings with applications
-- - Multiple mentorship relationships
-- - Messages between users
-- - 5 events with attendees
-- - Complete education and experience records
-- - Proper relationships and constraints

-- Total users: 44 (16 main alumni + 5 employers + 3 mentors + 20 fake alumni)
-- Total companies: 15
-- Total job postings: 10
-- Total applications: 20
-- Total mentorship relationships: 16
-- Total messages: 18
-- Total events: 5
