
  SELECT
    company_dim.name AS COMPANY_NAMES,
     skills_job_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand,
    round(avg(salary_year_avg)) as avg_salary
  FROM 
    job_postings_fact
  INNER JOIN
    company_dim ON company_dim.company_id = job_postings_fact.company_id
  INNER JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
  INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
  WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.job_location = 'Anywhere'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_health_insurance = TRUE
  GROUP BY 
    company_dim.name, skills_dim.skills,skills_job_dim.skill_id
 
HAVING COUNT(skills_job_dim.job_id) > 20
  ORDER BY 
    demand DESC
  LIMIT 10

/*
1. **Top Skills:**
   - **SQL:** 86 demand, $91,733 salary
   - **Python:** 50 demand, $93,960 salary

2. **Highest Salary:**
   - **R:** $98,000 salary
   - **Power BI:** $96,714 salary

3. **Balanced Skills:**
   - **Tableau:** $92,714 salary
   - **Excel:** $84,198 salary

4. **Key Focus Areas:**
   - SQL, Python, R, and data visualization tools like Power BI and Tableau are valuable in the job market due to their strong demand and competitive salaries.
*/