/*
Which skills command the highest salaries?
- Calculate the average salary associated with each skill for Business Analyst roles.
- Include only postings with a stated salary, irrespective of location.
- Shows how different skills influence pay levels for Business Analysts,
  helping to pinpoint the most financially rewarding skills to learn or improve.
*/
SELECT
    skills,
    round(avg(salary_year_avg), 0) as salary_average
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg is not null
group by
    skills
ORDER BY
    salary_average DESC
LIMIT 25

/*
Here’s the ultra-brief version for Business Analyst roles:
Top pay = hybrid BA + data/engineering. Highest salaries are tied to skills like Python (NumPy/Pandas/scikit-learn/TensorFlow/PyTorch) plus data platforms (Hadoop, Snowflake, NoSQL/MongoDB, Cassandra, Elasticsearch).
Python stack dominates across the list; strong signal to get hands-on with coding, not just BI.
Pipelines matter: Airflow shows a premium for owning data workflows.
Outliers (e.g., Chef $220k, Phoenix/Ruby/C/Julia) are dev-leaning roles rather than classic BA.
Centre of gravity ≈ $120k — not just a few spikes.
*/

/*
[
  {
    "skills": "chef",
    "salary_average": "220000"
  },
  {
    "skills": "numpy",
    "salary_average": "157500"
  },
  {
    "skills": "ruby",
    "salary_average": "150000"
  },
  {
    "skills": "hadoop",
    "salary_average": "139201"
  },
  {
    "skills": "julia",
    "salary_average": "136100"
  },
  {
    "skills": "airflow",
    "salary_average": "135410"
  },
  {
    "skills": "phoenix",
    "salary_average": "135248"
  },
  {
    "skills": "electron",
    "salary_average": "131000"
  },
  {
    "skills": "c",
    "salary_average": "123329"
  },
  {
    "skills": "pytorch",
    "salary_average": "120333"
  },
  {
    "skills": "tensorflow",
    "salary_average": "120333"
  },
  {
    "skills": "seaborn",
    "salary_average": "120000"
  },
  {
    "skills": "matlab",
    "salary_average": "120000"
  },
  {
    "skills": "matplotlib",
    "salary_average": "120000"
  },
  {
    "skills": "scikit-learn",
    "salary_average": "120000"
  },
  {
    "skills": "nosql",
    "salary_average": "119330"
  },
  {
    "skills": "mongodb",
    "salary_average": "118667"
  },
  {
    "skills": "snowflake",
    "salary_average": "112543"
  },
  {
    "skills": "looker",
    "salary_average": "110581"
  },
  {
    "skills": "pandas",
    "salary_average": "110558"
  },
  {
    "skills": "node.js",
    "salary_average": "110000"
  },
  {
    "skills": "elasticsearch",
    "salary_average": "110000"
  },
  {
    "skills": "mxnet",
    "salary_average": "110000"
  },
  {
    "skills": "chainer",
    "salary_average": "110000"
  },
  {
    "skills": "cassandra",
    "salary_average": "108488"
  }
]
*/