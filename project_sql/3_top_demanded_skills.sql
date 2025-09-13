/*
Which skills are most in demand for Business Analysts?
- Join job postings with the skills table (inner join, as in Query 2).
- Aggregate across all postings and rank skills by frequency.
- Return the top five skills for Business Analysts.
- Identifies the five most sought-after skills in the current labour market,
  providing clear guidance for candidates and hiring teams.
*/

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
group by
    skills
ORDER BY
    demand_count DESC
LIMIT 5

