Part 1 - Models:

Q: What is our user repeat rate? 
A: 27.4%

SQL:

WITH A AS (select
    user_id,
    COUNT (DISTINCT order_id) as total_orders
from
    STG_POSTGRES__ORDERS
GROUP BY 1)

SELECT
COUNT (CASE WHEN total_orders > 1 THEN 1 END) as total_repeated_users,
SUM (total_orders) as total_users_who_purchased,
COUNT (CASE WHEN total_orders > 1 THEN 1 END)/SUM (total_orders) as repeat_rate
FROM A


Q: What product marts were created?
A: Created the following tables:
- fact_page_views - to capture the key insights around page views and product usage.
- dim_repeated_users - table to capture repeated users and first time a user purchased in the platform. This was later used to find if a certain session was not a first purchase
- int_session_timing_agg - to calculate start and end times of the sessions

Part 2 - Tests:

Due to limited time just created one test to ensure start and end dates of session times have the correct order.

Part 3 - Snapshots: 

By filtering the snapshot table on DBT_VALID_TO not null, the following products seem to have changes in inventory: Pothos, Philodendron, Monstera and String of pearls. 