select
  p.product_id,
  lower(p.product_name),
  t.total_amount / t.quantity as avg_unit_price
from (
    select
      product_id,
      sum(total_amount)::numeric as total_amount,
      sum(quantity) as quantity
    from transactions
    group by product_id
    having sum(quantity) > 0
      and sum(total_amount) >= 100 * sum(quantity)
    ) t
join products p on p.product_id = t.product_id
order by p.product_id
