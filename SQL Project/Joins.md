#  Oracle SQL Queries Using Different Types of Joins on Employee Table

This document contains **30 practical Oracle SQL queries** demonstrating the use of various **JOIN types** on an `employees` table and related tables (`departments`, `projects`, `jobs`, etc.).

# SQL JOIN Practice Queries

# 1. INNER JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

# 2. LEFT JOIN (include employees without department)
SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

# 3. RIGHT JOIN (include departments without employees)
SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

# 4. FULL OUTER JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

# 5. Employees without departments
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

# 6. Departments with no employees
SELECT d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

# 7. SELF JOIN (employees with their managers)
SELECT e.employee_id, e.employee_name, m.employee_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

# 8. Employees with job title
SELECT e.employee_id, e.employee_name, j.job_title
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id;

# 9. Employees with department location
SELECT e.employee_id, e.employee_name, d.department_name, l.city
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;

# 10. Employees and their projects
SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
INNER JOIN projects p ON e.employee_id = p.employee_id;

# 11. Employees without projects
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN projects p ON e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

# 12. Projects and departments
SELECT p.project_name, d.department_name
FROM projects p
INNER JOIN departments d ON p.department_id = d.department_id;

# 13. Employees with training programs
SELECT e.employee_id, e.employee_name, t.training_name
FROM employees e
INNER JOIN training_programs t ON e.training_id = t.training_id;

# 14. Employees without training
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN training_programs t ON e.training_id = t.training_id
WHERE t.training_id IS NULL;

# 15. Employees with shift timings
SELECT e.employee_id, e.employee_name, s.shift_timing
FROM employees e
INNER JOIN shifts s ON e.shift_id = s.shift_id;

# 16. Employees without shift
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN shifts s ON e.shift_id = s.shift_id
WHERE s.shift_id IS NULL;

# 17. Employees with departments & projects
SELECT e.employee_id, e.employee_name, d.department_name, p.project_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN projects p ON e.employee_id = p.employee_id;

# 18. Employees with more than one project
SELECT e.employee_id, e.employee_name, COUNT(p.project_id) AS project_count
FROM employees e
INNER JOIN projects p ON e.employee_id = p.employee_id
GROUP BY e.employee_id, e.employee_name
HAVING COUNT(p.project_id) > 1;

# 19. Employees with department budget
SELECT e.employee_id, e.employee_name, e.salary, d.budget
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

# 20. Employees earning above dept avg
SELECT e.employee_id, e.employee_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

# 21. Employees with same job role
SELECT e1.employee_id, e1.employee_name, e2.employee_name AS coworker_name, e1.job_id
FROM employees e1
INNER JOIN employees e2 ON e1.job_id = e2.job_id AND e1.employee_id <> e2.employee_id;

# 22. Employees with dept name (or 'Not Assigned')
SELECT e.employee_id, e.employee_name, COALESCE(d.department_name, 'Not Assigned') AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

# 23. Employees & projects (FULL OUTER)
SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
FULL OUTER JOIN projects p ON e.employee_id = p.employee_id;

# 24. Employees working in their dept city
SELECT e.employee_id, e.employee_name, l.city
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;

# 25. Employees with total bonus
SELECT e.employee_id, e.employee_name, SUM(b.bonus_amount) AS total_bonus
FROM employees e
INNER JOIN bonuses b ON e.employee_id = b.employee_id
GROUP BY e.employee_id, e.employee_name;

# 26. Employees without bonus
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN bonuses b ON e.employee_id = b.employee_id
WHERE b.bonus_amount IS NULL;

# 27. Employees by region
SELECT e.employee_id, e.employee_name, d.department_name, r.region_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
INNER JOIN regions r ON l.region_id = r.region_id;

# 28. Employees and projects (LEFT JOIN)
SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.employee_id = p.employee_id;

# 29. Department employee count
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

# 30. Employees on projects in different cities
SELECT e.employee_id, e.employee_name, d.department_name, p.project_name, l.city AS project_city
FROM employees e
I


