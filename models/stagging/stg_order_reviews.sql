{{ config(materialized = 'table') }}

WITH Order_reviews AS (
    SELECT
        review_id,
        order_id as ord_id,
        review_score as rev_score,
        COALESCE(review_comment_title, 'NA') as rev_title,
        COALESCE(review_comment_message, 'NA') as rev_comment,
        CAST(review_answer_timestamp AS DATE) as rev_timestamp
    FROM
        {{ source('raw', 'order_reviews') }}
)

SELECT * FROM Order_reviews
