-- Purpose of this table to get all the required columns for analysis/dashboarding by Data Analysts or Scientists

select 
    f.vendor_id,

    pdt.date as p_date,
    pdt.year as p_year,
    pdt.month as p_month,
    pdt.day as p_day,
    pdt.hour as p_hour,
    pdt.day_of_week as p_dow,

    ddt.date as d_date,
    ddt.year as d_year,
    ddt.month as d_month,
    ddt.day as d_day,
    ddt.hour as d_hour,
    ddt.day_of_week as d_dow,

    f.passenger_count,

    f.trip_distance,

    rc.ratecode_description,

    pl.pu_borough,
    pl.pu_zone,

    dl.do_borough,
    dl.do_zone,

    pay.payment_type_description,

    f.fare_amount,

    f.tip_amount


from 
    {{ ref('facts_trips') }} as f
join 
    {{ref('dim_datetime')}} as pdt on f.pickup_datetime = pdt.full_datetime
join
    {{ref('dim_datetime')}} as ddt on f.dropoff_datetime = ddt.full_datetime
join
    {{ref('dim_ratecode')}} as rc on f.ratecode_id = rc.ratecode_id 
join 
    {{ref('dim_pickup_location')}} pl on f.pu_location_id = pl.pu_location_id
join 
    {{ref('dim_dropoff_location')}} dl on f.do_location_id = dl.do_location_id
join 
    {{ref('dim_payment')}} pay on f.payment_type_id = pay.payment_type_id