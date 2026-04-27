-- Purple Knights at Work - St. Augustine Alumni Network Database Schema
-- Run this in Supabase SQL Editor

-- Profiles (extends auth.users)
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id),
  first_name TEXT,
  last_name TEXT,
  role TEXT, -- 'alumni', 'employer', 'mentor', 'admin'
  headline TEXT,
  bio TEXT,
  profile_photo_url TEXT,
  resume_url TEXT,
  graduation_year INTEGER, -- St. Augustine graduation year
  academic_achievements TEXT[], -- array of achievements
  phone TEXT,
  linkedin_url TEXT,
  portfolio_url TEXT,
  company_name TEXT, -- for employers
  industry TEXT, -- for employers
  company_size TEXT, -- for employers
  website TEXT, -- for employers
  logo_url TEXT, -- for employers
  location TEXT, -- for employers
  allow_employer_contact BOOLEAN DEFAULT true,
  verified_alumni BOOLEAN DEFAULT false, -- Admin verification
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Skills
CREATE TABLE alumni_skills (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  skill_name TEXT NOT NULL,
  category TEXT, -- 'technical', 'soft_skills', 'industry', 'language', 'certification'
  proficiency_level TEXT, -- 'beginner', 'intermediate', 'advanced', 'expert'
  endorsement_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Job Preferences
CREATE TABLE alumni_preferences (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  salary_min INTEGER,
  salary_max INTEGER,
  salary_currency TEXT DEFAULT 'USD',
  remote_preference TEXT, -- 'fully_remote', 'hybrid', 'on_site'
  preferred_locations TEXT[], -- array
  willing_to_relocate BOOLEAN,
  job_types_interested TEXT[], -- 'full_time', 'part_time', 'contract', 'freelance', 'internship'
  industries_interested TEXT[],
  company_preferences TEXT[],
  career_level TEXT, -- 'entry_level', 'mid_level', 'senior_level', 'executive'
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Experience
CREATE TABLE alumni_experience (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  company_name TEXT NOT NULL,
  position TEXT NOT NULL,
  start_date DATE,
  end_date DATE,
  current_position BOOLEAN DEFAULT false,
  description TEXT,
  location TEXT,
  industry TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Education (beyond St. Augustine)
CREATE TABLE alumni_education (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  institution_name TEXT NOT NULL,
  degree TEXT,
  field_of_study TEXT,
  start_date DATE,
  end_date DATE,
  current_student BOOLEAN DEFAULT false,
  gpa DECIMAL(3,2),
  activities TEXT[],
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Job Postings
CREATE TABLE job_postings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  employer_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  job_type TEXT, -- 'full_time', 'part_time', 'contract', 'freelance', 'internship'
  industry TEXT,
  location TEXT,
  remote_option TEXT, -- 'on_site', 'hybrid', 'fully_remote'
  salary_min INTEGER,
  salary_max INTEGER,
  salary_currency TEXT DEFAULT 'USD',
  required_skills TEXT[],
  preferred_skills TEXT[],
  experience_level TEXT, -- 'entry_level', 'mid_level', 'senior_level', 'executive'
  posted_date TIMESTAMPTZ DEFAULT NOW(),
  deadline DATE,
  status TEXT DEFAULT 'open', -- 'open', 'filled', 'closed'
  match_score_threshold INTEGER DEFAULT 60,
  alumni_preferred BOOLEAN DEFAULT false, -- Preference for St. Augustine alumni
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Job Requirements
CREATE TABLE job_requirements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id UUID REFERENCES job_postings(id) ON DELETE CASCADE,
  skill_name TEXT NOT NULL,
  required BOOLEAN DEFAULT true,
  proficiency_level TEXT,
  years_experience INTEGER
);

-- Matches
CREATE TABLE matches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id UUID REFERENCES job_postings(id) ON DELETE CASCADE,
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  match_score INTEGER CHECK (match_score >= 0 AND match_score <= 100),
  match_breakdown JSONB, -- Detailed scoring breakdown
  match_reason TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  status TEXT DEFAULT 'potential', -- 'potential', 'shown', 'applied', 'rejected', 'hired'
  UNIQUE(job_id, profile_id)
);

-- Applications
CREATE TABLE applications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id UUID REFERENCES job_postings(id) ON DELETE CASCADE,
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  employer_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  application_date TIMESTAMPTZ DEFAULT NOW(),
  application_type TEXT, -- 'direct_apply', 'employer_request', 'system_match'
  status TEXT DEFAULT 'applied', -- 'applied', 'reviewing', 'interviewing', 'offer_extended', 'hired', 'rejected'
  cover_note TEXT,
  resume_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Interview Records
CREATE TABLE interview_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  application_id UUID REFERENCES applications(id) ON DELETE CASCADE,
  interview_date TIMESTAMPTZ,
  interview_type TEXT, -- 'phone', 'video', 'in_person'
  interviewer_name TEXT,
  notes TEXT,
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Offer Records
CREATE TABLE offer_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  application_id UUID REFERENCES applications(id) ON DELETE CASCADE,
  salary_offered INTEGER,
  salary_currency TEXT DEFAULT 'USD',
  position_title TEXT,
  start_date DATE,
  offer_date TIMESTAMPTZ DEFAULT NOW(),
  status TEXT DEFAULT 'pending', -- 'pending', 'accepted', 'declined', 'expired'
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Hiring Records
CREATE TABLE hiring_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  offer_id UUID REFERENCES offer_records(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE,
  feedback_score INTEGER CHECK (feedback_score >= 1 AND feedback_score <= 5),
  feedback_text TEXT,
  alumni_rating INTEGER CHECK (alumni_rating >= 1 AND alumni_rating <= 5),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Mentorship Records
CREATE TABLE mentorship_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  mentor_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  mentee_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  matched_date TIMESTAMPTZ DEFAULT NOW(),
  status TEXT DEFAULT 'active', -- 'active', 'completed', 'paused'
  focus_areas TEXT[], -- 'career_planning', 'skill_development', 'interview_prep', 'networking', 'industry_guidance'
  meeting_notes JSONB,
  progress_rating INTEGER CHECK (progress_rating >= 1 AND progress_rating <= 5),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(mentor_id, mentee_id)
);

-- Messages
CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  from_user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  to_user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  context TEXT, -- 'job_application', 'mentorship', 'inquiry', 'networking'
  context_id UUID, -- Reference to job, mentorship, etc.
  subject TEXT,
  body TEXT NOT NULL,
  sent_at TIMESTAMPTZ DEFAULT NOW(),
  read_at TIMESTAMPTZ,
  channel TEXT DEFAULT 'in_app', -- 'in_app', 'email'
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Skill Endorsements
CREATE TABLE skill_endorsements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  skill_id UUID REFERENCES alumni_skills(id) ON DELETE CASCADE,
  endorser_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  endorsement_text TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(skill_id, endorser_id)
);

-- Career Journey Milestones
CREATE TABLE career_milestones (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  milestone_type TEXT, -- 'profile_completed', 'first_match', 'first_application', 'first_interview', 'first_offer', 'first_hire', 'skill_endorsed', 'mentor_matched', 'promotion'
  milestone_date TIMESTAMPTZ DEFAULT NOW(),
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Analytics Events
CREATE TABLE analytics_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  event_type TEXT, -- 'profile_view', 'job_search', 'application', 'message', 'login', 'mentor_match'
  entity_type TEXT, -- 'job', 'profile', 'mentor', 'company'
  entity_id UUID,
  metadata JSONB,
  timestamp TIMESTAMPTZ DEFAULT NOW()
);

-- Platform Metrics
CREATE TABLE platform_metrics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  metric_name TEXT NOT NULL,
  metric_value NUMERIC,
  metric_date DATE,
  breakdown JSONB, -- By role, industry, graduation year, etc.
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Notifications
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  type TEXT, -- 'job_match', 'application_update', 'message', 'mentor_request', 'system'
  read BOOLEAN DEFAULT false,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Alumni Verification Requests
CREATE TABLE verification_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  graduation_year INTEGER,
  verification_method TEXT, -- 'yearbook', 'transcript', 'alumni_card', 'reference'
  verification_document_url TEXT,
  reference_name TEXT, -- Alumni reference
  reference_email TEXT,
  status TEXT DEFAULT 'pending', -- 'pending', 'approved', 'rejected'
  reviewed_by UUID REFERENCES profiles(id),
  review_notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for performance
CREATE INDEX idx_profiles_role ON profiles(role);
CREATE INDEX idx_profiles_graduation_year ON profiles(graduation_year);
CREATE INDEX idx_alumni_skills_profile_id ON alumni_skills(profile_id);
CREATE INDEX idx_alumni_skills_skill_name ON alumni_skills(skill_name);
CREATE INDEX idx_job_postings_status ON job_postings(status);
CREATE INDEX idx_job_postings_industry ON job_postings(industry);
CREATE INDEX idx_matches_job_id ON matches(job_id);
CREATE INDEX idx_matches_profile_id ON matches(profile_id);
CREATE INDEX idx_matches_score ON matches(match_score DESC);
CREATE INDEX idx_applications_profile_id ON applications(profile_id);
CREATE INDEX idx_applications_job_id ON applications(job_id);
CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_messages_from_user ON messages(from_user_id);
CREATE INDEX idx_messages_to_user ON messages(to_user_id);
CREATE INDEX idx_analytics_events_user_id ON analytics_events(user_id);
CREATE INDEX idx_analytics_events_timestamp ON analytics_events(timestamp);

-- Enable Row Level Security (RLS)
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_preferences ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_experience ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumni_education ENABLE ROW LEVEL SECURITY;
ALTER TABLE job_postings ENABLE ROW LEVEL SECURITY;
ALTER TABLE matches ENABLE ROW LEVEL SECURITY;
ALTER TABLE applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE interview_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE offer_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE hiring_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE mentorship_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE skill_endorsements ENABLE ROW LEVEL SECURITY;
ALTER TABLE career_milestones ENABLE ROW LEVEL SECURITY;
ALTER TABLE analytics_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE verification_requests ENABLE ROW LEVEL SECURITY;

-- RLS Policies for Profiles
CREATE POLICY "Users can view their own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update their own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert their own profile" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Admins can view all profiles" ON profiles
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles 
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

CREATE POLICY "Verified alumni can view basic info of other alumni" ON profiles
  FOR SELECT USING (
    role = 'alumni' AND 
    verified_alumni = true AND
    EXISTS (
      SELECT 1 FROM profiles 
      WHERE id = auth.uid() AND verified_alumni = true
    )
  );

-- RLS Policies for Alumni Skills
CREATE POLICY "Users can manage their own skills" ON alumni_skills
  FOR ALL USING (profile_id = auth.uid());

CREATE POLICY "Verified alumni can view skills of other alumni" ON alumni_skills
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles p
      WHERE p.id = profile_id AND p.verified_alumni = true
      AND EXISTS (
        SELECT 1 FROM profiles 
        WHERE id = auth.uid() AND verified_alumni = true
      )
    )
  );

