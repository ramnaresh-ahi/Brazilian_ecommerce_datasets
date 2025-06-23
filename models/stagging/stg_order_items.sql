{{ config(materialized = 'table') }}

WITH Order_items AS (
    SELECT
        order_id as ord_id,
        order_item_id as ord_item_id,
        product_id as prod_id,
        seller_id,
        price,
        freight_value as delivery_charge

    FROM
        {{ source('raw', 'order_items') }}
)

SELECT * FROM Order_items