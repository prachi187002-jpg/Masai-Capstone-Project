-- 500 orders
-- 31 products
-- 50 category_targets
-- 6 customers
-- In orders.status split we get 42 cancelled, 434 Delivered, 24 Pending

SELECT count(*) FROM orders;
SELECT  count(*) FROM products;
SELECT  count(*) FROM customers;
SELECT  count(*) FROM category_targets;
Select status,count(order_id) from orders
group by status;