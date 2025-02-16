SELECT 
    DATE_TRUNC('month', t.transaction_date)::DATE AS month, 
    c.job_industry_category,
    SUM(t.list_price) AS total_transactions
FROM transaction t
JOIN customer c ON t.customer_id = c.customer_id
GROUP BY month, c.job_industry_category
ORDER BY month, c.job_industry_category;