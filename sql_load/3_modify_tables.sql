
copy company_dim FROM 'C:\Arturwork\SQL_Project_Job_Analysis\csv_files\company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

copy skills_dim FROM 'C:\Arturwork\SQL_Project_Job_Analysis\csv_files\skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

copy job_postings_fact FROM 'C:\Arturwork\SQL_Project_Job_Analysis\csv_files\job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

copy skills_job_dim FROM 'C:\Arturwork\SQL_Project_Job_Analysis\csv_files\skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
