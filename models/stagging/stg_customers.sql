
{{ config(materialized = 'table') }}

WITH customers AS (
    SELECT
        customer_id as cust_id,
        customer_unique_id as cust_unq_id,
        customer_city as cust_city,
        customer_state as cust_state
    FROM
        {{ source('raw', 'customers') }}
)

SELECT * FROM customers
