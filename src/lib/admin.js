import { createClient } from '@supabase/supabase-js';

// Create Supabase admin client with service role key
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

// Admin user management functions
export const adminUserManagement = {
  // Update user password
  async updateUserPassword(userId, newPassword) {
    const { error } = await supabaseAdmin.auth.admin.updateUserById(
      userId,
      { password: newPassword }
    );
    
    if (error) {
      console.error('Error updating user password:', error);
      throw error;
    }
    
    return { success: true };
  },

  // Update user email
  async updateUserEmail(userId, newEmail) {
    const { error } = await supabaseAdmin.auth.admin.updateUserById(
      userId,
      { email: newEmail }
    );
    
    if (error) {
      console.error('Error updating user email:', error);
      throw error;
    }
    
    return { success: true };
  },

  // Update user metadata
  async updateUserMetadata(userId, metadata) {
    const { error } = await supabaseAdmin.auth.admin.updateUserById(
      userId,
      { user_metadata: metadata }
    );
    
    if (error) {
      console.error('Error updating user metadata:', error);
      throw error;
    }
    
    return { success: true };
  },

  // Get user by ID
  async getUserById(userId) {
    const { data, error } = await supabaseAdmin.auth.admin.getUserById(userId);
    
    if (error) {
      console.error('Error fetching user:', error);
      throw error;
    }
    
    return data;
  },

  // Get all users (with pagination)
  async getAllUsers(page = 1, limit = 50) {
    const { data, error } = await supabaseAdmin.auth.admin.listUsers({
      page,
      perPage: limit
    });
    
    if (error) {
      console.error('Error fetching users:', error);
      throw error;
    }
    
    return data;
  },

  // Delete user
  async deleteUser(userId) {
    const { error } = await supabaseAdmin.auth.admin.deleteUser(userId);
    
    if (error) {
      console.error('Error deleting user:', error);
      throw error;
    }
    
    return { success: true };
  },

  // Create user (admin)
  async createUser(email, password, userMetadata = {}) {
    const { data, error } = await supabaseAdmin.auth.admin.createUser({
      email,
      password,
      email_confirm: true,
      user_metadata: userMetadata
    });
    
    if (error) {
      console.error('Error creating user:', error);
      throw error;
    }
    
    return data;
  },

  // Reset user password (send reset email)
  async resetUserPassword(email) {
    const { error } = await supabaseAdmin.auth.admin.generateLink({
      type: 'recovery',
      email
    });
    
    if (error) {
      console.error('Error sending password reset:', error);
      throw error;
    }
    
    return { success: true };
  }
};

// Specific user management functions for common operations
export const userOperations = {
  // Update Kevin's password (specific user)
  async updateKevinPassword(newPassword = 'PK12345') {
    const kevinUserId = 'a7893656-1eac-42b8-aeb0-d009209bc1ad';
    return await adminUserManagement.updateUserPassword(kevinUserId, newPassword);
  },

  // Get Kevin's user info
  async getKevinInfo() {
    const kevinUserId = 'a7893656-1eac-42b8-aeb0-d009209bc1ad';
    return await adminUserManagement.getUserById(kevinUserId);
  },

  // Seed/Update demo user test@staug.com
  async seedDemoUser(password = 'M0llySplaind#1') {
    const demoEmail = 'test@staug.com';
    
    try {
      // Check if user exists
      const { data: users } = await supabaseAdmin.auth.admin.listUsers();
      const existingUser = users.users.find(user => user.email === demoEmail);
      
      if (existingUser) {
        // Update existing user
        return await adminUserManagement.updateUserMetadata(existingUser.id, {
          full_name: 'Molly Splaind',
          role: 'alumni',
          graduation_year: '2020',
          major: 'Computer Science',
          company_name: 'Tech Corp',
          job_title: 'Software Engineer',
          bio: 'Demo user for Purple Knights platform'
        });
      } else {
        // Create new user
        return await adminUserManagement.createUser(
          demoEmail,
          password,
          {
            full_name: 'Molly Splaind',
            role: 'alumni',
            graduation_year: '2020',
            major: 'Computer Science',
            company_name: 'Tech Corp',
            job_title: 'Software Engineer',
            bio: 'Demo user for Purple Knights platform'
          }
        );
      }
    } catch (error) {
      console.error('Error seeding demo user:', error);
      throw error;
    }
  },

  // Update demo user password
  async updateDemoUserPassword(newPassword = 'M0llySplaind#1') {
    const demoEmail = 'test@staug.com';
    
    try {
      // Find user by email
      const { data: users } = await supabaseAdmin.auth.admin.listUsers();
      const demoUser = users.users.find(user => user.email === demoEmail);
      
      if (!demoUser) {
        throw new Error('Demo user not found');
      }
      
      return await adminUserManagement.updateUserPassword(demoUser.id, newPassword);
    } catch (error) {
      console.error('Error updating demo user password:', error);
      throw error;
    }
  },

  // Get demo user info
  async getDemoUserInfo() {
    const demoEmail = 'test@staug.com';
    
    try {
      const { data: users } = await supabaseAdmin.auth.admin.listUsers();
      const demoUser = users.users.find(user => user.email === demoEmail);
      
      if (!demoUser) {
        throw new Error('Demo user not found');
      }
      
      return demoUser;
    } catch (error) {
      console.error('Error getting demo user info:', error);
      throw error;
    }
  }
};

export default adminUserManagement;
