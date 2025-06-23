{{ config(materialized = 'table') }}

WITH Product_category AS (
    SELECT
        product_category_name as prod_category,
        product_category_name_english as prod_category_translation
    FROM
        {{ source('raw', 'product_category') }}
)

SELECT * FROM Product_category