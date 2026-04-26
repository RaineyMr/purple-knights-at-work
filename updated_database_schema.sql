-- Purple Knights at Work - Updated Database Schema
-- Jobs linked to company profiles with user affiliations

-- ===================================================================
-- PROFILES TABLE (Unified User System)
-- Everyone is a user, no special privileges except admin
-- ===================================================================

-- Drop existing tables if they exist
DROP TABLE IF EXISTS platform_metrics CASCADE;
DROP TABLE IF EXISTS notifications CASCADE;
DROP TABLE IF EXISTS career_milestones CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS mentorship_records CASCADE;
DROP TABLE IF EXISTS hiring_records CASCADE;
DROP TABLE IF EXISTS offer_records CASCADE;
DROP TABLE IF EXISTS interview_records CASCADE;
DROP TABLE IF EXISTS applications CASCADE;
DROP TABLE IF EXISTS job_postings CASCADE;
DROP TABLE IF EXISTS alumni_preferences CASCADE;
DROP TABLE IF EXISTS alumni_education CASCADE;
DROP TABLE IF EXISTS alumni_experience CASCADE;
DROP TABLE IF EXISTS alumni_skills CASCADE;
DROP TABLE IF EXISTS job_requirements CASCADE;
DROP TABLE IF EXISTS company_affiliations CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;

-- Profiles table - unified user system
CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('alumni', 'admin')),
    headline TEXT,
    bio TEXT,
    graduation_year INTEGER,
    verified_alumni BOOLEAN DEFAULT false,
    phone TEXT,
    linkedin_url TEXT,
    portfolio_url TEXT,
    resume_url TEXT,
    allow_employer_contact BOOLEAN DEFAULT true,
    academic_achievements TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- COMPANY PROFILES TABLE
-- Company profiles separate from user profiles
-- ===================================================================

CREATE TABLE company_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    industry TEXT,
    company_size TEXT,
    website TEXT,
    logo_url TEXT,
    location TEXT,
    description TEXT,
    founded_year INTEGER,
    linkedin_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- COMPANY AFFILIATIONS TABLE
-- Links users to companies as employees
-- ===================================================================

CREATE TABLE company_affiliations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    company_id UUID NOT NULL REFERENCES company_profiles(id) ON DELETE CASCADE,
    position TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    current_position BOOLEAN DEFAULT true,
    can_post_jobs BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id, company_id, current_position)
);

-- ===================================================================
-- JOB POSTINGS TABLE
-- Jobs are linked to company profiles, not users directly
-- ===================================================================

CREATE TABLE job_postings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL REFERENCES company_profiles(id) ON DELETE CASCADE,
    posted_by_user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    job_type TEXT NOT NULL CHECK (job_type IN ('full_time', 'part_time', 'contract', 'internship', 'freelance')),
    industry TEXT,
    location TEXT NOT NULL,
    remote_option TEXT CHECK (remote_option IN ('on_site', 'hybrid', 'fully_remote')),
    salary_min INTEGER,
    salary_max INTEGER,
    salary_currency TEXT DEFAULT 'USD',
    required_skills TEXT[],
    preferred_skills TEXT[],
    experience_level TEXT CHECK (experience_level IN ('entry_level', 'mid_level', 'senior_level', 'executive')),
    alumni_preferred BOOLEAN DEFAULT false,
    status TEXT CHECK (status IN ('draft', 'open', 'closed', 'filled')) DEFAULT 'open',
    posted_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    deadline TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- ALUMNI SKILLS TABLE
-- ===================================================================

CREATE TABLE alumni_skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    skill_name TEXT NOT NULL,
    category TEXT CHECK (category IN ('technical', 'soft_skills', 'industry')),
    proficiency_level TEXT CHECK (proficiency_level IN ('beginner', 'intermediate', 'advanced', 'expert')),
    endorsement_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- ALUMNI EXPERIENCE TABLE
-- ===================================================================

