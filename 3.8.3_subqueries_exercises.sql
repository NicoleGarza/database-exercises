USE employees;
SELECT * FROM employees;
SELECT * FROM employees WHERE hire_date IN (SELECT hire_date FROM employees WHERE emp_no=101010);

SELECT title FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name='Aamod');

SELECT COUNT(*) FROM employees WHERE emp_no NOT IN (SELECT emp_no FROM dept_emp WHERE to_date>NOW());

SELECT first_name, last_name FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE gender='F' AND to_date>NOW());

SELECT first_name, last_name, salary FROM employees JOIN salaries ON employees.emp_no=salaries.emp_no WHERE salaries.to_date>NOW() AND salaries.salary>(SELECT AVG(salary) FROM salaries);

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary > (SELECT 
            MAX(salary) - STD(salary)
        FROM
            salaries) AND to_date>NOW();

SELECT dept_name FROM departments WHERE dept_no IN (SELECT dept_no FROM dept_manager WHERE emp_no IN (SELECT emp_no FROM employees WHERE gender='F')AND to_date>NOW());

SELECT emp_no FROM salaries WHERE salary=(SELECT MAX(salary) FROM salaries);
SELECT first_name, last_name FROM employees WHERE emp_no=(SELECT emp_no FROM salaries WHERE salary =(SELECT MAX(salary) FROM salaries));
SELECT first_name, LAst_name FROM employees WHERE emp_no=(SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 1);
--Department name that the employee with the highest salary works in:
SELECT dept_name FROM departments WHERE dept_no=(SELECT dept_no FROM dept_emp WHERE emp_no=(SELECT emp_no FROM employees WHERE emp_no=(SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 1)));