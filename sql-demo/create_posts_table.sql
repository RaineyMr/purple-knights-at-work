-- Create posts table for the social feed
CREATE TABLE IF NOT EXISTS posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  content TEXT,
  file_url TEXT,
  job_id UUID REFERENCES job_postings(id) ON DELETE SET NULL,
  post_type TEXT DEFAULT 'text', -- 'text', 'job_share', 'image', 'announcement'
  likes INTEGER DEFAULT 0,
  comments INTEGER DEFAULT 0,
  shares INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_posts_user_id ON posts(user_id);
CREATE INDEX IF NOT EXISTS idx_posts_created_at ON posts(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_posts_job_id ON posts(job_id);

-- Enable Row Level Security
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- RLS Policies for Posts
CREATE POLICY "Users can view all posts" ON posts
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles 
      WHERE id = auth.uid() AND (verified_alumni = true OR role = 'admin')
    )
  );

CREATE POLICY "Users can create posts" ON posts
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own posts" ON posts
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own posts" ON posts
  FOR DELETE USING (auth.uid() = user_id);

-- Create trigger for updated_at
CREATE TRIGGER update_posts_updated_at BEFORE UPDATE ON posts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert some sample posts for testing
INSERT INTO posts (user_id, content, post_type, likes, comments) VALUES
-- Get actual user IDs from profiles table for these inserts
((SELECT id FROM profiles LIMIT 1), 'Excited to announce that I just accepted a new position as Senior Software Engineer at Microsoft! 🚀 Purple Knights network helped me connect with amazing alumni. #PurpleKnights #CareerGrowth', 'text', 15, 8),
((SELECT id FROM profiles LIMIT 1 OFFSET 1), 'Looking for software engineering interns for Summer 2024! If you know any talented Purple Knights studying CS, send them my way. We have great opportunities at our fintech startup!', 'text', 12, 5),
((SELECT id FROM profiles LIMIT 1 OFFSET 2), 'Just completed my first marathon! 🏃‍♂️ The discipline from St. Augustine sports programs really prepared me for this challenge. Never stop pushing your limits!', 'text', 28, 12),
((SELECT id FROM profiles LIMIT 1 OFFSET 3), 'Quick tip for job seekers: Your network is your net worth! I landed my dream job through a Purple Knights connection. Always nurture those relationships!', 'text', 45, 18),
((SELECT id FROM profiles LIMIT 1 OFFSET 4), 'Anyone else attending the tech conference next month? Would love to connect with fellow Purple Knights in the industry!', 'text', 8, 3);
