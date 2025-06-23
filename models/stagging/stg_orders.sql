{{ config(materialized = 'table') }}

WITH Orders AS (
    SELECT
        order_id as ord_id,
        customer_id as cust_id,
        Order_status as ord_status,
        cast(order_purchase_timestamp as timestamp) as 
        ord_purchase_timestamp,
        CAST(COALESCE(order_delivered_customer_date, NULL) AS timestamp) AS ord_delivered_timestamp

    FROM
        RAW.orders
)

SELECT * FROM Orders