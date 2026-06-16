CREATE DATABASE ZEPTO

select * from zepto

---DATA EXPLORATION---

--count of rows--
select count(*) as count_of_rows
from zepto 

--sample data--
select top 5 * from zepto

--null values--
select * from zepto
where category is NULL
or 
name is NULL
or
mrp is NULL
or
discountPercent is NULL
or 
availableQuantity is NULL
or
discountedSellingPrice is NULL
or
weightInGms is NULL
or
outOfStock is NULL
or 
quantity is NULL

--	No null values present in dataset

--different product categories
select distinct category
from zepto 
order by category

--There are total 14 categories in dataset

--count of products instock vs outofstock

select outOfStock, count(*) as count_of_stock
from zepto
group by outOfStock
--453 products are out of stock and 3279 are in stock

--product names present multiple times

select name, count(*) as count_of_each_product
from zepto 
group by name
having count(*) > 1
order by count_of_each_product desc

--same product names are present multiple times because they itself are different variants, in aspect of weights, categories, packing. so they are considered as unique product.

---DATA CLEANING---
select * from zepto
where discountedSellingPrice = 0 or mrp = 0

delete from zepto 
where discountedSellingPrice = 0 or mrp = 0
--We found one row with mrp & discountedSellingPrice as 0, which can't be possible and so deleted.

select * from zepto
--update the mrp and discountedsellingprice value
update zepto
set mrp= mrp/100.0 , discountedSellingPrice= discountedSellingPrice/100.0

--DATA ANALYSIS---

--Q1. Find the top 10 best-value products based on the discount percentage.
select DISTINCT top 10  name, mrp,discountedSellingPrice, discountPercent 
from zepto
order by discountPercent desc

--These products have  highest discounts and businesses to know which products are heavily promoted.

--Q2.What are the Products with High MRP but Out of Stock
select distinct name, mrp
from 
zepto 
where mrp > 300 and outOfStock = 1
order by mrp desc

--Businesses must focus on these products for Restock as MRP is high and time to time stocking must be needed for more profit.

----Q3.Calculate Estimated Revenue for each category

select Category, sum(availableQuantity * discountedSellingPrice) as total_revenue
from zepto
group by Category
order by total_revenue desc
-- Stakeholders must focus on highest revenue producing categories and must refill the stock frequently.
--Low revenue categories like Fruits & vegetables can be boost by Discounts or promotions
--Marketing team must focus more ads and promotionsfor high revenue producing categories.

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 and discountPercent < 10

--These are considered as premium products , have high mrp but less discount due to high demands.
--business can bundle up slow selling products with these premium products 

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select top 5 category, avg(discountPercent) as avg_discount_percent
from zepto 
group by category 
order by avg_discount_percent desc

--THese categories have high avg discount percent maybe demand is low and excess stock indicates slow moving categories
--For these categories , high impact on profit margins, less profit can be produced

---Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, weightInGms,round(weightInGms/discountedSellingPrice,2) as price_per_gram
from 
zepto
where weightInGms > 100
order by price_per_gram 

--it will business to know which products are high value for money which can premium, overpriced
--it will help in pricing strategy for businesses
--Business can know more about customer purchase behaviour as of customers look for more quantity in less price.

----Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, weightInGms, 
case when weightInGms < 1000 then 'low'
      when weightInGms < 5000 then 'medium'
	  else 'bulk'
      end as weight_category 
from zepto

--It will helps businesses in inventory and warehouse planning like bulk products require more storage space
--Business can targets different customer segments and optimise pricing strategies, delivery planning.

--Q8.What is the Total Inventory Weight Per Category 
select Category, sum(CAST(WeightInGms AS BIGINT) * availableQuantity) as total_inventory_weight
from zepto 
group by Category 
order by total_inventory_weight desc

--It helps Business for inventory planning like for higher weights category requires more space and rack allocation.
--Business can decide shipping costs depends categories



















