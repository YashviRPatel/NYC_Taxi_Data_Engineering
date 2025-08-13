select distinct
    n.ratecode_id, r.ratecode_description
from
    {{ ref('stg_nyc_taxi_data') }} as n 
left join 
    {{ ref('stg_ratecode_lookup') }} as r
on n.ratecode_id = r.ratecode_id