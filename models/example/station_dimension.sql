WITH bike AS (
    select DISTINCT
        start_statio_id AS station_id,
        start_station_name AS station_name,
        start_lat AS station_lat,
        start_lng AS station_lng

    from {{ ref('stg_bike') }}
)

SELECT *
FROM bike