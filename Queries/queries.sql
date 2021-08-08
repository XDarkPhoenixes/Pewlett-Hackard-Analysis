-- queries
SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM dept_manager;

SELECT * FROM salaries;

SELECT * FROM dept_emp;

-- Drop Tables
DROP TABLE title CASCADE;

-- 7.3.1 
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name 
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- save in a new table retirement_info
SELECT first_name, last_name 
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- 7.3.2
DROP TABLE retirement_info;
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name 
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

--7.3.3
-- Joining departments and dept_manager tables
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- 7.3.4 Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_retiring_number
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- 7.3.5 
-- Create emp_info table
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender, 
	s.salary, 
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;

-- List of manager per department
SELECT dm.dept_no,
       d.dept_name,
	   dm.emp_no,
	   ce.last_name,
	   ce.first_name,
	   dm.from_date,
	   dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
ON (dm.emp_no = ce.emp_no);
	   
SELECT * FROM manager_info;

-- Create a table of department retirees
SELECT ce.emp_no,
	   ce.first_name,
	   ce.last_name,
	   d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM dept_info;

-- 7.3.6 Skill drill 1
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   d.dept_name
FROM retirement_info AS ri
INNER JOIN dept_emp AS de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales')
 
-- 7.3.6 Skill drill 2
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   d.dept_name
FROM retirement_info AS ri
INNER JOIN dept_emp AS de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name IN ('Sales', 'Development'))
-- WHERE d.dept_name = 'Sales' 
-- OR d.dept_name = 'Development'
-- ORDER BY d.dept_name;


-- Additional queries for Deliverable 3
SELECT * FROM retirement_titles;
SELECT * FROM unique_titles;
SELECT * FROM retiring_titles;
SELECT * FROM mentorship_eligibilty;

SELECT sum(count)
FROM retiring_titles;

SELECT count(title), title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(title) DESC;
