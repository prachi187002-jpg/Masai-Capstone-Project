# AI Query Assistance Log

## AI Prompt 1
 
You are a senior SQL expert and data analyst, experienced in SQLite-specific syntax, helping a junior analyst review and correct a query before it goes into a report.

There are four tables in `bigbasket.db`:

1. `customers(customer_id, name, signup_date, city)`
2. `orders(order_id, customer_id, product_id, order_date, quantity, amount_inr, payment_mode, status, rating)`
3. `products(product_id, product_name, category, supplier, unit_price_inr)`
4. `category_targets(category, target_revenue_inr)`

Write a derived-fields query that computes, per category: total revenue (joined against `category_targets`), variance = `target_revenue_inr - total_revenue`, and `percentage_variance = ((total_revenue - target_revenue_inr) * 100.0) / target_revenue_inr`. Tag each row `'Above Target'` when `total_revenue >= target_revenue_inr`, `'Below Target - Watch'` when the shortfall is within 15%, else `'Below Target - Critical'`. Calculate this only for orders where status is `'Delivered'`.

The query must run in SQLite. Do not use window functions. Use only `INNER JOIN` or `LEFT JOIN` (no correlated subqueries as join replacements). Must guard against SQLite integer-division truncation on the percentage formula — the `* 100.0` (or an explicit `CAST(... AS REAL)`) has to happen before the division, or the result truncates to 0.
  
Return the SQL query only and be clear and precise in your response.

## AI-Generated Query

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
FROM category_targets ct
INNER JOIN products p ON p.category = ct.category
INNER JOIN orders o ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY ct.category, ct.target_revenue_inr;


## Four-Step Verification

### STEP 1 — READ IT
I read through the AI-generated SQL query and checked the logic of the joins, aggregation, variance calculation, percentage-variance formula, and `CASE` statement.

### STEP 2 — CHECK COLUMN NAMES AND TYPES
I verified that the referenced tables and columns (`category_targets.category`, `target_revenue_inr`, `products.category`, `products.product_id`, `orders.product_id`, and `orders.amount_inr`) match the database schema provided.

### STEP 3 — TEST ON A SMALL SUBSET
I tested the query with 5 rows of category/order data and checked whether the calculated revenue and target comparison were produced correctly.

### STEP 4 — SANITY CHECK THE RESULT
Since the data was small, I manually checked the calculated variance and percentage variance and confirmed that categories at or above their target were labelled `"Above Target"`, while categories with a shortfall of 15% or less were labelled `"Below Target - Watch"` and larger shortfalls `"Below Target - Critical"`.


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


## AI Prompt 2 — Pandas IQR Outlier Debugging


You are a senior data analyst experienced in Python, Pandas, and data-cleaning workflows.

I am cleaning BigBasket order data in a DataFrame named `df`. The `amount_inr` column contains missing values and unusually large values. I must detect outliers using only Delivered orders with non-null revenue values. I need to calculate Q1, Q3, IQR, and the upper fence, then cap values above the upper fence without deleting rows.
The lower fence must be ignored since it turns out to be negative.

Review and explain the following Pandas logic. Identify any mistakes and provide corrected code if necessary:

Q1 = rev[rev["status"]=="Delivered"]["amount_inr"].quantile(0.25)
Q3 = rev[rev["status"]=="Delivered"]["amount_inr"].quantile(0.75)
IQR = Q3-Q1
upper_fence = Q3 + 1.5*IQR
print("Q1:", Q1)
print("Q3:", Q3)
print("upper_fence :", upper_fence)
rows_capped = (rev[(rev["status"]=='Delivered') & (rev["amount_inr"]> upper_fence)]["order_id"]).count()
print("rows_capped :" ,rows_capped)
rev["amount_inr"] = rev["amount_inr"].clip(upper=upper_fence)

Use Pandas code. Do not fill missing revenue values. Do not remove outlier rows.Only Delivered orders should be used for outlier detection and capping.

The response format should be in three parts: Explain the issue, provide corrected code, and describe how I can verify that the result is correct