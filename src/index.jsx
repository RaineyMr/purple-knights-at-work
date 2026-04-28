import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from 'react-query'
import { Toaster } from 'react-hot-toast'
import App from './App.jsx'
import './index.css'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      retry: 1,
    },
  },
})

// Test if React is mounting
console.log('React index.jsx loading');
const rootElement = document.getElementById('root');
console.log('Root element found:', rootElement);

if (rootElement) {
  console.log('Attempting to render React app');
  // Simple test render first
  rootElement.innerHTML = '<div style="background: red; color: white; padding: 20px;">TEST: React should replace this</div>';
  
  ReactDOM.createRoot(rootElement).render(
    <div style="background: blue; color: white; padding: 20px; margin: 20px;">
      <h1>React is working!</h1>
      <p>If you see this, React is mounting successfully.</p>
    </div>
  );
  
  // Then try the full app
  setTimeout(() => {
    ReactDOM.createRoot(rootElement).render(
      <React.StrictMode>
        <QueryClientProvider client={queryClient}>
          <BrowserRouter>
            <App />
            <Toaster
              position="top-right"
              toastOptions={{
                duration: 4000,
                style: {
                  background: '#363636',
                  color: '#fff',
                },
                success: {
                  duration: 3000,
                  iconTheme: {
                    primary: '#6B46C1',
                    secondary: '#fff',
                  },
                },
                error: {
                  duration: 5000,
                  iconTheme: {
                    primary: '#EF4444',
                    secondary: '#fff',
                  },
                },
              }}
            />
          </BrowserRouter>
        </QueryClientProvider>
      </React.StrictMode>,
    );
  }, 1000);
} else {
  console.error('Root element not found!');
}
