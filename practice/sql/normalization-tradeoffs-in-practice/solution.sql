select category, sum(price*quantity)
from products p
join transactions t on t.product_id = p.product_id
group by category
