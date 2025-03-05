WITH cte AS (
    SELECT
        t.*,
        SUM(t.list_price) OVER (PARTITION BY t.customer_id) AS total_price,
        MAX(t.list_price) OVER (PARTITION BY t.customer_id) AS max_price,
        MIN(t.list_price) OVER (PARTITION BY t.customer_id) AS min_price,
        COUNT(*)       OVER (PARTITION BY t.customer_id) AS txn_count
    FROM transaction t
)
SELECT 
    customer_id,
    total_price,
    max_price,
    min_price,
    txn_count
FROM cte
ORDER BY total_price DESC, txn_count DESC;