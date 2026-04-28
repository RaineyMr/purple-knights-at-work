import React, { useState, useEffect } from 'react';
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
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

export default function UserProfile() {
  const [activeTab, setActiveTab] = useState('about');
  const [profile, setProfile] = useState(null);
  const [skills, setSkills] = useState([]);
  const [experience, setExperience] = useState([]);
  const [education, setEducation] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isEditing, setIsEditing] = useState(false);
  const [editForm, setEditForm] = useState({});
  const [isSaving, setIsSaving] = useState(false);
  const { user } = useAuth();

  useEffect(() => {
    if (user) {
      fetchProfileData();
    }
  }, [user]);

  const fetchProfileData = async () => {
    try {
      setLoading(true);
      setError(null);
      
      console.log('Fetching profile for user ID:', user.id);
      
      // Fetch profile
      const { data: profileData, error: profileError } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', user.id)
        .single();
      
      console.log('Profile data:', profileData);
      console.log('Profile error:', profileError);
      
      if (profileError) {
        console.error('Profile fetch error:', profileError);
        throw profileError;
      }
      
      setProfile(profileData);
      
      // Fetch skills
      const { data: skillsData, error: skillsError } = await supabase
        .from('alumni_skills')
        .select('*')
        .eq('profile_id', user.id);
      
      if (!skillsError && skillsData) {
        setSkills(skillsData);
      }
      
      // Fetch experience
      const { data: experienceData, error: expError } = await supabase
        .from('alumni_experience')
        .select('*')
        .eq('profile_id', user.id)
        .order('start_date', { ascending: false });
      
      if (!expError && experienceData) {
        setExperience(experienceData);
      }
      
      // Fetch education
      const { data: educationData, error: eduError } = await supabase
        .from('alumni_education')
        .select('*')
        .eq('profile_id', user.id)
        .order('start_date', { ascending: false });
      
      if (!eduError && educationData) {
        setEducation(educationData);
      }
      
    } catch (error) {
      console.error('Error fetching profile data:', error);
      setError(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleEditClick = () => {
    setEditForm({
      first_name: profile.first_name || '',
      last_name: profile.last_name || '',
      headline: profile.headline || '',
      bio: profile.bio || '',
      location: profile.location || '',
      phone: profile.phone || '',
      linkedin_url: profile.linkedin_url || '',
      portfolio_url: profile.portfolio_url || '',
      graduation_year: profile.graduation_year || '',
      allow_employer_contact: profile.allow_employer_contact || false
    });
    setIsEditing(true);
  };

  const handleSaveProfile = async () => {
    try {
      setIsSaving(true);
      
      // Convert graduation_year to number if provided
      const updateData = { ...editForm };
      if (editForm.graduation_year && editForm.graduation_year !== '') {
        updateData.graduation_year = parseInt(editForm.graduation_year);
      }
      
      const { error } = await supabase
        .from('profiles')
        .update(updateData)
        .eq('id', user.id);
      
      if (error) throw error;
      
      setProfile(prev => ({ ...prev, ...updateData }));
      setIsEditing(false);
      
    } catch (error) {
      console.error('Error updating profile:', error);
      setError(error.message);
    } finally {
      setIsSaving(false);
    }
  };

  const handleCancelEdit = () => {
    setIsEditing(false);
    setEditForm({});
  };

  const handleInputChange = (field, value) => {
    setEditForm(prev => ({ ...prev, [field]: value }));
  };

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto">
        <div className="animate-pulse">
          <div className="h-4 bg-gray-200 rounded w-1/4 mb-4"></div>
          <div className="h-8 bg-gray-200 rounded w-1/2 mb-2"></div>
          <div className="h-4 bg-gray-200 rounded w-3/4"></div>
        </div>
      </div>
    );
  }

  if (!profile) {
    return (
      <div className="max-w-4xl mx-auto">
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
          <h2 className="text-xl font-semibold text-gray-900 mb-4">Profile Not Found</h2>
          <p className="text-gray-600 mb-4">Your profile could not be found. Please complete your profile setup.</p>
          {error && (
            <div className="bg-red-50 border border-red-200 rounded-lg p-4">
              <p className="text-red-700">Error: {error}</p>
            </div>
          )}
          <div className="mt-4">
            <p className="text-sm text-gray-500">User ID: {user?.id}</p>
            <p className="text-sm text-gray-500">Email: {user?.email}</p>
          </div>
        </div>
      </div>
    );
  }

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
        {isEditing && (
          <div className="flex justify-end mb-4">
            <div className="flex space-x-2">
              <button
                onClick={handleSaveProfile}
                disabled={isSaving}
                className="px-4 py-2 bg-purple-600 hover:bg-purple-700 text-white rounded-lg font-medium disabled:opacity-50"
                title="Save Changes"
              >
                {isSaving ? 'Saving...' : 'Save Changes'}
              </button>
              <button
                onClick={handleCancelEdit}
                className="px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg font-medium"
                title="Cancel"
              >
                Cancel
              </button>
            </div>
          </div>
        )}
        <div className="flex items-start justify-between">
          <div className="flex items-start space-x-6">
            <div className="h-24 w-24 rounded-full bg-purple-600 flex items-center justify-center">
              <span className="text-white text-2xl font-bold">
                {profile.first_name ? profile.first_name[0] + profile.last_name[0] : 'U'}
              </span>
            </div>
            <div className="flex-1">
              {isEditing ? (
                <div className="space-y-3">
                  <div className="flex items-center space-x-3">
                    <input
                      type="text"
                      value={editForm.first_name}
                      onChange={(e) => handleInputChange('first_name', e.target.value)}
                      className="text-2xl font-bold text-gray-900 bg-transparent border-b-2 border-purple-300 focus:border-purple-500 outline-none"
                      placeholder="First Name"
                    />
                    <input
                      type="text"
                      value={editForm.last_name}
                      onChange={(e) => handleInputChange('last_name', e.target.value)}
                      className="text-2xl font-bold text-gray-900 bg-transparent border-b-2 border-purple-300 focus:border-purple-500 outline-none"
                      placeholder="Last Name"
                    />
                  </div>
                  <input
                    type="text"
                    value={editForm.headline}
                    onChange={(e) => handleInputChange('headline', e.target.value)}
                    className="text-lg text-gray-600 bg-transparent border-b border-purple-300 focus:border-purple-500 outline-none w-full"
                    placeholder="e.g. Software Engineer at Tech Company"
                  />
                  <div className="flex items-center space-x-4">
                    <input
                      type="text"
                      value={editForm.location}
                      onChange={(e) => handleInputChange('location', e.target.value)}
                      className="text-sm text-gray-500 bg-transparent border-b border-purple-300 focus:border-purple-500 outline-none"
                      placeholder="Location"
                    />
                    <input
                      type="text"
                      value={editForm.graduation_year}
                      onChange={(e) => handleInputChange('graduation_year', e.target.value)}
                      className="text-sm text-gray-500 bg-transparent border-b border-purple-300 focus:border-purple-500 outline-none w-24"
                      placeholder="Year"
                    />
                    <input
                      type="text"
                      value={editForm.phone}
                      onChange={(e) => handleInputChange('phone', e.target.value)}
                      className="text-sm text-purple-600 bg-transparent border-b border-purple-300 focus:border-purple-500 outline-none"
                      placeholder="Phone"
                    />
                  </div>
                </div>
              ) : (
                <>
                  <h1 className="text-2xl font-bold text-gray-900">{profile.first_name} {profile.last_name}</h1>
                  <p className="text-lg text-gray-600 mt-1">{profile.headline || 'Purple Knight Alumnus'}</p>
                  <div className="flex items-center space-x-4 mt-3 text-sm text-gray-500">
                    {profile.location && (
                      <div className="flex items-center space-x-1">
                        <MapPinIcon className="h-4 w-4" />
                        <span>{profile.location}</span>
                      </div>
                    )}
                    {profile.graduation_year && (
                      <div className="flex items-center space-x-1">
                        <CalendarIcon className="h-4 w-4" />
                        <span>Class of {profile.graduation_year}</span>
                      </div>
                    )}
                    <div className="flex items-center space-x-1">
                      <AcademicCapIcon className="h-4 w-4" />
                      <span>Verified Alumni: {profile.verified_alumni ? 'Yes' : 'No'}</span>
                    </div>
                  </div>
                  <div className="flex items-center space-x-4 mt-4">
                    <a href={`mailto:${user.email}`} className="flex items-center space-x-1 text-purple-600 hover:text-purple-700">
                      <EnvelopeIcon className="h-4 w-4" />
                      <span className="text-sm">{user.email}</span>
                    </a>
                    {profile.phone && (
                      <a href={`tel:${profile.phone}`} className="flex items-center space-x-1 text-purple-600 hover:text-purple-700">
                        <PhoneIcon className="h-4 w-4" />
                        <span className="text-sm">{profile.phone}</span>
                      </a>
                    )}
                  </div>
                </>
              )}
            </div>
          </div>
          {!isEditing && (
            <button 
              onClick={handleEditClick}
              className="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg"
              title="Edit Profile"
            >
              <PencilIcon className="h-5 w-5" />
            </button>
          )}
        </div>
      </div>

      {/* Bio */}
      <div className="mt-6 pt-6 border-t border-gray-200">
        <h3 className="font-semibold text-gray-900 mb-2">About</h3>
        {isEditing ? (
          <textarea
            value={editForm.bio}
            onChange={(e) => handleInputChange('bio', e.target.value)}
            rows={4}
            placeholder="Tell us about yourself..."
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500"
          />
        ) : (
          <p className="text-gray-700">{profile.bio || 'No bio provided yet.'}</p>
        )}
      </div>

      {/* Links */}
      <div className="mt-6 pt-6 border-t border-gray-200">
        <h3 className="font-semibold text-gray-900 mb-3">Links</h3>
        <div className="flex flex-wrap gap-3">
          {isEditing ? (
            <>
              <div className="flex items-center space-x-2">
                <input
                  type="url"
                  value={editForm.linkedin_url}
                  onChange={(e) => handleInputChange('linkedin_url', e.target.value)}
                  placeholder="LinkedIn URL"
                  className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500"
                />
              </div>
              <div className="flex items-center space-x-2">
                <input
                  type="url"
                  value={editForm.portfolio_url}
                  onChange={(e) => handleInputChange('portfolio_url', e.target.value)}
                  placeholder="Portfolio URL"
                  className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500"
                />
              </div>
            </>
          ) : (
            <>
              {profile.linkedin_url && (
                <a href={profile.linkedin_url.startsWith('http') ? profile.linkedin_url : `https://${profile.linkedin_url}`} 
                   className="flex items-center space-x-2 px-3 py-2 bg-gray-50 rounded-lg hover:bg-gray-100">
                  <LinkIcon className="h-4 w-4 text-gray-600" />
                  <span className="text-sm text-gray-700">LinkedIn</span>
                </a>
              )}
              {profile.portfolio_url && (
                <a href={profile.portfolio_url.startsWith('http') ? profile.portfolio_url : `https://${profile.portfolio_url}`} 
                   className="flex items-center space-x-2 px-3 py-2 bg-gray-50 rounded-lg hover:bg-gray-100">
                  <LinkIcon className="h-4 w-4 text-gray-600" />
                  <span className="text-sm text-gray-700">Portfolio</span>
                </a>
              )}
            </>
          )}
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
                {skills.length > 0 ? (
                  skills.map(skill => (
                    <span key={skill.id} className="px-3 py-1 bg-purple-50 text-purple-700 rounded-full text-sm">
                      {skill.skill_name} ({skill.proficiency_level})
                    </span>
                  ))
                ) : (
                  <p className="text-gray-500">No skills added yet.</p>
                )}
              </div>
            </div>
            
            <div>
              <h3 className="font-semibold text-gray-900 mb-3">Profile Information</h3>
              <div className="space-y-2">
                <div className="flex justify-between">
                  <span className="text-gray-600">Role:</span>
                  <span className="font-medium capitalize">{profile.role}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">Graduation Year:</span>
                  <span className="font-medium">{profile.graduation_year || 'N/A'}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">Verified Alumni:</span>
                  <span className="font-medium">{profile.verified_alumni ? 'Yes' : 'No'}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-600">Allow Employer Contact:</span>
                  <span className="font-medium">{profile.allow_employer_contact ? 'Yes' : 'No'}</span>
                </div>
              </div>
            </div>
          </div>
        )}

        {activeTab === 'experience' && (
          <div className="space-y-6">
            {experience.length > 0 ? (
              experience.map(exp => (
                <div key={exp.id} className="border-l-4 border-purple-600 pl-4">
                  <h3 className="font-semibold text-gray-900">{exp.position}</h3>
                  <p className="text-purple-600 font-medium">{exp.company_name}</p>
                  <div className="flex items-center space-x-2 text-sm text-gray-500 mt-1">
                    {exp.location && (
                      <>
                        <MapPinIcon className="h-4 w-4" />
                        <span>{exp.location}</span>
                        <span>•</span>
                      </>
                    )}
                    <CalendarIcon className="h-4 w-4" />
                    <span>{new Date(exp.start_date).toLocaleDateString('en-US', { year: 'numeric', month: 'short' })} - {exp.current_position ? 'Present' : new Date(exp.end_date).toLocaleDateString('en-US', { year: 'numeric', month: 'short' })}</span>
                  </div>
                  {exp.description && (
                    <p className="text-gray-700 mt-2">{exp.description}</p>
                  )}
                </div>
              ))
            ) : (
              <p className="text-gray-500">No experience added yet.</p>
            )}
          </div>
        )}

        {activeTab === 'education' && (
          <div className="space-y-6">
            {education.length > 0 ? (
              education.map(edu => (
                <div key={edu.id} className="border-l-4 border-purple-600 pl-4">
                  <h3 className="font-semibold text-gray-900">{edu.degree} in {edu.field_of_study}</h3>
                  <p className="text-purple-600 font-medium">{edu.institution_name}</p>
                  <div className="flex items-center space-x-2 text-sm text-gray-500 mt-1">
                    <CalendarIcon className="h-4 w-4" />
                    <span>{new Date(edu.start_date).toLocaleDateString('en-US', { year: 'numeric', month: 'short' })} - {edu.current_student ? 'Present' : new Date(edu.end_date).toLocaleDateString('en-US', { year: 'numeric', month: 'short' })}</span>
                  </div>
                  {edu.gpa && (
                    <div className="mt-2">
                      <span className="text-sm text-gray-600">GPA: </span>
                      <span className="text-sm font-medium">{edu.gpa}</span>
                    </div>
                  )}
                  {edu.activities && edu.activities.length > 0 && (
                    <div className="mt-2">
                      <span className="text-sm text-gray-600">Activities: </span>
                      <span className="text-sm font-medium">{edu.activities.join(', ')}</span>
                    </div>
                  )}
                </div>
              ))
            ) : (
              <p className="text-gray-500">No education records added yet.</p>
            )}
          </div>
        )}

        {activeTab === 'activities' && (
          <div className="space-y-6">
            <div className="text-center py-8">
              <HeartIcon className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-medium text-gray-900 mb-2">Activities Coming Soon</h3>
              <p className="text-gray-500">This section will display your extracurricular activities, mentorship relationships, and community involvement.</p>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
