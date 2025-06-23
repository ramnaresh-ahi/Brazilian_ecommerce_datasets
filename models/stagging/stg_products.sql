{{ config(materialized = 'table') }}

WITH Products AS (
    SELECT
        product_id as prod_id,
        COALESCE(product_category_name, 'NA') as prod_category
    FROM
        {{ source('raw', 'products') }}
)

SELECT * FROM Products
