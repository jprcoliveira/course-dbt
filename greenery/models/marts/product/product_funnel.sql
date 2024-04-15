WITH events as 
(SELECT * FROM {{ ref('dim_events_products')}}),

session_agg as 
(SELECT 
e.session_id,
SUM (CASE when e.event_type = 'page_view' THEN 1 ELSE 0 END) as page_views,
SUM (CASE when e.event_type = 'add_to_cart' THEN 1 ELSE 0 END) as add_to_carts,
SUM (CASE when e.event_type = 'checkout' THEN 1 ELSE 0 END) as checkouts,
SUM (CASE when e.event_type = 'package_shipped' THEN 1 ELSE 0 END) as packages_shipped,
FROM events as e
GROUP BY 1),

counts as
(SELECT
SUM (CASE WHEN page_views > 0 THEN 1 ELSE 0 END)  as total_sessions_with_page_views,
SUM (CASE WHEN page_views > 0 AND add_to_carts > 0 THEN 1 ELSE 0 END)  as total_sessions_with_add_carts,
SUM (CASE WHEN page_views > 0 AND add_to_carts > 0 AND checkouts> 0 THEN 1 ELSE 0 END)  as total_sessions_with_checkouts
FROM session_agg)

SELECT
total_sessions_with_page_views, 
total_sessions_with_add_carts,
total_sessions_with_add_carts / total_sessions_with_page_views as conversion_to_carts,
total_sessions_with_checkouts,
total_sessions_with_checkouts / total_sessions_with_add_carts as conversion_to_checkouts
FROM counts
