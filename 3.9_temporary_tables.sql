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

CREATE TEMPORARY TABLE department_average_pay AS SELECT dept_name,salary,emp_no, dept_no FROM employees.salaries JOIN employees.dept_emp USING(emp_no) JOIN employees.departments USING(dept_no) WHERE salaries.to_date>NOW();

ALTER TABLE department_average_pay ADD avg_salary1 decimal (14,4);
ALTER TABLE department_average_pay ADD STD_salary1 decimal (14,4);
ALTER TABLE department_average_pay ADD salary_z_score1 decimal (14,4);

UPDATE department_average_pay SET avg_salary1 = (SELECT AVG(salary) FROM employees.salaries);
UPDATE department_average_pay SET STD_salary1 = (SELECT STD(salary) FROM employees.salaries);
UPDATE department_average_pay SET salary_z_score1 = (salary-avg_salary1)/STD_salary1;

SELECT dept_name, salary-avg_salary/STD_salary AS salary_z_score FROM department_average_pay;

SELECT dept_name, AVG(salary_z_score1) FROM department_average_pay GROUP BY dept_name;