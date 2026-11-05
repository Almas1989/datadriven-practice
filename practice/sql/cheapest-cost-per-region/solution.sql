select 
  region, min(amount)
  from cloud_costs
  group by region
