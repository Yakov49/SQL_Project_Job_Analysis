/*
Which skills are best to learn—those both in high demand and well-paid?
- Identify skills with strong demand and high average salaries for Business Analyst roles.
- Focus on remote roles that include a stated salary.
- Pinpoints skills that combine job security (high demand) with strong financial returns (high salaries),
  offering practical guidance for career development in business analysis.
*/

WITH skills_demand as (
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg is not null
group by
    skills_dim.skill_id
), salary_average as (
SELECT
    skills_job_dim.skill_id,
    round(avg(salary_year_avg), 0) as salary_average
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg is not null
group by
    skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    salary_average
FROM
    skills_demand
INNER JOIN salary_average on skills_demand.skill_id = salary_average.skill_id
WHERE
    demand_count > 25
ORDER BY
     salary_average DESC,
    demand_count DESC
LIMIT 25;

/*
[
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "34",
    "salary_average": "112543"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "73",
    "salary_average": "105969"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "33",
    "salary_average": "105701"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "143",
    "salary_average": "104277"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "37",
    "salary_average": "100308"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "37",
    "salary_average": "100308"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "212",
    "salary_average": "98794"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "312",
    "salary_average": "95292"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "salary_average": "93139"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "51",
    "salary_average": "92445"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "139",
    "salary_average": "92059"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "30",
    "salary_average": "89868"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "74",
    "salary_average": "88182"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "226",
    "salary_average": "87212"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "51",
    "salary_average": "87075"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demand_count": "34",
    "salary_average": "86547"
  }
]
*/