export const clearAllAuthData = () => {
  try {
    // Clear all localStorage items
    const keysToKeep = ['theme', 'language', 'preferences']; // Keep non-auth items
    const allKeys = Object.keys(localStorage);
    
    allKeys.forEach(key => {
      if (!keysToKeep.includes(key) && 
          (key.includes('supabase') || key.includes('auth') || key.includes('token'))) {
        localStorage.removeItem(key);
      }
    });

    // Clear sessionStorage completely
    sessionStorage.clear();

    // Clear any cookies related to auth (if any)
    document.cookie.split(';').forEach(cookie => {
      const eqPos = cookie.indexOf('=');
      const name = eqPos > -1 ? cookie.substr(0, eqPos).trim() : cookie.trim();
      if (name.includes('supabase') || name.includes('auth')) {
        document.cookie = `${name}=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/;domain=${window.location.hostname}`;
        document.cookie = `${name}=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/`;
      }
    });

    console.log('Auth data cleared successfully');
  } catch (error) {
    console.error('Error clearing auth data:', error);
  }
};

export const isAuthError = (error) => {
  return error?.message?.includes('Invalid Refresh Token') ||
         error?.message?.includes('Refresh Token Not Found') ||
         error?.message?.includes('AuthApiError') ||
         error?.message?.includes('401') ||
         error?.status === 400;
};
