WITH daily_weather_cte AS (
    select 
        DATE(time) AS daily_weather,
        weather,
        pressure,
        humidity,
        temp,
        clouds
    FROM {{ source('demo', 'weather') }}
)
, daily_weather_agg_cte AS (
    SELECT 
        daily_weather,
        weather,
        round(avg(pressure),2) avg_pressure,
        round(avg(humidity),2) avg_humidity,
        round(avg(clouds),2) avg_clouds,
    FROM daily_weather_cte
    GROUP BY daily_weather, weather
    QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) DESC) = 1
)
SELECT *
FROM daily_weather_agg_cte
