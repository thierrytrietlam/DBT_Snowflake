select
    sm_code,
    value as sm_carrier
from {{ref('stg_shipmode')}},
    lateral flatten(input => sm_carrier_array)