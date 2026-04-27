# Creating Demo Users for Purple Knights at Work

## Step 1: Create Auth Users in Supabase

Go to your Supabase project → Authentication → Users and create these users manually:

### Alumni Accounts
| Email | Password | Name | Graduation Year |
|-------|----------|------|----------------|
| marcus.thompson@purpleknights.work | PurpleKnights2024 | Marcus Thompson | 2022 |
| jasmine.washington@purpleknights.work | PurpleKnights2024 | Jasmine Washington | 2021 |
| andre.broussard@purpleknights.work | PurpleKnights2024 | Andre Broussard | 2023 |
| david.chen@purpleknights.work | PurpleKnights2024 | David Chen | 2014 |
| samantha.rodriguez@purpleknights.work | PurpleKnights2024 | Samantha Rodriguez | 2015 |
| michael.williams@purpleknights.work | PurpleKnights2024 | Michael Williams | 2012 |
| robert.johnson@purpleknights.work | PurpleKnights2024 | Robert Johnson | 2005 |
| patricia.brown@purpleknights.work | PurpleKnights2024 | Patricia Brown | 2000 |
| james.miller@purpleknights.work | PurpleKnights2024 | James Miller | 1998 |

### Employer Accounts
| Email | Password | Company |
|-------|----------|---------|
| tech.innovations@purpleknights.work | PurpleKnights2024 | Tech Innovations |
| gulf.marketing@purpleknights.work | PurpleKnights2024 | Gulf Marketing Group |
| financial.services@purpleknights.work | PurpleKnights2024 | Financial Services LLC |

### Mentor Account
| Email | Password | Name |
|-------|----------|------|
| thomas.anderson@purpleknights.work | PurpleKnights2024 | Thomas Anderson |

### Admin Account
| Email | Password | Name |
|-------|----------|------|
| admin@purpleknights.work | PurpleKnights2024 | Admin User |

## Step 2: Get User IDs

After creating the users, copy their UUIDs from the Supabase Authentication table. You'll need these IDs for the demo_data.sql script.

## Step 3: Update Demo Data Script

Replace the placeholder IDs in demo_data.sql with the actual user IDs:

```sql
-- Replace these with actual user IDs from your Supabase Auth table
UPDATE profiles SET id = 'ACTUAL_USER_ID_HERE' WHERE first_name = 'Marcus' AND last_name = 'Thompson';
-- ... repeat for all users
```

## Step 4: Run Demo Data Script

1. Go to Supabase SQL Editor
2. Copy and paste the updated demo_data.sql
3. Execute the script

## Demo Login Credentials

Once set up, you can test the platform with these accounts:

### Recent Graduate (Marcus Thompson)
- Email: marcus.thompson@purpleknights.work
- Password: PurpleKnights2024
- Role: Alumni, Class of 2022
- Has applications and mentorship connections

### Experienced Alumni (David Chen)
- Email: david.chen@purpleknights.work  
- Password: PurpleKnights2024
- Role: Alumni, Class of 2014
- Senior software engineer with experience

### Mentor (Robert Johnson)
- Email: robert.johnson@purpleknights.work
- Password: PurpleKnights2024
- Role: Alumni/Mentor, Class of 2005
- CEO with mentorship relationships

### Employer (Tech Innovations)
- Email: tech.innovations@purpleknights.work
- Password: PurpleKnights2024
- Role: Employer
- Has 3 active job postings

### Admin
- Email: admin@purpleknights.work
- Password: PurpleKnights2024
- Role: Administrator
- Full platform access

## Demo Features to Test

1. **Alumni Dashboard**: View stats, recent activity, job matches
2. **Job Search**: Browse and filter job postings
3. **Applications**: Apply to jobs and track status
4. **Mentorship**: View mentor relationships and messages
5. **Employer Dashboard**: Post jobs and view candidates
6. **Admin Panel**: Manage users and verify alumni

The demo data creates a realistic alumni network with:
- 9 alumni profiles from different graduation years
- 3 employer accounts with job postings
- 1 mentor with active mentorship relationships
- Sample applications, messages, and notifications
- Complete skills, experience, and education data
