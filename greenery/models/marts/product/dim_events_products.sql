SELECT
event_id,
session_id,
user_id,
page_url,
e.created_at as event_created_at,
event_type,
order_id,
e.product_id,
name as product_name,
FROM {{ ref('stg_postgres__events')}} as e
LEFT JOIN {{ ref('stg_postgres__products')}} as p ON e.product_id = p.product_id