select
  p.product_name,
  sum(t.total_amount) as total_revenue
from products p
join transactions t on t.product_id = p.product_id
group by p.product_name
order by 2 desc
limit 5;
