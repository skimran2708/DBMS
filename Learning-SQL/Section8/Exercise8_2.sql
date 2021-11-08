SELECT customer_id, COUNT(*) No_of_payments, SUM(Amount) Total_Amount
FROM payment 
GROUP BY customer_id;