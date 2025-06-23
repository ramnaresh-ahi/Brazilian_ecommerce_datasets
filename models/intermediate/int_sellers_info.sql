
WITH Order_items AS(
    SELECT
        *
    FROM
        {{ ref('stg_order_items')}}
),

Sellers AS(
    SELECT
        *
    FROM
        {{ ref('stg_sellers')}}
),

Products AS(
    SELECT
        *
    FROM
        {{ ref('stg_products')}}
),

Product_category AS(
    SELECT 
        *
    FROM
        {{ ref('stg_product_category')}}
),

final  AS(
    SELECT
        o.seller_id,
        p.prod_id,
        p.prod_category,
        pc.prod_category_translation,
        o.price,
        o.delivery_charge,
        ((o.price) + (o.delivery_charge)) as total_amount,
        s.seller_city,
        s.seller_state
    FROM
        Product_category pc 
    JOIN
        Products p using(prod_category)
    JOIN
        Order_items o using(prod_id)
    JOIN
        Sellers s using(seller_id)

)

SELECT 
    *
FROM
    final
