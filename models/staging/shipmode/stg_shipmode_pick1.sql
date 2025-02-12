select
    sm_code,
    sm_carrier_array[0] as sm_carrier
from {{ref('stg_shipmode')}}