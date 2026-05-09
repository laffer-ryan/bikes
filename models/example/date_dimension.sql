WITH CTE AS(
SELECT
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS date_started_at,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS hour_started_at,
    {{ get_daytype('STARTED_AT') }} AS day_type,
    MONTH(TO_TIMESTAMP(STARTED_AT)) AS month_started_at,
    {{ get_season('STARTED_AT') }} AS STATION_OF_YEAR

FROM {{ source('demo', 'bike') }}

)


SELECT *
FROM cte
