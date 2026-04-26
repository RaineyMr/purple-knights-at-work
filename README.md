# Purple Knights at Work - St. Augustine Alumni Network

## 🚀 Alumni Career Platform for St. Augustine High School, New Orleans, LA

### ✅ Platform Overview

A comprehensive career networking platform exclusively for St. Augustine High School alumni that connects graduates with job opportunities, mentorship, and professional development resources.

### 🎯 Key Features

#### 1. **Alumni Profiles**
- Complete professional profile with resume, skills, and experience
- Graduation year and academic achievements
- Career journey tracking
- Skills endorsement from fellow alumni

#### 2. **Job Board & Matching**
- Alumni-exclusive job opportunities
- Intelligent matching based on skills, experience, and preferences
- Direct applications and employer outreach
- Career progression tracking

#### 3. **Mentorship Network**
- Senior alumni mentoring recent graduates
- Career guidance and professional development
- Industry-specific mentorship connections

#### 4. **Employer Partnerships**
- Companies seeking St. Augustine alumni talent
- Alumni-referred job opportunities
- Employer-alumni networking events

### 📁 Project Structure

```
purple-knights-at-work/
├── src/
│   ├── components/
│   │   ├── Auth/
│   │   │   ├── ProtectedRoute.js
│   │   │   └── Login.js, Signup.js, ForgotPassword.js
│   │   └── Layout/
│   │       ├── Layout.js (Main dashboard layout)
│   │       └── AuthLayout.js (Login/signup layout)
│   ├── contexts/
│   │   └── AuthContext.js
│   ├── hooks/
│   │   └── useAuth.js
│   ├── lib/
│   │   └── supabase.js (Database helpers)
│   └── pages/
│       ├── Auth/
│       │   ├── Login.js
│       │   ├── Signup.js
│       │   └── ForgotPassword.js
│       ├── Alumni/
│       │   ├── Dashboard.js
│       │   ├── Profile.js
│       │   ├── JobSearch.js
│       │   ├── JobDetails.js
│       │   ├── Applications.js
│       │   └── CareerProgress.js
│       ├── Employer/
│       │   ├── Profile.js
│       │   ├── PostJob.js
│       │   └── ViewCandidates.js
│       ├── Mentor/
│       │   ├── Dashboard.js
│       │   ├── Profile.js
│       │   └── MenteeManagement.js
│       └── Admin/
│           ├── Dashboard.js
│           ├── UserManagement.js
│           └── JobModeration.js
├── supabase/
│   └── functions/
│       └── calculate-matches/
│           └── index.js (Matching algorithm)
├── database_setup.sql (Complete database schema)
└── package.json (Dependencies and scripts)
```

### 🔧 Tech Stack

- **Frontend**: React.js + React Router + React Hook Form + Tailwind CSS
- **Backend**: Supabase (PostgreSQL + Auth + Storage + Edge Functions)
- **Authentication**: Supabase Auth with JWT tokens
- **Real-time**: Supabase real-time subscriptions
- **File Storage**: Supabase Storage for resumes, photos, logos
- **Deployment**: Ready for Vercel, Netlify, or any static host

### 🎨 Brand Colors (St. Augustine Purple & Gold)

- **Primary Purple**: #6B46C1
- **Secondary Gold**: #F59E0B
- **Accent Purple**: #9333EA
- **Light Gold**: #FEF3C7

### 🚀 Getting Started

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Set Environment Variables**
   Create `.env` file:
   ```
   REACT_APP_SUPABASE_URL=your_supabase_url
   REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

3. **Run Development Server**
   ```bash
   npm start
   ```

4. **Visit Application**
   Open `http://localhost:3000`

### 📱 User Roles

#### Alumni Members
- Create comprehensive professional profile
- Search and apply for jobs
- Connect with mentors
- Track career progression

#### Employers
- Post job opportunities
- View matched alumni candidates
- Manage hiring pipeline
- Connect with St. Augustine talent

#### Mentors
- Guide recent graduates
- Share career expertise
- Track mentee progress
- Build professional network

#### Administrators
- Manage platform users
- Moderate job postings
- Facilitate mentor-mentee matching
- View platform analytics

### 🔐 Security Features

- Row-level security (RLS) policies
- JWT-based authentication
- Input validation and sanitization
- Alumni verification system
- Privacy controls for profile visibility

### 📊 Analytics & Insights

- Alumni career outcomes tracking
- Job placement statistics
- Mentorship program metrics
- Industry distribution analytics
- Salary progression data

### 🎯 Success Metrics

- Alumni engagement rate
- Job placement success
- Mentorship connections formed
- Employer satisfaction
- Career progression tracking

---

**🎉 Your Purple Knights at Work Network is ready for development!**

This platform will help St. Augustine High School alumni connect, grow professionally, and give back to the alumni community through mentorship and opportunities.

**Built with pride for the Purple Knights! 🏫💜💛**
