WITH order_items as
(SELECT *  FROM {{ ref('dim_order_items_products')}}),

events as 
(SELECT * FROM {{ ref('dim_events_products')}}),

session_timing_agg as 
(SELECT * FROM {{ ref('int_session_timing_agg')}}),

repeated_users AS
(SELECT * FROM {{ ref('dim_repeated_users')}})


SELECT 
e.session_id,
e.user_id,
oi.product_id as ordered_product_id,
oi.product_name as ordered_product_name,
e.product_id as product_viewed_id,
e.product_name as product_viewed_name,
st.session_start,
st.session_end,
CASE WHEN ru.date_first_order < st.session_start THEN true else false end as repeated_user,
SUM (CASE when e.event_type = 'page_view' THEN 1 ELSE 0 END) as page_views,
SUM (CASE when e.event_type = 'add_to_cart' THEN 1 ELSE 0 END) as add_to_carts,
SUM (CASE when e.event_type = 'checkout' THEN 1 ELSE 0 END) as checkouts,
SUM (CASE when e.event_type = 'package_shipped' THEN 1 ELSE 0 END) as packages_shipped,
datediff ("minute",session_start,session_end) as session_length_minutes,
FROM events as e
RIGHT JOIN order_items as oi on oi.order_id = e.order_id 
JOIN session_timing_agg as st on st.session_id = e.session_id
JOIN repeated_users as ru on ru.user_id = e.user_id
WHERE e.product_id is null
GROUP BY 1,2,3,4,5,6,7,8,9
