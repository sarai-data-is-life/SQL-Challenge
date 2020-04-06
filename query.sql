SELECT * FROM departments
SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries
SELECT * FROM titles

-- Solving for Homework questions:
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
	e.emp_no, 
	e.last_name,
	e.first_name, 
	e.gender, 
	s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT * 
FROM employees 
WHERE hire_date 
BETWEEN  '1986-01-01' AND '1986-12-31'

-- 3a. List the manager of each department with the following information:
-- 3b. department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
SELECT 
	e.emp_no, 
	dm.dept_no, 
	e.first_name, 
	e.last_name, 
	e.hire_date, 
	dm.FROM_date, 
	dm.to_date
FROM dept_manager dm
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN employees e
on dm.emp_no = e.emp_no
		
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	e.emp_no, 
	e.last_name,
	 e.first_name, 
	d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
			   
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name like 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees e
JOIN dept_emp de
ON E.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales', 'Development')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name, 
	count (last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC

-- APRIL FOOLS
SELECT * FROM employees WHERE emp_no =  '499942'