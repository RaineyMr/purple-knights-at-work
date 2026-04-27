// Jobs API - Server-side proxy for secure data access

// This would typically be a Node.js/Express server, but for now we'll create
// a client-side solution that uses the service role key through a secure proxy

// For production, you should:
// 1. Create a backend API endpoint (Node.js/Express)
// 2. Use the service role key only on the server
// 3. Expose jobs through your own API

// Temporary development solution - create a secure API call
export const jobsAPI = {
  async getJobs() {
    try {
      // In production, this would be your own API endpoint
      // const response = await fetch('/api/jobs');
      
      // For now, we'll use a mock approach with the data we know exists
      // This is a temporary solution until you set up proper RLS policies
      
      // Mock data based on what we saw in the database
      const mockJobs = [
        {
          id: "1",
          title: "Cybersecurity Analyst",
          description: "Investigate security breaches and perform digital forensics for enterprise clients.",
          location: "New Orleans, LA",
          job_type: "full_time",
          salary_range: "$85,000–$120,000",
          skills: ["Cybersecurity", "Forensics", "Linux"],
          responsibilities: ["Investigate breaches", "Perform forensics", "Write reports"],
          alumni_affiliation: "Posted by alumnus: Marcus Dupree (Class of 2013)",
          created_at: new Date().toISOString(),
          url: "https://example.com/cybersecurity-analyst"
        },
        {
          id: "2", 
          title: "Video Coordinator",
          description: "Manage video breakdowns, scouting footage, and analytics integration.",
          location: "New Orleans, LA",
          job_type: "full_time",
          salary_range: "$45,000–$60,000",
          skills: ["Video Editing", "Analytics", "Basketball IQ"],
          responsibilities: ["Break down film", "Support coaches", "Prepare scouting clips"],
          alumni_affiliation: "Posted by alumnus: Isaiah Robinson (Class of 2009)",
          created_at: new Date().toISOString(),
          url: "https://pelicans.com/careers/video-coordinator"
        },
        {
          id: "3",
          title: "Aircraft Maintenance Planner",
          description: "Plan and schedule aircraft maintenance activities.",
          location: "Dallas, TX", 
          job_type: "full_time",
          salary_range: "$80,000–$110,000",
          skills: ["Maintenance Planning", "Aviation", "Scheduling"],
          responsibilities: ["Plan maintenance", "Coordinate teams", "Ensure compliance"],
          alumni_affiliation: "Posted by alumnus: Clarence Joseph (Class of 1996)",
          created_at: new Date().toISOString(),
          url: "https://southwest.com/careers/maintenance-planner"
        }
      ];

      return mockJobs;
    } catch (error) {
      console.error('Error fetching jobs:', error);
      throw error;
    }
  },

  async getJob(jobId) {
    const jobs = await this.getJobs();
    return jobs.find(job => job.id === jobId);
  }
};
