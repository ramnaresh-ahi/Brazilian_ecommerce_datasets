{{ config(materialized = 'table') }}

WITH Geolocations AS (
    SELECT
        geolocation_city as geo_city,
        geolocation_state as geo_state
    FROM
        {{ source('raw', 'geolocations') }}
)

SELECT * FROM Geolocations
