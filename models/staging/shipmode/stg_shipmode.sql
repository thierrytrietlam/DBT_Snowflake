{{ config(
    materialized='incremental',
    unique_key='SM_SHIP_MODE_SK'
) }}
    -- materialized='ephemeral'

select
    sm_code,
    array_agg(distinct sm_carrier) as sm_carrier_array
from {{source('shipmode', 'ship_mode')}}
group by 1
{% if is_incremental() %}
  WHERE updated_at > (SELECT CURRENT_DATE()-1000 FROM {{ this }})
{% endif %}