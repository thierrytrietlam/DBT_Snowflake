-- {{ config(materialized='incremental') }}
    -- materialized='ephemeral'
    -- partition_by = ['o_orderdate'],
    -- cluster_by = ['O_ORDERKEY'], -- faster filtering
    -- unique_key='o_orderkey'
select
    o_orderkey as order_key,
    o_custkey as customer_key,
    o_orderstatus as status_code,
    o_totalprice as total_price,
    o_orderdate as order_date,
    DATEADD(DAY, -10, CURRENT_TIMESTAMP()) as updated_at
    -- CURRENT_DATE()

from
    {{ source('tpch', 'orders') }} AS o
WHERE o_orderkey IS NOT NULL
{% if is_incremental() %}
  AND o.o_orderdate > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}