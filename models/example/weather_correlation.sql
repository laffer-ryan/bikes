WITH cte AS (
    select *
    from {{ ref('trip_fact') }} f
    left join {{ ref('daily_weather') }} w
        on f.trip_date = w.daily_weather
    limit 10
)

SELECT *
FROM cte