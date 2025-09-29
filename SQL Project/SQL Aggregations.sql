-- 1. Count the number of employees in each department
-- This query groups employees by department_id and counts how many employees exist in each.
SELECT department_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY department_id;


-- 2. Find the average salary in each department
-- This query calculates the average salary for employees in each department.
SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id;


-- 3. Find the maximum and minimum salary in each department
-- This query finds the highest and lowest salaries for each department.
SELECT department_id, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM hr.employees
GROUP BY department_id;


-- 4. Find the total salary paid in each department
-- This query sums up all employee salaries in each department.
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id;


-- 5. Count the number of employees in each job role
-- This query counts the number of employees who have the same job role.
SELECT job_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY job_id;
