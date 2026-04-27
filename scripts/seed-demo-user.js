// Node.js script to seed demo user test@staug.com
// Run with: node scripts/seed-demo-user.js

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '.env' });

const supabaseAdmin = createClient(
  process.env.REACT_APP_SUPABASE_URL,
  process.env.REACT_APP_SUPABASE_SERVICE_ROLE_KEY,
  {
    auth: {
      autoRefreshToken: false,
      persistSession: false
    }
  }
);

async function seedDemoUser() {
  try {
    console.log('Seeding demo user test@staug.com...');
    
    const demoEmail = 'test@staug.com';
    const demoPassword = 'M0llySplaind#1';
    
    // Check if user already exists
    const { data: existingUsers } = await supabaseAdmin.auth.admin.listUsers();
    const existingUser = existingUsers.users.find(user => user.email === demoEmail);
    
    if (existingUser) {
      console.log('✅ Demo user already exists!');
      console.log(`User ID: ${existingUser.id}`);
      console.log(`Email: ${existingUser.email}`);
      console.log(`Role: ${existingUser.user_metadata?.role || 'user'}`);
      
      // Update password and metadata if needed
      console.log('Updating demo user password and metadata...');
      const { error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
        existingUser.id,
        { 
          password: demoPassword,
          user_metadata: {
            full_name: 'Molly Splaind',
            role: 'alumni',
            graduation_year: '2020',
            major: 'Computer Science',
            company_name: 'Tech Corp',
            job_title: 'Software Engineer',
            bio: 'Demo user for Purple Knights platform'
          }
        }
      );
      
      if (updateError) {
        console.error('Error updating demo user:', updateError);
        throw updateError;
      }
      
      console.log('✅ Demo user updated successfully!');
    } else {
      // Create new demo user
      console.log('Creating new demo user...');
      const { data, error } = await supabaseAdmin.auth.admin.createUser({
        email: demoEmail,
        password: demoPassword,
        email_confirm: true,
        user_metadata: {
          full_name: 'Molly Splaind',
          role: 'alumni',
          graduation_year: '2020',
          major: 'Computer Science',
          company_name: 'Tech Corp',
          job_title: 'Software Engineer',
          bio: 'Demo user for Purple Knights platform'
        }
      });
      
      if (error) {
        console.error('Error creating demo user:', error);
        throw error;
      }
      
      console.log('✅ Demo user created successfully!');
      console.log(`User ID: ${data.user.id}`);
    }
    
    console.log('\n🎉 Demo User Credentials:');
    console.log(`Email: ${demoEmail}`);
    console.log(`Password: ${demoPassword}`);
    console.log('Role: alumni');
    console.log('Name: Molly Splaind');
    console.log('Graduation: 2020');
    console.log('Major: Computer Science');
    console.log('Company: Tech Corp');
    console.log('Position: Software Engineer');
    
  } catch (error) {
    console.error('❌ Failed to seed demo user:', error.message);
    process.exit(1);
  }
}

seedDemoUser();
