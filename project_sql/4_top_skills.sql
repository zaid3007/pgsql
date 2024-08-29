SELECT
skills,
round(avg(job_postings_fact.salary_year_avg),0) as salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim 
ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg is NOT NULL
AND  job_title_short = 'Data Analyst'
AND  job_location = 'Anywhere'
GROUP BY skills
ORDER BY salary_avg DESC
LIMIT 25



/*Here's a concise summary of the trends and insights:

Top-Paying Skills: PySpark ($208,172),
 Bitbucket ($189,155),
  and Couchbase ($160,515) command the highest salaries,
   indicating strong demand for big data,
    version control, and NoSQL skills.

Emerging Technologies:
 High salaries for DataRobot ($155,486)
  and
   Databricks ($141,907)
    show growing demand for new tools in machine learning and big data.

Popular Tools:
 GitLab ($154,500),
  Jupyter ($152,777),
   and Pandas ($151,821)
    reflect the value of expertise in widely used open-source tools.

Cloud and DevOps:
 Kubernetes ($132,500) and GCP ($122,500) highlight the importance of cloud and containerization skills.

Programming Languages: Swift ($153,750) and Golang ($145,000) are highly valued, indicating strong demand for mobile and backend development skills.

Focusing on these high-demand skills and emerging technologies can lead to higher salaries in the tech industry.
*/