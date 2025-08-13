select * from analytics.facts_trips

-- analysis to perform
-- 1. sum of fare amount by vendor_id
-- 2. avg tip amount based on payment_type name
-- 3. find top 10 pickup locations based on number of trips
-- 4. find total number of trips by passenger count
-- 5. find avg fare amount by hour of the day

-- 1.
select 
	vendor_id, round(sum(fare_amount)::numeric,2) as vendor_fare_total
from
	analytics.facts_trips
group by vendor_id

-- 2.
select
	ft.payment_type_id, 
	dp.payment_type_description, 
	round(avg(ft.tip_amount)::numeric, 2) as payment_wise_avg_tip_amount
from
	analytics.facts_trips ft
left join
	analytics.dim_payment dp 
on ft.payment_type_id = dp.payment_type_id
group by ft.payment_type_id, dp.payment_type_description

-- 3.
select pu_location_id, count(*) as number_of_trips_location_wise
from analytics.facts_trips
group by pu_location_id
order by number_of_trips_location_wise desc
limit 10

-- 4. 
select passenger_count, count(*) number_of_trips_passenger_count_wise
from analytics.facts_trips
group by passenger_count

-- 5. 
-- is it possible that pickup is at different date and dropoff is at different, for example someone started trip at 11:55pm and dropoff at 1am
-- we are considering pickup_datetime from facts_trips assuming fare charged at pickup time

select
	ddt.hour,
	round(avg(ft.fare_amount)::numeric,2) as avg_fare_amount_by_hour_of_day
from 
	analytics.facts_trips ft
join
	analytics.dim_datetime ddt
on 
	ft.pickup_datetime = ddt.full_datetime
group by ddt.hour
order by avg_fare_amount_by_hour_of_day desc


