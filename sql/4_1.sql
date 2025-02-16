SELECT
    t.customer_id,
    SUM(t.list_price) AS total_price,
    MAX(t.list_price) AS max_price,
    MIN(t.list_price) AS min_price,
    COUNT(*) AS txn_count
FROM transaction t
GROUP BY t.customer_id
ORDER BY total_price DESC, txn_count DESC;
