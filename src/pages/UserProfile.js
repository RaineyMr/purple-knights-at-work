import React, { useState } from 'react';
import { 
  BriefcaseIcon, 
  AcademicCapIcon, 
  MapPinIcon, 
  CalendarIcon,
  EnvelopeIcon,
  PhoneIcon,
  LinkIcon,
  PencilIcon,
  UserGroupIcon,
  HeartIcon,
  DocumentTextIcon
} from '@heroicons/react/24/outline';

export default function UserProfile() {
  const [activeTab, setActiveTab] = useState('about');

  const userProfile = {
    name: 'Alex Thompson',
    title: 'Computer Science Student',
    email: 'alex.thompson@purpleknights.edu',
    phone: '(555) 123-4567',
    location: 'Boston, MA',
    graduationYear: '2025',
    major: 'Computer Science',
    minor: 'Mathematics',
    gpa: '3.8',
    bio: 'Passionate computer science student with a focus on machine learning and web development. Looking for internship opportunities in software engineering. Active in the Purple Knights community and always eager to learn and collaborate.',
    avatar: 'AT',
    linkedin: 'linkedin.com/in/alexthompson',
    github: 'github.com/alexthompson',
    portfolio: 'alexthompson.dev'
  };

  const experiences = [
    {
      id: 1,
      title: 'Software Engineering Intern',
      company: 'Tech Innovations Inc.',
      location: 'Boston, MA',
      startDate: 'June 2024',
      endDate: 'August 2024',
      current: false,
      description: 'Developed web applications using React and Node.js. Contributed to the development of a customer management system that improved efficiency by 25%.'
    },
    {
      id: 2,
      title: 'Teaching Assistant',
      company: 'Purple Knights University',
      location: 'Campus',
      startDate: 'September 2023',
      endDate: 'Present',
      current: true,
      description: 'Assist in teaching CS101: Introduction to Programming. Grade assignments, hold office hours, and help students with coding concepts.'
    }
  ];

  const education = [
    {
      id: 1,
      degree: 'Bachelor of Science in Computer Science',
      school: 'Purple Knights University',
      location: 'Boston, MA',
      startDate: '2021',
      endDate: '2025',
      current: true,
      gpa: '3.8'
    }
  ];

  const skills = [
    'JavaScript', 'React', 'Node.js', 'Python', 'Java', 'SQL', 'Git', 'Machine Learning', 'Data Structures', 'Algorithms'
  ];

  const activities = [
    {
      id: 1,
      name: 'Computer Science Club',
      role: 'Vice President',
      startDate: '2022',
      description: 'Organize tech talks, hackathons, and networking events for CS students.'
    },
    {
      id: 2,
      name: 'Purple Knights Mentorship Program',
      role: 'Mentee',
      startDate: '2023',
      description: 'Paired with industry mentor for career guidance and professional development.'
    }
  ];

  const TabButton = ({ id, label, icon: Icon }) => (
    <button
      onClick={() => setActiveTab(id)}
      className={`flex items-center space-x-2 px-4 py-2 rounded-lg font-medium transition-colors ${
        activeTab === id
          ? 'bg-purple-100 text-purple-700'
          : 'text-gray-600 hover:bg-gray-100'
      }`}
    >
      <Icon className="h-5 w-5" />
      <span>{label}</span>
    </button>
  );

  return (
    <div className="max-w-4xl mx-auto">
      {/* Profile Header */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 mb-6">
        <div className="flex items-start justify-between">
          <div className="flex items-start space-x-6">
            <div className="h-24 w-24 rounded-full bg-purple-600 flex items-center justify-center">
              <span className="text-white text-2xl font-bold">{userProfile.avatar}</span>
            </div>
            <div className="flex-1">
              <h1 className="text-2xl font-bold text-gray-900">{userProfile.name}</h1>
              <p className="text-lg text-gray-600 mt-1">{userProfile.title}</p>
              <div className="flex items-center space-x-4 mt-3 text-sm text-gray-500">
                <div className="flex items-center space-x-1">
                  <MapPinIcon className="h-4 w-4" />
                  <span>{userProfile.location}</span>
                </div>
                <div className="flex items-center space-x-1">
                  <CalendarIcon className="h-4 w-4" />
                  <span>Class of {userProfile.graduationYear}</span>
                </div>
                <div className="flex items-center space-x-1">
                  <AcademicCapIcon className="h-4 w-4" />
                  <span>GPA: {userProfile.gpa}</span>
                </div>
              </div>
              <div className="flex items-center space-x-4 mt-4">
                <a href={`mailto:${userProfile.email}`} className="flex items-center space-x-1 text-purple-600 hover:text-purple-700">
                  <EnvelopeIcon className="h-4 w-4" />
                  <span className="text-sm">{userProfile.email}</span>
                </a>
                <a href={`tel:${userProfile.phone}`} className="flex items-center space-x-1 text-purple-600 hover:text-purple-700">
                  <PhoneIcon className="h-4 w-4" />
                  <span className="text-sm">{userProfile.phone}</span>
                </a>
              </div>
            </div>
          </div>
          <button className="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg">
            <PencilIcon className="h-5 w-5" />
          </button>
        </div>

        {/* Bio */}
        <div className="mt-6 pt-6 border-t border-gray-200">
          <h3 className="font-semibold text-gray-900 mb-2">About</h3>
          <p className="text-gray-700">{userProfile.bio}</p>
        </div>

        {/* Links */}
        <div className="mt-6 pt-6 border-t border-gray-200">
          <h3 className="font-semibold text-gray-900 mb-3">Links</h3>
          <div className="flex flex-wrap gap-3">
            <a href={`https://${userProfile.linkedin}`} className="flex items-center space-x-2 px-3 py-2 bg-gray-50 rounded-lg hover:bg-gray-100">
              <LinkIcon className="h-4 w-4 text-gray-600" />
              <span className="text-sm text-gray-700">LinkedIn</span>
            </a>
            <a href={`https://${userProfile.github}`} className="flex items-center space-x-2 px-3 py-2 bg-gray-50 rounded-lg hover:bg-gray-100">
              <LinkIcon className="h-4 w-4 text-gray-600" />
              <span className="text-sm text-gray-700">GitHub</span>
            </a>
            <a href={`https://${userProfile.portfolio}`} className="flex items-center space-x-2 px-3 py-2 bg-gray-50 rounded-lg hover:bg-gray-100">
              <LinkIcon className="h-4 w-4 text-gray-600" />
              <span className="text-sm text-gray-700">Portfolio</span>
            </a>
          </div>
        </div>
      </div>

      {/* Tabs */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-2 mb-6">
        <div className="flex space-x-2">
          <TabButton id="about" label="About" icon={UserGroupIcon} />
          <TabButton id="experience" label="Experience" icon={BriefcaseIcon} />
          <TabButton id="education" label="Education" icon={AcademicCapIcon} />
          <TabButton id="activities" label="Activities" icon={HeartIcon} />
        </div>
      </div>

      {/* Tab Content */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
        {activeTab === 'about' && (
          <div className="space-y-6">
            <div>
              <h3 className="font-semibold text-gray-900 mb-3">Skills</h3>
              <div className="flex flex-wrap gap-2">
                {skills.map(skill => (
                  <span key={skill} className="px-3 py-1 bg-purple-50 text-purple-700 rounded-full text-sm">
                    {skill}
                  </span>
                ))}
              </div>
            </div>
            
            <div>
              <h3 className="font-semibold text-gray-900 mb-3">Academic Information</h3>
              <div className="space-y-2">
                <div className="flex justify-between">
                  <span className="text-gray-600">Major:</span>
                  <span className="font-medium">{userProfile.major}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">Minor:</span>
                  <span className="font-medium">{userProfile.minor}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">GPA:</span>
                  <span className="font-medium">{userProfile.gpa}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">Expected Graduation:</span>
                  <span className="font-medium">{userProfile.graduationYear}</span>
                </div>
              </div>
            </div>
          </div>
        )}

        {activeTab === 'experience' && (
          <div className="space-y-6">
            {experiences.map(exp => (
              <div key={exp.id} className="border-l-4 border-purple-600 pl-4">
                <h3 className="font-semibold text-gray-900">{exp.title}</h3>
                <p className="text-purple-600 font-medium">{exp.company}</p>
                <div className="flex items-center space-x-2 text-sm text-gray-500 mt-1">
                  <MapPinIcon className="h-4 w-4" />
                  <span>{exp.location}</span>
                  <span>•</span>
                  <CalendarIcon className="h-4 w-4" />
                  <span>{exp.startDate} - {exp.current ? 'Present' : exp.endDate}</span>
                </div>
                <p className="text-gray-700 mt-2">{exp.description}</p>
              </div>
            ))}
          </div>
        )}

        {activeTab === 'education' && (
          <div className="space-y-6">
            {education.map(edu => (
              <div key={edu.id} className="border-l-4 border-purple-600 pl-4">
                <h3 className="font-semibold text-gray-900">{edu.degree}</h3>
                <p className="text-purple-600 font-medium">{edu.school}</p>
                <div className="flex items-center space-x-2 text-sm text-gray-500 mt-1">
                  <MapPinIcon className="h-4 w-4" />
                  <span>{edu.location}</span>
                  <span>•</span>
                  <CalendarIcon className="h-4 w-4" />
                  <span>{edu.startDate} - {edu.current ? 'Present' : edu.endDate}</span>
                </div>
                <div className="mt-2">
                  <span className="text-sm text-gray-600">GPA: </span>
                  <span className="text-sm font-medium">{edu.gpa}</span>
                </div>
              </div>
            ))}
          </div>
        )}

        {activeTab === 'activities' && (
          <div className="space-y-6">
            {activities.map(activity => (
              <div key={activity.id} className="border-l-4 border-purple-600 pl-4">
                <h3 className="font-semibold text-gray-900">{activity.name}</h3>
                <p className="text-purple-600 font-medium">{activity.role}</p>
                <div className="flex items-center space-x-2 text-sm text-gray-500 mt-1">
                  <CalendarIcon className="h-4 w-4" />
                  <span>Since {activity.startDate}</span>
                </div>
                <p className="text-gray-700 mt-2">{activity.description}</p>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
