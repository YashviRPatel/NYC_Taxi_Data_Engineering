select distinct 
    pu_location_id, 
    pu_borough, 
    pu_zone
from {{ ref('stg_nyc_taxi_data')}} 