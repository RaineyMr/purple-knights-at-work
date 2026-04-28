import React, { createContext, useContext, useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [profile, setProfile] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Get initial session with error handling
    const getSession = async () => {
      try {
        const { data: { session }, error } = await supabase.auth.getSession();
        
        if (error) {
          console.error('Error getting session:', error);
          // Clear any corrupted session data
          await supabase.auth.signOut({ scope: 'global' });
          setUser(null);
          setProfile(null);
        } else if (session?.user) {
          setUser(session.user);
        }
      } catch (error) {
        console.error('Unexpected error getting session:', error);
        setUser(null);
        setProfile(null);
      } finally {
        setLoading(false);
      }
    };

    getSession();

    // Listen for auth changes with error handling
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        console.log('Auth state changed:', event, session?.user?.id);
        
        try {
          if (session?.user) {
            setUser(session.user);
          } else {
            setUser(null);
            setProfile(null);
          }
        } catch (error) {
          console.error('Error handling auth state change:', error);
          setUser(null);
          setProfile(null);
        } finally {
          setLoading(false);
        }
      }
    );

    return () => subscription.unsubscribe();
  }, []);

  const value = {
    user,
    profile,
    loading,
    setUser,
    setProfile,
    signOut: async () => {
      try {
        await supabase.auth.signOut({ scope: 'global' });
      } catch (error) {
        console.error('Error signing out:', error);
      } finally {
        setUser(null);
        setProfile(null);
      }
    },
    clearCorruptedSession: async () => {
      try {
        await supabase.auth.signOut({ scope: 'global' });
        // Clear any local storage data
        localStorage.removeItem('supabase.auth.token');
        sessionStorage.clear();
      } catch (error) {
        console.error('Error clearing corrupted session:', error);
      } finally {
        setUser(null);
        setProfile(null);
      }
    },
    updateProfile: async (updates) => {
      setProfile(prev => ({ ...prev, ...updates }));
      return profile;
    },
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};