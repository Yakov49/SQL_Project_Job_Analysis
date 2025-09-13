/*Which Business Analyst roles pay the most?
- List the 10 highest-paid remote Business Analyst positions.
- Include only postings with an explicit salary (exclude NULL/unspecified).
- Purpose: spotlight top-paying BA opportunities and inform job seekers.
*/
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;