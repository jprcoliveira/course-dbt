SELECT
order_id,
oi.product_id,
p.name as product_name
FROM {{ ref('stg_postgres_order__items')}} as oi
LEFT JOIN {{ ref('stg_postgres__products')}} as p ON oi.product_id = p.product_id