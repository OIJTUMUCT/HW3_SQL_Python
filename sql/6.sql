SELECT
    sub.customer_id,
    sub.transaction_id,
    sub.transaction_date,
    sub.list_price
FROM (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY t.customer_id
            ORDER BY t.transaction_date ASC
        ) AS rn
    FROM transaction t
) sub
WHERE sub.rn = 1;