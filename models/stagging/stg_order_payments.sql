{{ config(materialized = 'table') }}

WITH Order_payments AS (
    SELECT
        order_id as ord_id,
        payment_type as pay_type,
        payment_value as pay_amount,
        payment_sequential as pay_no_of_times,
        payment_installments as pay_installments

    FROM
        RAW. Order_payments
)

SELECT * FROM  Order_payments