WITH top_payings_job as (

SELECT
job_id,
job_title,
salary_year_avg,
company_dim.name AS COMPANY_NAMES
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst'
AND job_location = 'Anywhere'
AND salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT top_payings_job.*,skills FROM top_payings_job
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_payings_job.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC




/*
The top skills in demand based on the dataset are:

SQL - 8 mentions
Python - 7 mentions
Tableau - 6 mentions
R - 4 mentions
Snowflake - 3 mentions
Pandas - 3 mentions
Excel - 3 mentions
Azure - 2 mentions
Bitbucket - 2 mentions
Go - 2 mentions
These skills are highly sought after in the job market according to the data provided.
*/