CREATE TABLE alumni_experience (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    company_name TEXT NOT NULL,
    position TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    current_position BOOLEAN DEFAULT false,
    description TEXT,
    location TEXT,
    industry TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- ALUMNI EDUCATION TABLE
-- ===================================================================

CREATE TABLE alumni_education (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    institution_name TEXT NOT NULL,
    degree TEXT NOT NULL,
    field_of_study TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    current_student BOOLEAN DEFAULT false,
    gpa DECIMAL(3,2),
    activities TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- ALUMNI PREFERENCES TABLE
-- ===================================================================

CREATE TABLE alumni_preferences (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    salary_min INTEGER,
    salary_max INTEGER,
    salary_currency TEXT DEFAULT 'USD',
    remote_preference TEXT CHECK (remote_preference IN ('on_site', 'hybrid', 'fully_remote', 'flexible')),
    preferred_locations TEXT[],
    willing_to_relocate BOOLEAN DEFAULT false,
    job_types_interested TEXT[],
    industries_interested TEXT[],
    career_level TEXT CHECK (career_level IN ('entry_level', 'mid_level', 'senior_level', 'executive')),
    company_preferences TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- APPLICATIONS TABLE
-- ===================================================================

CREATE TABLE applications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    job_id UUID NOT NULL REFERENCES job_postings(id) ON DELETE CASCADE,
    profile_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    employer_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    application_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    application_type TEXT CHECK (application_type IN ('direct_apply', 'system_match', 'referral')),
    status TEXT CHECK (status IN ('applied', 'reviewing', 'interviewing', 'offer_extended', 'rejected', 'withdrawn', 'hired')) DEFAULT 'applied',
    cover_note TEXT,
    resume_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- INTERVIEW RECORDS TABLE
-- ===================================================================

CREATE TABLE interview_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_id UUID NOT NULL REFERENCES applications(id) ON DELETE CASCADE,
    interview_date TIMESTAMP WITH TIME ZONE NOT NULL,
    interview_type TEXT CHECK (interview_type IN ('phone', 'video', 'in_person', 'technical', 'behavioral')),
    interviewer_name TEXT,
    notes TEXT,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- OFFER RECORDS TABLE
-- ===================================================================

CREATE TABLE offer_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_id UUID NOT NULL REFERENCES applications(id) ON DELETE CASCADE,
    salary_offered INTEGER NOT NULL,
    salary_currency TEXT DEFAULT 'USD',
    position_title TEXT NOT NULL,
    start_date DATE,
    offer_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status TEXT CHECK (status IN ('extended', 'accepted', 'rejected', 'expired', 'withdrawn')) DEFAULT 'extended',
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- HIRING RECORDS TABLE
-- ===================================================================

CREATE TABLE hiring_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    offer_id UUID NOT NULL REFERENCES offer_records(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    feedback_score INTEGER CHECK (feedback_score >= 1 AND feedback_score <= 5),
    feedback_text TEXT,
    alumni_rating INTEGER CHECK (alumni_rating >= 1 AND feedback_score <= 5),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- MENTORSHIP RECORDS TABLE
-- ===================================================================

CREATE TABLE mentorship_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mentor_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    mentee_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    matched_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status TEXT CHECK (status IN ('pending', 'active', 'paused', 'completed', 'ended')) DEFAULT 'pending',
    focus_areas TEXT[],
    meeting_notes JSONB,
    progress_rating INTEGER CHECK (progress_rating >= 1 AND progress_rating <= 5),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- MESSAGES TABLE
-- ===================================================================

CREATE TABLE messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    from_user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    to_user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    context TEXT CHECK (context IN ('direct', 'job_application', 'mentorship', 'company', 'general')),
    context_id UUID,
    subject TEXT NOT NULL,
    body TEXT NOT NULL,
    sent_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    read_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- CAREER MILESTONES TABLE
-- ===================================================================

CREATE TABLE career_milestones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    milestone_type TEXT CHECK (milestone_type IN ('profile_completed', 'first_match', 'first_application', 'first_interview', 'first_offer', 'first_hire', 'skill_endorsed', 'mentor_matched', 'mentorship_completed', 'promotion', 'certification', 'achievement')),
    details JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- NOTIFICATIONS TABLE
-- ===================================================================

CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    type TEXT CHECK (type IN ('job_match', 'application_update', 'interview_request', 'offer_received', 'message', 'mentor_request', 'mentorship_update', 'system', 'profile_view', 'endorsement', 'milestone')),
    metadata JSONB,
    read BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- PLATFORM METRICS TABLE
-- ===================================================================

CREATE TABLE platform_metrics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    metric_name TEXT NOT NULL,
    metric_value NUMERIC NOT NULL,
    metric_date DATE NOT NULL,
    breakdown JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================================
-- INDEXES FOR PERFORMANCE
-- ===================================================================

-- Profiles indexes
CREATE INDEX idx_profiles_role ON profiles(role);
CREATE INDEX idx_profiles_graduation_year ON profiles(graduation_year);
CREATE INDEX idx_profiles_verified_alumni ON profiles(verified_alumni);

-- Company profiles indexes
CREATE INDEX idx_company_profiles_industry ON company_profiles(industry);
CREATE INDEX idx_company_profiles_location ON company_profiles(location);

-- Company affiliations indexes
CREATE INDEX idx_company_affiliations_user_id ON company_affiliations(user_id);
CREATE INDEX idx_company_affiliations_company_id ON company_affiliations(company_id);
CREATE INDEX idx_company_affiliations_current ON company_affiliations(current_position);
CREATE INDEX idx_company_affiliations_can_post_jobs ON company_affiliations(can_post_jobs);

-- Job postings indexes
CREATE INDEX idx_job_postings_company_id ON job_postings(company_id);
CREATE INDEX idx_job_postings_posted_by ON job_postings(posted_by_user_id);
CREATE INDEX idx_job_postings_status ON job_postings(status);
CREATE INDEX idx_job_postings_industry ON job_postings(industry);
CREATE INDEX idx_job_postings_location ON job_postings(location);
CREATE INDEX idx_job_postings_alumni_preferred ON job_postings(alumni_preferred);

-- Applications indexes
CREATE INDEX idx_applications_job_id ON applications(job_id);
CREATE INDEX idx_applications_profile_id ON applications(profile_id);
CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_applications_application_date ON applications(application_date);

-- Mentorship indexes
CREATE INDEX idx_mentorship_mentor_id ON mentorship_records(mentor_id);
CREATE INDEX idx_mentorship_mentee_id ON mentorship_records(mentee_id);
CREATE INDEX idx_mentorship_status ON mentorship_records(status);

-- Messages indexes
CREATE INDEX idx_messages_from_user ON messages(from_user_id);
CREATE INDEX idx_messages_to_user ON messages(to_user_id);
CREATE INDEX idx_messages_context ON messages(context, context_id);
CREATE INDEX idx_messages_sent_at ON messages(sent_at);

-- Notifications indexes
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_type ON notifications(type);
CREATE INDEX idx_notifications_read ON notifications(read);

-- Platform metrics indexes
CREATE INDEX idx_platform_metrics_date ON platform_metrics(metric_date);
CREATE INDEX idx_platform_metrics_name ON platform_metrics(metric_name);

-- ===================================================================
-- RLS (Row Level Security) POLICIES
-- ===================================================================

-- Enable RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE company_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE company_affiliations ENABLE ROW LEVEL SECURITY;
ALTER TABLE job_postings ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_experience ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_education ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_preferences ENABLE ROW LEVEL SECURITY;
ALTER TABLE applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE interview_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE offer_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE hiring_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE mentorship_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE career_milestones ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE platform_metrics ENABLE ROW LEVEL SECURITY;

-- Profiles RLS policies
CREATE POLICY "Users can view all profiles" ON profiles FOR SELECT USING (true);
CREATE POLICY "Users can update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile" ON profiles FOR INSERT WITH CHECK (auth.uid() = id);
CREATE POLICY "Admin can manage all profiles" ON profiles FOR ALL USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
);

-- Company profiles RLS policies
CREATE POLICY "Everyone can view company profiles" ON company_profiles FOR SELECT USING (true);
CREATE POLICY "Authenticated users can create company profiles" ON company_profiles FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Company profile owners can update" ON company_profiles FOR UPDATE USING (
    EXISTS (
        SELECT 1 FROM company_affiliations ca 
        WHERE ca.company_id = company_profiles.id 
        AND ca.user_id = auth.uid() 
        AND ca.can_post_jobs = true
    )
);

-- Company affiliations RLS policies
CREATE POLICY "Users can view all affiliations" ON company_affiliations FOR SELECT USING (true);
CREATE POLICY "Users can manage own affiliations" ON company_affiliations FOR ALL USING (user_id = auth.uid());

-- Job postings RLS policies
CREATE POLICY "Everyone can view job postings" ON job_postings FOR SELECT USING (status = 'open');
CREATE POLICY "Company employees can post jobs" ON job_postings FOR ALL USING (
    EXISTS (
        SELECT 1 FROM company_affiliations ca 
        WHERE ca.company_id = job_postings.company_id 
        AND ca.user_id = auth.uid() 
        AND ca.can_post_jobs = true
    )
);

-- Alumni skills RLS policies
CREATE POLICY "Users can view all skills" ON alumni_skills FOR SELECT USING (true);
CREATE POLICY "Users can manage own skills" ON alumni_skills FOR ALL USING (profile_id = auth.uid());

-- Applications RLS policies
CREATE POLICY "Users can view own applications" ON applications FOR SELECT USING (profile_id = auth.uid());
CREATE POLICY "Users can manage own applications" ON applications FOR ALL USING (profile_id = auth.uid());
CREATE POLICY "Employers can view applications to their jobs" ON applications FOR SELECT USING (
    EXISTS (
        SELECT 1 FROM job_postings jp 
        WHERE jp.id = applications.job_id 
        AND EXISTS (
            SELECT 1 FROM company_affiliations ca 
            WHERE ca.company_id = jp.company_id 
            AND ca.user_id = auth.uid()
        )
    )
);

-- Mentorship RLS policies
CREATE POLICY "Users can view own mentorships" ON mentorship_records FOR SELECT USING (mentor_id = auth.uid() OR mentee_id = auth.uid());
CREATE POLICY "Users can manage own mentorships" ON mentorship_records FOR ALL USING (mentor_id = auth.uid() OR mentee_id = auth.uid());

-- Messages RLS policies
CREATE POLICY "Users can view own messages" ON messages FOR SELECT USING (from_user_id = auth.uid() OR to_user_id = auth.uid());
CREATE POLICY "Users can send messages" ON messages FOR INSERT WITH CHECK (from_user_id = auth.uid());
CREATE POLICY "Users can mark messages as read" ON messages FOR UPDATE USING (to_user_id = auth.uid());

-- Notifications RLS policies
CREATE POLICY "Users can view own notifications" ON notifications FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "Users can update own notifications" ON notifications FOR UPDATE USING (user_id = auth.uid());

-- Platform metrics RLS policies
CREATE POLICY "Everyone can view platform metrics" ON platform_metrics FOR SELECT USING (true);
CREATE POLICY "Admin can manage platform metrics" ON platform_metrics FOR ALL USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
);

-- ===================================================================
-- TRIGGERS AND FUNCTIONS
-- ===================================================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply updated_at trigger to all relevant tables
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_company_profiles_updated_at BEFORE UPDATE ON company_profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_company_affiliations_updated_at BEFORE UPDATE ON company_affiliations FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_job_postings_updated_at BEFORE UPDATE ON job_postings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alumni_skills_updated_at BEFORE UPDATE ON alumni_skills FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alumni_experience_updated_at BEFORE UPDATE ON alumni_experience FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alumni_education_updated_at BEFORE UPDATE ON alumni_education FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_alumni_preferences_updated_at BEFORE UPDATE ON alumni_preferences FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_applications_updated_at BEFORE UPDATE ON applications FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_interview_records_updated_at BEFORE UPDATE ON interview_records FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_offer_records_updated_at BEFORE UPDATE ON offer_records FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_hiring_records_updated_at BEFORE UPDATE ON hiring_records FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_mentorship_records_updated_at BEFORE UPDATE ON mentorship_records FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_messages_updated_at BEFORE UPDATE ON messages FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_career_milestones_updated_at BEFORE UPDATE ON career_milestones FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_notifications_updated_at BEFORE UPDATE ON notifications FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_platform_metrics_updated_at BEFORE UPDATE ON platform_metrics FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
