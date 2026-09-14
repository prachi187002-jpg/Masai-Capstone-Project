-- (a)
select p.category,
  count(o.order_id) as total_orders,
  SUM(o.amount_inr) as total_revenue,
  AVG(o.amount_inr) as average_revenue
from orders as o 
inner join products as p
on o.product_id = p.product_id
where o.status = 'Delivered'
group by p.category 
having total_revenue >10000;

-- (b)
select p.product_name,
 count(o.order_id) as total_orders
from products as p 
left join orders as o
on p.product_id = o.product_id
group by p.product_name
order by total_orders asc;

