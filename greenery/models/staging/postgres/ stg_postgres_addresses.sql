{{
  config(
    materialized='table'
  )
}}

SELECT 
	ADDRESS_ID,
	ADDRESS,
	ZIPCODE,
	STATE,
	COUNTRY,
FROM {{ source('tutorial', 'addresses') }}