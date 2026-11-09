select product_name
  from products p
  left join transactions t on t.product_id = p.product_id  
 where t.product_id is null
  order by product_name asc
