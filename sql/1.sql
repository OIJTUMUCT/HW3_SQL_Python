SELECT COUNT(customer_ID), job_industry_category
FROM customer
GROUP BY job_industry_category
ORDER BY COUNT(customer_ID) DESC;