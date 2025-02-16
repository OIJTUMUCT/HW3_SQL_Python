SELECT
    first_name,
    last_name,
    total_spent
FROM (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(t.list_price) AS total_spent,
        RANK() OVER (ORDER BY SUM(t.list_price) ASC) AS min_rank
    FROM transaction t
    JOIN customer c 
      ON t.customer_id = c.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) subquery
WHERE min_rank = 1;
