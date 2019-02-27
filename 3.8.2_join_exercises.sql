
SELECT * FROM users JOIN roles ON users.role_id=roles.id;
SELECT * FROM roles LEFT JOIN users ON roles.id=users.role_id;

USE join_example_db;
SELECT * FROM users;
SELECT * FROM roles;
SELECT * FROM users JOIN roles ON users.role_id=roles.id;
SELECT * FROM users LEFT JOIN roles ON users.role_id=roles.id;
SELECT * FROM users RIGHT JOIN roles ON users.role_id=roles.id;

USE employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT departments.dept_name AS Department_Name, CONCAT(employees.first_name, ' ',employees.last_name) AS Department_Manager FROM departments JOIN dept_manager ON departments.dept_no=dept_manager.dept_no JOIN dept_emp ON dept_emp.emp_no=dept_manager.emp_no JOIN employees ON employees.emp_no=dept_emp.emp_no WHERE dept_manager.to_date LIKE '9999%';
SELECT departments.dept_name AS Department_Name, CONCAT(employees.first_name, ' ',employees.last_name) AS Manager_Name FROM departments JOIN dept_manager ON departments.dept_no=dept_manager.dept_no JOIN dept_emp ON dept_emp.emp_no=dept_manager.emp_no JOIN employees ON employees.emp_no=dept_emp.emp_no WHERE dept_manager.to_date LIKE '9999%' AND employees.gender='F';
SELECT titles.title, COUNT(titles.title) FROM employees JOIN titles ON titles.emp_no=employees.emp_no JOIN dept_emp ON dept_emp.emp_no=employees.emp_no JOIN departments ON departments.dept_no=dept_emp.dept_no WHERE titles.to_date >'9999%' AND departments.dept_name='Customer Service' GROUP BY titles.title;
SELECT departments.dept_name AS Department_Name, CONCAT(employees.first_name, ' ',employees.last_name) AS Manager_Name, salaries.salary FROM departments JOIN dept_manager ON departments.dept_no=dept_manager.dept_no JOIN dept_emp ON dept_emp.emp_no=dept_manager.emp_no JOIN employees ON employees.emp_no=dept_emp.emp_no JOIN salaries ON salaries.emp_no=dept_emp.emp_no WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%';
SELECT departments.dept_no, departments.dept_name, COUNT(*) FROM departments JOIN dept_emp ON departments.dept_no=dept_emp.dept_no WHERE dept_emp.to_date LIKE '9999%' GROUP BY departments.dept_name;
SELECT departments.dept_name, AVG(salaries.salary) FROM salaries JOIN dept_emp ON salaries.emp_no=dept_emp.emp_no JOIN departments ON departments.dept_no=dept_emp.dept_no WHERE dept_emp.to_date LIKE '9999%' AND salaries.to_date>NOW() GROUP BY departments.dept_name ORDER BY AVG(salaries.salary) DESC LIMIT 1;
SELECT employees.first_name, employees.last_name FROM salaries JOIN dept_emp ON salaries.emp_no=dept_emp.emp_no JOIN departments ON departments.dept_no=dept_emp.dept_no JOIN employees ON employees.emp_no=dept_emp.emp_no WHERE dept_emp.to_date LIKE '9999%' AND salaries.to_date>NOW() AND dept_name='Marketing' ORDER BY salaries.salary DESC LIMIT 1;
SELECT employees.first_name, employees.last_name, salaries.salary, departments.dept_name FROM dept_manager JOIN salaries ON dept_manager.emp_no=salaries.emp_no JOIN employees ON employees.emp_no=salaries.emp_no JOIN departments ON departments.dept_no=dept_manager.dept_no WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date>NOW() ORDER BY salaries.salary DESC LIMIT 1;
SELECT CONCAT(employees.first_name,' ',last_name) as 'Employee Name', departments.dept_name as 'Department Name', CONCAT(m.first_name,' ',last_name) AS 'Manager Name' FROM employees JOIN dept_emp ON employees.emp_no=dept_emp.emp_no JOIN departments ON dept_emp.dept_no=departments.dept_no JOIN dept_manager ON departments.dept_no=dept_manager.dept_no JOIN employees m ON dept_manager.emp_no=m.emp_no WHERE dept_emp.to_date>NOW() AND dept_manager.to_date>NOW() LIMIT 10;