select
    sm_code,
    array_agg(distinct sm_carrier) as sm_carrier_array
from {{source('shipmode', 'ship_mode')}}
group by 1