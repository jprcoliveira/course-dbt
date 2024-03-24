Q: How many users do we have? 
A: 130 
SQL:
SELECT COUNT (DISTINCT user_id)
From STG_POSTGRES__USERS

------------------------------------------------------------------
Q: On average, how many orders do we receive per hour?
A: 7.52

SQL:
SELECT
    count(DISTINCT order_id),
    timestampdiff(hour,min(created_at),max(created_at))+1 as total_hours,
    count(order_id) / (timestampdiff(hour,min(created_at),max(created_at))+1) as avg_orders_per_hour
FROM
    STG_POSTGRES__ORDERS

-------------------------------------------------------------------
Q: On average, how long does an order take from being placed to being delivered?
A: "1.61 hours"

SQL:
SELECT
    count(DISTINCT order_id),
    timestampdiff(hours,min(created_at),max(delivered_at)) as total_hours,
    count(DISTINCT order_id) / (timestampdiff(hour,min(created_at),max(delivered_at))+1) as avg_orders_per_hour
FROM
    STG_POSTGRES__ORDERS

-------------------------------------------------------------------
Q: On average, how long does an order take from being placed to being delivered?
A: "1.61 hours"

SQL:
SELECT
    count(DISTINCT order_id),
    timestampdiff(hours,min(created_at),max(delivered_at)) as total_hours,
    count(DISTINCT order_id) / (timestampdiff(hour,min(created_at),max(delivered_at))+1) as avg_orders_per_hour
FROM
    STG_POSTGRES__ORDERS

-------------------------------------------------------------------
Q: How many users have only made one purchase? Two purchases? Three+ purchases?
A: "25 / 28 / 71"

SQL:
WITH A AS (select
    user_id,
    COUNT (DISTINCT order_id) as total_orders
from
    STG_POSTGRES__ORDERS
GROUP BY 1)


SELECT
COUNT (CASE WHEN total_orders = 1 THEN 1 END) as total_one_purchase_customers,
COUNT (CASE WHEN total_orders = 2 THEN 1 END) as total_two_purchase_customers,
COUNT (CASE WHEN total_orders >= 3 THEN 1 END) as total_three_or_more_purchase_customers
FROM A
-------------------------------------------------------------------
Q: On average, how many unique sessions do we have per hour?
A: "16.3"

WITH A AS 
(SELECT
    count(DISTINCT session_id) as unique_sessions,
    DATE_TRUNC('hour',created_at) as session_hour
FROM
    STG_POSTGRES__EVENTS
GROUP BY 2)

SELECT 
AVG (unique_sessions)
FROM A
