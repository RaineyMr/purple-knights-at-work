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
  async updateKevinPassword(newPassword = 'PK123') {
    const kevinUserId = 'a7893656-1eac-42b8-aeb0-d009209bc1ad';
    return await adminUserManagement.updateUserPassword(kevinUserId, newPassword);
  },

  // Get Kevin's user info
  async getKevinInfo() {
    const kevinUserId = 'a7893656-1eac-42b8-aeb0-d009209bc1ad';
    return await adminUserManagement.getUserById(kevinUserId);
  }
};

export default adminUserManagement;
