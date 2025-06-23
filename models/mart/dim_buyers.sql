
WITH Buyers AS(
    SELECT 
        *
    FROM
        {{ ref('int_buyers_info')}}
)

SELECT 
    *
FROM
    Buyers