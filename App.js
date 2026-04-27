import React from 'react';
import { Routes, Route } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';

function TestComponent() {
  return <div>App is working!</div>;
}

function App() {
  console.log('App rendering...');
  return (
    <AuthProvider>
      <Routes>
        <Route path="/" element={<TestComponent />} />
      </Routes>
    </AuthProvider>
  );
}

export default App;
