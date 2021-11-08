SELECT f.title 
FROM film_actor fa 
INNER JOIN actor a 
ON a.actor_id =f a.actor_id 
INNER JOIN film f 
ON f.film_id = fa.film_id 
WHERE a.first_name = "JOHN";


(OR)


SELECT f.title 
FROM film f 
INNER JOIN 
    (SELECT fa.film_id 
    FROM film_actor fa 
    INNER JOIN actor a 
    ON a.actor_id=fa.actor_id 
    WHERE a.first_name="JOHN") fn 
ON f.film_id=fn.film_id;