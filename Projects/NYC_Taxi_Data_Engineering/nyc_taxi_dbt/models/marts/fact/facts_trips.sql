select
    row_number() over() as trip_id,
    vendor_id,
    pickup_datetime,
    dropoff_datetime,
    passenger_count,
    trip_distance,
    ratecode_id,
    pu_location_id,
    do_location_id,
    payment_type_id,
    fare_amount,
    tip_amount
    from {{ ref('stg_nyc_taxi_data') }}

