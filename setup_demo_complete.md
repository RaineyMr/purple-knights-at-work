# Purple Knights at Work - Complete Demo Setup Guide

## 🚨 Important: Foreign Key Constraint Issue

The SQL error occurs because the `profiles` table has a foreign key constraint to the `auth.users` table. This means we need to create the auth users FIRST, then insert the profiles using their actual UUIDs.

## 📋 Step-by-Step Setup Instructions

### Step 1: Create Auth Users in Supabase

Go to your Supabase project → Authentication → Users and create these users manually:

#### Alumni Accounts
| Email | Password | Name | Graduation Year |
|-------|----------|------|----------------|
| marcus.thompson@purpleknights.work | PurpleKnights2024 | Marcus Thompson | 2022 |
| samantha.rodriguez@purpleknights.work | PurpleKnights2024 | Samantha Rodriguez | 2015 |
| robert.johnson@purpleknights.work | PurpleKnights2024 | Robert Johnson | 2000 |
| patricia.brown@purpleknights.work | PurpleKnights2024 | Patricia Brown | 1998 |
| james.miller@purpleknights.work | PurpleKnights2024 | James Miller | 1996 |

#### Employer Accounts
| Email | Password | Company |
|-------|----------|---------|
| tech.innovations@purpleknights.work | PurpleKnights2024 | Tech Innovations |
| gulf.marketing@purpleknights.work | PurpleKnights2024 | Gulf Marketing Group |
| financial.services@purpleknights.work | PurpleKnights2024 | Financial Services LLC |
| healthcare.plus@purpleknights.work | PurpleKnights2024 | Healthcare Plus |
| education.first@purpleknights.work | PurpleKnights2024 | Education First |

#### Admin Account
| Email | Password | Name |
|-------|----------|------|
| admin@purpleknights.work | PurpleKnights2024 | Admin User |

### Step 2: Get the Actual User UUIDs

After creating the users, copy their UUIDs from the Supabase Authentication table. You'll see UUIDs like:
- `a1b2c3d4-e5f6-7890-1234-567890abcdef`

### Step 3: Update the SQL File

Replace the placeholder UUIDs in `presentation_demo_data_fixed.sql` with the actual user UUIDs:

```sql
-- Replace these with actual user IDs from your Supabase Auth table
-- For example, change '550e8400-e29b-41d4-a716-446655440001' to actual UUID

-- Marcus Thompson
UPDATE profiles SET id = 'ACTUAL_MARCUS_UUID' WHERE first_name = 'Marcus' AND last_name = 'Thompson';

-- Samantha Rodriguez  
UPDATE profiles SET id = 'ACTUAL_SAMANTHA_UUID' WHERE first_name = 'Samantha' AND last_name = 'Rodriguez';

-- Robert Johnson
UPDATE profiles SET id = 'ACTUAL_ROBERT_UUID' WHERE first_name = 'Robert' AND last_name = 'Johnson';

-- Patricia Brown
UPDATE profiles SET id = 'ACTUAL_PATRICIA_UUID' WHERE first_name = 'Patricia' AND last_name = 'Brown';

-- James Miller
UPDATE profiles SET id = 'ACTUAL_JAMES_UUID' WHERE first_name = 'James' AND last_name = 'Miller';

-- Employers
UPDATE profiles SET id = 'ACTUAL_TECH_UUID' WHERE company_name = 'Tech Innovations';
UPDATE profiles SET id = 'ACTUAL_GULF_UUID' WHERE company_name = 'Gulf Marketing Group';
-- etc.
```

### Step 4: Create a Modified SQL Script

Create a new SQL file that uses the actual UUIDs, or run the existing file with the UUID replacements.

### Step 5: Run the Complete Demo Data

Once you have the actual UUIDs, run the modified SQL script in Supabase SQL Editor.

## 🔧 Alternative: Create a UUID Mapping Script

If you want to automate this process, you can create a script that:

1. Creates the auth users via Supabase Auth API
2. Retrieves their UUIDs
3. Inserts the profile data with correct UUIDs

## 📞 If You Need Help

The foreign key constraint ensures data integrity between auth users and profiles. This is actually a good security feature! We just need to create the users first, then the profiles.

## ✅ Quick Test

After setup, you should be able to:
1. Login with any demo account (password: PurpleKnights2024)
2. See complete profiles with 100% completion
3. Browse 5 comprehensive job postings
4. Experience full application workflows
5. View mentorship relationships
6. See complete analytics and notifications

The demo will showcase the complete Purple Knights alumni platform! 🏫💜💛
