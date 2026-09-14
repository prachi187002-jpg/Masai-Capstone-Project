-- orders (orders table) in a specific city (customers table) 
select orders.*, customers.city 
from orders
left join customers
on customers.customer_id = orders.customer_id
where city = 'Mumbai';

-- Listing distinct category in products table 
select distinct category 
from products;

-- The top 5 orders by amount_inr
select * from orders
order by amount_inr DESC
limit 5;

-- Using alias 
Select customer_id, count(order_id) as total_orders
from orders
group by customer_id;

-- Using IN clause, orders whos epayment mode is in 2 mode list
select * from orders
where payment_mode in ('UPI', 'Credit Card');

-- orders with amount inr between 200 and 400
select * from orders
where amount_inr between 200 and 400;

-- orders with amount_inr not between 200 and 400
Select * from orders
where amount_inr not between 200 and 400;

-- using null 
Select * from orders 
where rating is null;

