select distinct
    n.payment_type_id, p.payment_type_description
from 
    {{ ref('stg_nyc_taxi_data') }} as n
left join  
    {{ ref('stg_payment_lookup') }} as p
on n.payment_type_id = p.payment_type_id