WITH cte AS (
    SELECT
        t.*,
        SUM(t.list_price) OVER (PARTITION BY t.customer_id) AS total_price,
        MAX(t.list_price) OVER (PARTITION BY t.customer_id) AS max_price,
        MIN(t.list_price) OVER (PARTITION BY t.customer_id) AS min_price,
        COUNT(*)       OVER (PARTITION BY t.customer_id) AS txn_count,
        ROW_NUMBER()   OVER (PARTITION BY t.customer_id ORDER BY t.customer_id) AS rn
    FROM transaction t
)
SELECT
    customer_id,
    total_price,
    max_price,
    min_price,
    txn_count
FROM cte
WHERE rn = 1
ORDER BY total_price DESC, txn_count DESC;