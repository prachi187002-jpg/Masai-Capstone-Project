-- 31 products
-- 50 customers
-- 500 orders
-- 6 category_targets


-- In orders.status split we get 42 Cancelled, 434 Delivered, 24 Pending

SELECT count(*) FROM products;
SELECT  count(*) FROM customers;
SELECT  count(*) FROM orders;
SELECT  count(*) FROM category_targets;
Select status,count(order_id) from orders
group by status;