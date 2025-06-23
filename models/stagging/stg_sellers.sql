{{ config(materialized = 'table') }}

WITH Sellers AS (
    SELECT
        seller_id,
        seller_city,
        seller_state
    FROM
        {{ source('raw', 'sellers') }}
)

SELECT * FROM Sellers