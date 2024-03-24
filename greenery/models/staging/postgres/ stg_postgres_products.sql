{{
  config(
    materialized='table'
  )
}}

SELECT 
	PRODUCT_ID,
	NAME,
  PRICE,
  INVENTORY 
FROM {{ source('tutorial', 'products') }}