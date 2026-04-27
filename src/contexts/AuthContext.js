import React, { createContext, useContext, useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';

export const AuthContext = createContext();

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};

export const AuthProvider = ({ children }) => {
  console.log('AuthProvider rendering...');
  const [user, setUser] = useState(null);
  const [profile, setProfile] = useState(null);
  const [loading, setLoading] = useState(false); // Set to false to avoid loading issues

  // Skip Supabase initialization for now to isolate the issue
  const value = {
    user,
    profile,
    loading,
    setUser,
    setProfile,
    signOut: async () => {
      setUser(null);
      setProfile(null);
    },
    updateProfile: async (updates) => {
      setProfile(prev => ({ ...prev, ...updates }));
      return profile;
    },
  };

  console.log('AuthProvider about to render children');
  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};