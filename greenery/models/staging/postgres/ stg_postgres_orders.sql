SELECT 
	ORDER_ID,
	USER_ID,
	PROMO_ID,
	ADDRESS_ID,
	CREATED_AT,
	ORDER_COST,
	SHIPPING_COST,
	ORDER_TOTAL,
	TRACKING_ID,
	SHIPPING_SERVICE,
	ESTIMATED_DELIVERY_AT,
	DELIVERED_AT,
	STATUS
FROM {{ source('tutorial', 'orders') }}