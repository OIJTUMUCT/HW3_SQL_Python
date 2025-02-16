SELECT brand, COUNT(transaction_id) AS online_order_count
FROM transaction
JOIN customer ON transaction.customer_id = customer.customer_id
WHERE job_industry_category = 'IT' AND order_status = 'Approved' AND online_order = TRUE
GROUP BY brand
ORDER BY online_order_count DESC;