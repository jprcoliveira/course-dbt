WITH A AS (select
    user_id,
    COUNT (DISTINCT order_id) as total_orders,
    MIN (created_at) as date_first_order
FROM {{ ref('stg_postgres__orders')}}
GROUP BY 1)

SELECT
user_id,
date_first_order
FROM A
WHERE total_orders >1