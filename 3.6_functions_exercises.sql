USE employees;
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya');
SELECT * FROM employees WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya';
SELECT * FROM employees WHERE gender='M' AND first_name='Irena' OR gender='M' AND first_name='Vidya' OR gender='M' AND first_name='Maya';
SELECT * FROM employees WHERE last_name LIKE 'E%';
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
SELECT * FROM employees WHERE birth_date LIKE '%12-25';
SELECT * FROM employees WHERE last_name LIKE '%q%';
SELECT * FROM employees WHERE last_name LIKE '%e' OR last_name LIKE 'e%';
SELECT * FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%';
SELECT * FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25';
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya') ORDER BY first_name;
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya') ORDER BY first_name, last_name;
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya') ORDER BY last_name, first_name;
SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no;
SELECT * FROM employees WHERE last_name LIKE '%e' OR last_name LIKE 'e%' ORDER BY emp_no;
SELECT * FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%' ORDER BY emp_no;
SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no DESC;
SELECT * FROM employees WHERE last_name LIKE '%e' OR last_name LIKE 'e%' ORDER BY emp_no DESC;
SELECT * FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%' ORDER BY emp_no DESC;
SELECT * FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25' ORDER BY birth_date, hire_date DESC;
SELECT UPPER(CONCAT(first_name,' ', last_name)) AS full_name FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%';
SELECT CONCAT(first_name,' ', last_name) AS full_name FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%';
SELECT datediff(hire_date, CURDATE()) FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25' ORDER BY birth_date, hire_date DESC;
SELECT * FROM salaries;
SELECT MIN(salary) FROM salaries;
SELECT MAX(salary) FROM salaries;
SELECT CONCAT(LOWER(SUBSTR(first_name,1,1)),LOWER(SUBSTR(last_name,1,4)),"_",LOWER(SUBSTR(birth_date,6,2)),LOWER(SUBSTR(birth_date,3,2)))AS username FROM employees;