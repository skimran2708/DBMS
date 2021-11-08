SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE 'L%'
UNION 
SELECT first_name, last_name 
FROM customer
WHERE last_name LIKE 'L%';