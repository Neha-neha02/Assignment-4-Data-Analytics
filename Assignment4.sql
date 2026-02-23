
-- ==========================================
-- Assignment 4 – Data Analytics (SQL)
-- Name: Neha
-- Institute: LIET
-- Date: 23 February 2026
-- ==========================================


CREATE TABLE employees (
id SERIAL PRIMARY KEY,
name VARCHAR(50),
salary INT,
department VARCHAR(50),
commission INT,
job_role VARCHAR(50)
);

: INSERT INTO employees (name, salary, department, commission, job_role) VALUES
('Aman',50000,'IT',NULL,'Developer'),
('Riya',60000,'HR',5000,'Manager'),
('Rahul',45000,'IT',NULL,'Developer'),
('Sneha',70000,'Finance',7000,'Analyst'),
('Karan',55000,'IT',3000,'Tester'),
('Meena',80000,'HR',NULL,'Manager');


CREATE TABLE students (
id SERIAL PRIMARY KEY,
name VARCHAR(50),
marks INT
);

INSERT INTO students (name, marks) VALUES
('Arjun',75),
('Priya',65),
('Rohit',35),
('Anjali',85),
('Kavya',55);


CREATE TABLE sales (
region VARCHAR(50),
amount INT
);


INSERT INTO sales VALUES
('North',30000),
('North',25000),
('South',40000),
('South',15000),
('East',20000),
('West',60000);


-- Q1: Employees earning more than average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Explanation:
-- Subquery calculates the average salary.
-- Outer query selects employees whose salary is greater than that average.



-- Q2: Top 5 highest-paid employees
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Explanation:
-- ORDER BY DESC sorts salaries from highest to lowest.
-- LIMIT 5 returns top 5 records.



-- Q3: Total employees, average, minimum and maximum salary
SELECT 
COUNT(*) AS total_employees,
AVG(salary) AS avg_salary,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary
FROM employees;

-- Explanation:
-- Aggregate functions operate on multiple rows and return a single value.
-- Scalar functions operate on single values.



-- Q4: Total sales per region where sales > 50000
SELECT region, SUM(amount) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(amount) > 50000;

-- Explanation:
-- GROUP BY groups data by region.
-- HAVING filters grouped results.



-- Q5: Number of unique job roles
SELECT COUNT(DISTINCT job_role) AS unique_roles
FROM employees;

-- Explanation:
-- DISTINCT removes duplicate job roles before counting.



-- Q6: Students scoring between 60 and 80

-- Method 1
SELECT *
FROM students
WHERE marks >= 60 AND marks <= 80;

-- Method 2
SELECT *
FROM students
WHERE marks BETWEEN 60 AND 80;

-- Explanation:
-- BETWEEN includes both 60 and 80.



-- Q7: Employees whose commission is NULL
SELECT *
FROM employees
WHERE commission IS NULL;

-- Explanation:
-- IS NULL is used to check NULL values.



-- Q8: Increase salary of IT department by 10%
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT';

-- Explanation:
-- SQL supports arithmetic operators like +, -, *, /.



-- Q9: Delete students who scored less than 40
DELETE FROM students
WHERE marks < 40;

-- Precaution:
-- Always run SELECT first before DELETE to verify records.



-- Q10: Employees earning more than department average
SELECT name, salary, department
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- Explanation:
-- This is a correlated subquery.
-- It calculates department-wise average salary.
