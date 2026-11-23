select distinct
    product_id,
    product_name,
    avg_unit_price
from (
    select
        p.product_id,
        lower(p.product_name) as product_name,
        sum(t.total_amount) over w::numeric / nullif(sum(t.quantity) over w, 0) as avg_unit_price,
        sum(t.quantity)     over w as qty
    from transactions t
    join products p on p.product_id = t.product_id
    window w as (partition by t.product_id)
) x
where qty > 0
  and avg_unit_price >= 100
order by product_id;
