SELECT c.name, sum(p.amount)
FROM payment p RIGHT OUTER JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY c.name;