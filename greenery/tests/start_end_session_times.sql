SELECT *
FROM {{ ref("int_session_timing_agg") }}
WHERE session_start > session_end 
/* checking if there are any instances where the session start is greater than the session end timestamp */