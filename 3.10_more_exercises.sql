USE sakila;
SELECT * FROM actor;
SELECT LOWER(first_name),LOWER(last_name) FROM actor;
SELECT actor_id, first_name, last_name FROM actor WHERE first_name='Joe';
SELECT * FROM actor WHERE last_name LIKE '%gen%';
SELECT * FROM actor WHERE last_name LIKE '%li%' ORDER BY last_name, first_name;
SELECT * FROM country;
SELECT country_id, country FROM country WHERE country IN ('Afghanistan','Bangladesh','China');
SELECT COUNT(last_name),last_name FROM actor GROUP BY last_name;