{{ config(materialized = 'table')}}

WITH delivered_order AS(
    SELECT 
        * 
    FROM 
        {{ ref('stg_orders')}}
    WHERE
        ord_status = 'delivered'

),

Customers AS (
    SELECT 
        *
    FROM
        {{ ref('stg_customers')}}

),

Order_items AS (
    SELECT 
        *
    FROM
        {{ ref('stg_order_items')}}
),

Products AS (
    SELECT 
        *
    FROM
        {{ ref('stg_products')}}
),

Product_category AS (
    SELECT 
        *
    FROM 
        {{ ref('stg_product_category')}}
),

Order_reviews AS (
    SELECT 
        *
    FROM
        {{ ref('stg_order_reviews')}}
),

Payments AS (
    SELECT 
        *
    FROM 
        {{ ref('stg_order_payments')}}
),

final AS (
    SELECT 
        do.ord_id,
        oi.ord_item_id,
        oi.prod_id,
        pr.prod_category,
        pc.prod_category_translation,
        c.cust_id as buyer_id,
        do.ord_purchase_timestamp,
        do.ord_delivered_timestamp,
        py.pay_amount,
        py.pay_type,
        rr.rev_score,
        rr.rev_title,
        rr.rev_comment,
        c.cust_city as buyer_city,
        c.cust_state as buyer_state
    FROM
        Customers c 
        join 
            delivered_order do using(cust_id)
        join
            payments py using(ord_id)
        join
            order_reviews rr using(ord_id)
        join
            order_items oi using(ord_id)
        join
            products pr using(prod_id)
        join
            Product_category pc using(prod_category)

)

SELECT 
    *
FROM
    final

