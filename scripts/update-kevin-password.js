// Node.js script to update Kevin's password
// Run with: node scripts/update-kevin-password.js

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

async function updateKevinPassword(password = 'PK12345') {
  try {
    console.log('Updating Kevin\'s password...');
    
    const kevinUserId = 'a7893656-1eac-42b8-aeb0-d009209bc1ad';
    
    const { error } = await supabaseAdmin.auth.admin.updateUserById(
      kevinUserId,
      { password: password }
    );

    if (error) {
      console.error('Error updating password:', error);
      throw error;
    }

    console.log('✅ Password updated successfully!');
    console.log(`User ID: ${kevinUserId}`);
    console.log(`New password: ${password}`);
    
    // Get user info to verify
    const { data: userData } = await supabaseAdmin.auth.admin.getUserById(kevinUserId);
    console.log(`User email: ${userData.user.email}`);
    
  } catch (error) {
    console.error('❌ Failed to update password:', error.message);
    process.exit(1);
  }
}

// Get password from command line argument or use default
const newPassword = process.argv[2] || 'PK123';

updateKevinPassword(newPassword);
