SELECT 
session_id, 
min (created_at) as session_start,
max (created_at) as session_end
FROM {{ ref('stg_postgres__events')}}
GROUP BY 1