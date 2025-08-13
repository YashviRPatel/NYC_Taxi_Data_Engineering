select distinct 
    n.vendor_id, v.vendor_name 
from
    {{ ref('stg_nyc_taxi_data') }} as n
left join
    {{ ref('stg_vendor_lookup')}} as v
on n.vendor_id = v.vendor_id
