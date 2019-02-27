SHOW databases;
USE ada_670;
SHOW TABLES;
CREATE TABLE my_numbers(id INT UNSIGNED NOT NULL AUTO_INCREMENT, n INT UNSIGNED NOT NULL, PRIMARY KEY(id));
INSERT INTO my_numbers(n) VALUES(1),(123),(45),(42);
SELECT * FROM my_numbers;

--change data in our new table
UPDATE my_numbers SET n=n-1;
UPDATE my_numbers SET n=n*2<100;

--delete data in our new table
DELETE FROM my_numbers WHERE n=0;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT * FROM employees_with_departments;
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);
UPDATE employees_with_departments SET full_name=CONCAT(first_name,' ',Last_name);
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

CREATE TEMPORARY TABLE payment_sakila AS
SELECT * FROM sakila.payment;
SELECT * FROM payment_sakila;
ALTER TABLE payment_sakila ADD amount2 INT UNSIGNED;
UPDATE payment_sakila SET amount2 = amount*100;

DESCRIBE employees_with_departments;

# OPTION 1: create a temp table 
CREATE TEMPORARY TABLE agg AS
SELECT AVG(salary) AS avg_salary, STDDEV(salary) AS stdev_salary
FROM employees.salaries
WHERE to_date > NOW();

# SELECT * FROM agg;

SELECT a.dept_name, AVG(a.z_salary) AS avg_z_salary
FROM  (
SELECT d.dept_name, s.emp_no, s.salary, ((s.salary-a.avg_salary)/a.stdev_salary) AS z_salary
	FROM employees.salaries s
	JOIN agg a
	JOIN employees.dept_emp de ON s.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
	WHERE s.to_date > NOW()
	) a
GROUP BY a.dept_name; 