
WITH Fact_Brazilian_Ecommerce AS(
    SELECT
        b.Buyer_id,
        s.Seller_id,
        b.Ord_id,
        b.prod_id,
        s.prod_category
    FROM
        {{ ref('int_buyers_info')}} b
    JOIN 
        {{ ref('int_sellers_info')}} s using(prod_id)
      
)

SELECT 
    * 
FROM
    Fact_Brazilian_Ecommerce

