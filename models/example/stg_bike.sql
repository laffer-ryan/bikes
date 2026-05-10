WITH cte AS (

    SELECT 
        ride_id,
        REPLACE(started_at, '"', '') AS started_at,
        REPLACE(ended_at, '"', '') AS ended_at,
        REPLACE(start_station_name, '"', '') AS start_station_name,
        start_statio_id,
        REPLACE(end_station_name, '"', '') AS end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        REPLACE(member_csual, '"', '') AS member_csual
    FROM {{ source('demo', 'bike') }}
    WHERE ride_id <> '"bikeid"'
)

SELECT *
FROM cte