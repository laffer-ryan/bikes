{% macro get_season(x) %}
case 
    when MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2)
    then 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8)
    THEN 'SUMMER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (9,10,11)
    THEN 'AUTUMN'
    END
{% endmacro %}


{% macro get_daytype(x) %}
CASE
    WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat', 'Sun') 
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END 
{% endmacro %}