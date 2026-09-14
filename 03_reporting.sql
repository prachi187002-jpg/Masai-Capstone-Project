-- (a)
select p.product_name, sum(o.amount_inr) as total_revenue,
 case when sum(o.amount_inr) >= 3000 then 'High'
 	  when sum(o.amount_inr) >= 1000 then 'Medium'
      else 'Low'
 end as product_tier
from products as p
left join orders as o
on p.product_id = o.product_id
where o.status = 'Delivered'
group by product_name;

-- (b)
select p.category , 
 strftime('%Y-%m', order_date) as month,
 count(o.order_id) as order_count,
 sum(o.amount_inr) as total_revenue,
 round(avg(o.amount_inr),2) as avg_revenue
from products as p
left join orders as o
on p.product_id = o.product_id
where o.status = 'Delivered'
group by p.category, strftime('%Y-%m', order_date) 
order by category, month;

-- (c)
SELECT 
    ct.category,
    SUM(o.amount_inr) AS total_revenue,
    ct.target_revenue_inr,
    (ct.target_revenue_inr - SUM(o.amount_inr)) AS variance,
    ((SUM(o.amount_inr) - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr AS percentage_variance,
    CASE
        WHEN SUM(o.amount_inr) >= ct.target_revenue_inr THEN 'Above Target'
        WHEN ((ct.target_revenue_inr - SUM(o.amount_inr)) * 100.0) / ct.target_revenue_inr <= 15 THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS target_status
FROM category_targets as ct
INNER JOIN products as p ON p.category = ct.category
INNER JOIN orders as o ON o.product_id = p.product_id
where o.status = 'Delivered'
GROUP BY ct.category, ct.target_revenue_inr;

