with unique_datetimes as (
    select distinct pickup_datetime as full_datetime
    from {{ ref('stg_nyc_taxi_data') }}
    union
    select distinct dropoff_datetime
    from {{ ref('stg_nyc_taxi_data') }}
)

select
    -- row_number() over(order by full_datetime) as datetime_id,
    full_datetime,
    date(full_datetime) as date,
    EXTRACT(year from full_datetime) as year,
    EXTRACT(MONTH FROM full_datetime) AS month,
    EXTRACT(DAY FROM full_datetime) AS day,
    EXTRACT(HOUR FROM full_datetime) AS hour,
    EXTRACT(DOW FROM full_datetime) AS day_of_week
FROM unique_datetimes


