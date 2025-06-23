
WITH Sellers AS(
    SELECT
        *
    FROM
        {{ ref('int_sellers_info')}}
)

SELECT
    *
FROM
    Sellers