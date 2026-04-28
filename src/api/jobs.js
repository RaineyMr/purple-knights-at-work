// Jobs API - Server-side proxy for secure data access

// This would typically be a Node.js/Express server, but for now we'll create
// a client-side solution that uses the service role key through a secure proxy

// For production, you should:
// 1. Create a backend API endpoint (Node.js/Express)
// 2. Use the service role key only on the server
// 3. Expose jobs through your own API

// Temporary development solution - create a secure API call
export const jobsAPI = {
  async getJobs(page = 1, limit = 10) {
    try {
      // In production, this would be your own API endpoint
      // const response = await fetch(`/api/jobs?page=${page}&limit=${limit}`);
      
      // For now, we'll use a mock approach with the data we know exists
      // This is a temporary solution until you set up proper RLS policies
      
      // Expanded mock data to demonstrate pagination
      const allMockJobs = [
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
        },
        {
          id: "4",
          title: "Software Engineer",
          description: "Develop and maintain web applications for various clients.",
          location: "Remote",
          job_type: "full_time",
          salary_range: "$70,000–$95,000",
          skills: ["JavaScript", "React", "Node.js"],
          responsibilities: ["Write code", "Debug applications", "Collaborate with team"],
          alumni_affiliation: "Posted by alumnus: Sarah Johnson (Class of 2015)",
          created_at: new Date().toISOString(),
          url: "https://example.com/software-engineer"
        },
        {
          id: "5",
          title: "Marketing Manager",
          description: "Lead marketing campaigns and brand strategy.",
          location: "Houston, TX",
          job_type: "full_time",
          salary_range: "$65,000–$85,000",
          skills: ["Marketing", "Strategy", "Analytics"],
          responsibilities: ["Plan campaigns", "Manage team", "Analyze metrics"],
          alumni_affiliation: "Posted by alumnus: Michael Chen (Class of 2012)",
          created_at: new Date().toISOString(),
          url: "https://example.com/marketing-manager"
        },
        {
          id: "6",
          title: "Data Analyst",
          description: "Analyze data and provide insights for business decisions.",
          location: "Austin, TX",
          job_type: "full_time",
          salary_range: "$60,000–$80,000",
          skills: ["Data Analysis", "SQL", "Python"],
          responsibilities: ["Analyze data", "Create reports", "Present findings"],
          alumni_affiliation: "Posted by alumnus: Emily Davis (Class of 2018)",
          created_at: new Date().toISOString(),
          url: "https://example.com/data-analyst"
        },
        {
          id: "7",
          title: "UX Designer",
          description: "Design user interfaces and improve user experience.",
          location: "Remote",
          job_type: "contract",
          salary_range: "$50,000–$70,000",
          skills: ["UI Design", "Figma", "User Research"],
          responsibilities: ["Design interfaces", "Conduct research", "Create prototypes"],
          alumni_affiliation: "Posted by alumnus: Alex Rivera (Class of 2017)",
          created_at: new Date().toISOString(),
          url: "https://example.com/ux-designer"
        },
        {
          id: "8",
          title: "Project Manager",
          description: "Manage projects and coordinate team efforts.",
          location: "Dallas, TX",
          job_type: "full_time",
          salary_range: "$75,000–$100,000",
          skills: ["Project Management", "Agile", "Communication"],
          responsibilities: ["Manage projects", "Coordinate teams", "Report progress"],
          alumni_affiliation: "Posted by alumnus: David Wilson (Class of 2014)",
          created_at: new Date().toISOString(),
          url: "https://example.com/project-manager"
        },
        {
          id: "9",
          title: "Sales Representative",
          description: "Drive sales and build client relationships.",
          location: "Houston, TX",
          job_type: "full_time",
          salary_range: "$45,000–$65,000",
          skills: ["Sales", "Communication", "CRM"],
          responsibilities: ["Generate leads", "Close deals", "Maintain relationships"],
          alumni_affiliation: "Posted by alumnus: Jessica Brown (Class of 2016)",
          created_at: new Date().toISOString(),
          url: "https://example.com/sales-rep"
        },
        {
          id: "10",
          title: "DevOps Engineer",
          description: "Manage deployment pipelines and infrastructure.",
          location: "Remote",
          job_type: "full_time",
          salary_range: "$85,000–$115,000",
          skills: ["DevOps", "AWS", "Docker"],
          responsibilities: ["Manage deployments", "Monitor systems", "Optimize infrastructure"],
          alumni_affiliation: "Posted by alumnus: Robert Taylor (Class of 2013)",
          created_at: new Date().toISOString(),
          url: "https://example.com/devops-engineer"
        },
        {
          id: "11",
          title: "Content Writer",
          description: "Create engaging content for various platforms.",
          location: "Austin, TX",
          job_type: "part_time",
          salary_range: "$35,000–$50,000",
          skills: ["Writing", "SEO", "Content Strategy"],
          responsibilities: ["Write content", "Research topics", "Optimize for SEO"],
          alumni_affiliation: "Posted by alumnus: Lisa Anderson (Class of 2019)",
          created_at: new Date().toISOString(),
          url: "https://example.com/content-writer"
        },
        {
          id: "12",
          title: "Business Analyst",
          description: "Analyze business processes and recommend improvements.",
          location: "Dallas, TX",
          job_type: "full_time",
          salary_range: "$70,000–$90,000",
          skills: ["Business Analysis", "Process Improvement", "Data Analysis"],
          responsibilities: ["Analyze processes", "Document requirements", "Recommend solutions"],
          alumni_affiliation: "Posted by alumnus: James Martinez (Class of 2011)",
          created_at: new Date().toISOString(),
          url: "https://example.com/business-analyst"
        }
      ];

      // Calculate pagination
      const startIndex = (page - 1) * limit;
      const endIndex = startIndex + limit;
      const paginatedJobs = allMockJobs.slice(startIndex, endIndex);

      return {
        jobs: paginatedJobs,
        pagination: {
          currentPage: page,
          totalPages: Math.ceil(allMockJobs.length / limit),
          totalJobs: allMockJobs.length,
          hasNextPage: endIndex < allMockJobs.length,
          hasPreviousPage: page > 1
        }
      };
    } catch (error) {
      console.error('Error fetching jobs:', error);
      throw error;
    }
  },

  async getJob(jobId) {
    const response = await this.getJobs(1, 100); // Get all jobs to find the specific one
    return response.jobs.find(job => job.id === jobId);
  }
};
