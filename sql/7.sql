WITH diff_cte AS (
    SELECT
        t.customer_id,
        c.first_name,
        c.last_name,
        c.job_title,
        (
            t.transaction_date::date
            - LAG(t.transaction_date) OVER (
                PARTITION BY t.customer_id
                ORDER BY t.transaction_date
            )::date
        ) AS diff_in_days
    FROM transaction t
    JOIN customer c ON t.customer_id = c.customer_id
),
max_interval AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        job_title,
        MAX(diff_in_days) AS max_diff,
        COUNT(*) AS txn_count
    FROM diff_cte
    GROUP BY
        customer_id,
        first_name,
        last_name,
        job_title
)
SELECT
    first_name,
    last_name,
    job_title,
    max_diff
FROM max_interval
WHERE txn_count > 1
ORDER BY max_diff DESC
LIMIT 10;
