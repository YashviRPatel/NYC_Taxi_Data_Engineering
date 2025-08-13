
select 
"VendorID" as vendor_id,
tpep_pickup_datetime as pickup_datetime,
tpep_dropoff_datetime as dropoff_datetime,
cast(floor(passenger_count) as int) as passenger_count, 
trip_distance,
cast("RatecodeID" as int) as ratecode_id,
"PULocationID" as pu_location_id,
"DOLocationID" as do_location_id,
payment_type as payment_type_id,
fare_amount,
tip_amount,
"PUBorough" as pu_borough,
"PUZone" as pu_zone,
"DOBorough" as do_borough,
"DOZone" as do_zone


from {{source('raw', 'trip_zone')}}