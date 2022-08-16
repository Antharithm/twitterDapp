import React from 'react';
import { Route, Routes } from 'react-router-dom';
import Home from './pages/Home';
import Profile from './pages/Profile';
import Settings from './pages/Settings';
import Sidebar from './components/Sidebar';
import Rightbar from './components/Rightbar';
import './App.css';

function App() {
  return (
    <>
      <div className='page'>
        <div className='sidebar'>
          <Sidebar/>
        </div>
        <div className='mainWindow'>
          <Routes>
            <Route path='/' element={<Home />} />
            <Route path='/' element={<Profile />} />
            <Route path='/' element={<Settings />} />
          </Routes>
        </div>
        <div className='rightbar'>
          < Rightbar />
        </div>
      </div>
    </>
  );
}

export default App;