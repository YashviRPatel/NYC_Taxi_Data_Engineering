select distinct 
    do_location_id, 
    do_borough, 
    do_zone
from {{ ref('stg_nyc_taxi_data')}} 