WITH bikes AS (

    SELECT 
        ride_id,
        rideable_type,
        TO_TIMESTAMP(started_at),
        TO_TIMESTAMP(ended_at),
        start_statio_id AS start_station_id,
        end_station_id,
        member_csual AS member_casual,
        TIMESTAMPDIFF(second, TO_TIMESTAMP(started_at),  TO_TIMESTAMP(ended_at)) AS trip_duration_seconds
    FROM {{ source('demo', 'bike') }}
)

SELECT *
FROM bikes