-- RLS Policies for Job Postings
CREATE POLICY "Employers can manage their own job postings" ON job_postings
  FOR ALL USING (employer_id = auth.uid());

CREATE POLICY "Verified alumni can view open job postings" ON job_postings
  FOR SELECT USING (
    status = 'open' AND
    EXISTS (
      SELECT 1 FROM profiles 
      WHERE id = auth.uid() AND verified_alumni = true
    )
  );

CREATE POLICY "Admins can view all job postings" ON job_postings
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles 
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- RLS Policies for Applications
CREATE POLICY "Alumni can view their own applications" ON applications
  FOR SELECT USING (profile_id = auth.uid());

CREATE POLICY "Employers can view applications for their jobs" ON applications
  FOR SELECT USING (employer_id = auth.uid());

CREATE POLICY "Alumni can create applications" ON applications
  FOR INSERT WITH CHECK (profile_id = auth.uid());

CREATE POLICY "Employers can update application status" ON applications
  FOR UPDATE USING (employer_id = auth.uid());

-- RLS Policies for Messages
CREATE POLICY "Users can view their own messages" ON messages
  FOR SELECT USING (from_user_id = auth.uid() OR to_user_id = auth.uid());

CREATE POLICY "Users can send messages" ON messages
  FOR INSERT WITH CHECK (from_user_id = auth.uid());

-- RLS Policies for Mentorship Records
CREATE POLICY "Mentors can view their mentorships" ON mentorship_records
  FOR SELECT USING (mentor_id = auth.uid());

CREATE POLICY "Mentees can view their mentorships" ON mentorship_records
  FOR SELECT USING (mentee_id = auth.uid());

CREATE POLICY "Admins can view all mentorships" ON mentorship_records
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles 
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_alumni_preferences_updated_at BEFORE UPDATE ON alumni_preferences
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_job_postings_updated_at BEFORE UPDATE ON job_postings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_applications_updated_at BEFORE UPDATE ON applications
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_mentorship_records_updated_at BEFORE UPDATE ON mentorship_records
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_verification_requests_updated_at BEFORE UPDATE ON verification_requests
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
