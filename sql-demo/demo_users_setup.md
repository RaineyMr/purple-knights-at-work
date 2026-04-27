# Purple Knights at Work - Demo Users Setup

## 🎯 Demo Accounts as Authorized Users

These demo accounts will be the actual authorized users of the platform. They can login, create profiles, and use all features.

## 👥 Demo User Accounts

### **Alumni Accounts** (Password: `PurpleKnights2024`)

| Email | Name | Class Year | Role |
|-------|------|------------|------|
| marcus.thompson@purpleknights.work | Marcus Thompson | 2022 | Recent Graduate - Software Developer |
| samantha.rodriguez@purpleknights.work | Samantha Rodriguez | 2015 | Marketing Manager |
| robert.johnson@purpleknights.work | Robert Johnson | 2000 | CEO & Mentor |
| patricia.brown@purpleknights.work | Patricia Brown | 1998 | VP of Engineering |
| james.miller@purpleknights.work | James Miller | 1996 | Corporate Attorney |

### **Employer Accounts** (Password: `PurpleKnights2024`)

| Email | Company | Industry |
|-------|---------|---------|
| tech.innovations@purpleknights.work | Tech Innovations | Technology |
| gulf.marketing@purpleknights.work | Gulf Marketing Group | Marketing |
| financial.services@purpleknights.work | Financial Services LLC | Finance |
| healthcare.plus@purpleknights.work | Healthcare Plus | Healthcare |
| education.first@purpleknights.work | Education First | Education |

### **Admin Account** (Password: `PurpleKnights2024`)

| Email | Name | Role |
|-------|------|------|
| admin@purpleknights.work | Admin User | Platform Administrator |

## 🚀 Setup Steps

### **Step 1: Create Auth Users**
1. Go to Supabase Authentication → Users
2. Create all 11 accounts above with password `PurpleKnights2024`
3. Verify all users are created successfully

### **Step 2: Get User UUIDs**
Run this query to get the UUIDs:
```sql
SELECT id, email, created_at 
FROM auth.users 
WHERE email LIKE '%purpleknights.work'
ORDER BY created_at;
```

### **Step 3: Run Demo Data Script**
Use `simple_demo_setup.sql` and replace the 'UUID_HERE' placeholders with the actual UUIDs from Step 2.

### **Step 4: Test Login**
Test each account by logging into the application with:
- Email: [demo email]
- Password: PurpleKnights2024

## 🎭 Demo Scenarios

### **Recent Graduate Journey** (Marcus Thompson)
- Login: marcus.thompson@purpleknights.work
- Experience: Complete job search from application to hire
- Features: Profile completion, job matching, interviews, offers

### **Career Advancement** (Samantha Rodriguez)  
- Login: samantha.rodriguez@purpleknights.work
- Experience: Marketing professional seeking leadership role
- Features: Advanced profile, multiple applications, negotiation

### **Mentorship Leadership** (Robert Johnson)
- Login: robert.johnson@purpleknights.work
- Experience: CEO mentoring young entrepreneurs
- Features: Mentor dashboard, mentee management, guidance

### **Employer Hiring** (Tech Innovations)
- Login: tech.innovations@purpleknights.work
- Experience: Company actively recruiting Purple Knights
- Features: Job postings, candidate review, hiring process

### **Admin Overview** (Admin User)
- Login: admin@purpleknights.work
- Experience: Platform management and analytics
- Features: User management, platform metrics, oversight

## ✅ Success Indicators

After setup, you should be able to:
- ✅ Login with any demo account
- ✅ See complete 100% profiles
- ✅ Browse 5 comprehensive job postings
- ✅ Experience full application workflows
- ✅ View mentorship relationships
- ✅ Send and receive messages
- ✅ View notifications and milestones
- ✅ Access platform analytics (admin)

## 🎯 Presentation Ready

These demo accounts provide a complete, realistic showcase of the Purple Knights alumni platform with:
- Real user authentication
- Complete profile data
- Actual job search workflows
- Professional networking
- Mentorship relationships
- Employer interactions
- Admin management features

Perfect for demonstrating the platform to St. Augustine High School! 🏫💜💛
