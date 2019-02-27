USE employees;
SELECT DISTINCT title FROM titles;
SELECT last_name FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%' GROUP BY last_name;
SELECT last_name, first_name FROM employees WHERE last_name LIKE '%e' AND last_name LIKE 'e%' GROUP BY last_name, first_name;
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
SELECT last_name, COUNT(last_name) FROM employees GROUP BY last_name ORDER BY COUNT(last_name) DESC;
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name ORDER BY COUNT(first_name)DESC;
SELECT first_name, last_name, COUNT(*) FROM employees GROUP BY first_name, last_name;
SELECT CONCAT(first_name,' ',last_name), COUNT(*) FROM employees GROUP BY CONCAT(first_name,' ',last_name) ORDER BY COUNT(*) DESC;
SELECT COUNT(*),gender FROM employees WHERE first_name IN ('Irena','Vidya','Maya') GROUP BY gender;
SELECT COUNT(*) FROM (SELECT username, COUNT(*) AS count FROM (SELECT CONCAT(LOWER(SUBSTR(first_name,1,1)),LOWER(SUBSTR(last_name,1,4)),"_",LOWER(SUBSTR(birth_date,6,2)),LOWER(SUBSTR(birth_date,3,2))) AS username FROM employees) GROUP BY username)AS username_counts WHERE count>1;