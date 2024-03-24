SELECT 
	ORDER_ID,
	PRODUCT_ID,
	QUANTITY
FROM {{ source('tutorial', 'order_items') }}