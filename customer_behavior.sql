
select * From customer limit 20;
 --1. Customer Demographics Insights
 --Q1. Which gender contributes more revenue?

 select gender,
 count(customer_id) as total_customer,
 sum(purchase_amount) as total_revenue,
 avg(purchase_amount) as avg_purchase
 from customer
 group by gender
 order by total_revenue desc;

 --Q2. Which age group spends the most?
 select 
 	case 
	 when age between 18 and 25 then '18-25'
	 when age between 26 and 35 then '25-35'
	 when age between 36 and 45 then '36-45'
	 else '46+'
	 End as age_group,
	 sum(purchase_amount) as total_revenue,
	 avg(purchase_amount) as avg_purchase
from customer
group by age_group 
order by total_revenue desc

--2. Product & Category Analysis
--Q3. Which category generates highest revenue?
select category,
	sum(purchase_amount) as revenue,
	count(*) as total_orders
	from customer
group by category
order by revenue desc

--Q4. Most purchased items
select item_purchased,
		count(*) as purchase_count
		from customer
		group by item_purchased
		order by purchase_count desc
		limit 10;
--Q5. Which colors or sizes are most popular?

select color,
	count(*) as total_sales
	from customer
	group by color
	order by total_sales desc;
select size,
	count(*) as total_sales
	from customer
	group by size
	order by total_sales desc;

--3. Customer Loyalty & Retention
--Q6 who  are the most repeated customer
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS lifetime_value
FROM customer
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY lifetime_value DESC;

	SELECT 
    customer_id,
    COUNT(*) AS orders
FROM customer
GROUP BY customer_id
ORDER BY orders DESC;