
--Data aggreegation--
select count  (*) as cnt,
sum(sales) as total_sales,
max(sales) as max_sales,
min(sales) as min_sales,
avg(sales) as avg_sales
from super;


select top 1 * from super order by sales ; 

--group by--

select region, count  (*) as cnt,
sum(sales) as total_sales,
max(sales) as max_sales,
min(sales) as min_sales,
avg(sales) as avg_sales
from super
group by region;

select top 10 city,count(*) as cnt from super
group by city
order by cnt desc;

select  region,category,sum(sales) as total_sales
from super
group by region,category;
--Assignments
--1- write a update statement to update city as null for order ids :  1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
update super
set city=null
where order_id in('CA-2020-161389' , 'US-2021-156909');

--2- write a query to find orders where city is null (2 rows)
select * from super where city is null;

--3- write a query to get total profit, first order date and latest order date for each category
select category,sum(profit) as total_profit,
max(order_date) as latest_order,
min(order_date) as first_order
from super 
group by category;

--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
select sub_category,avg(profit) as avg_profit
from super 
group by sub_category
having avg(profit)>max(profit)/2;

--6- write a query to find total number of products in each category.
select category,count(*) as cnt from super
group by category
order by cnt desc;

--7- write a query to find top 5 sub categories in west region by total quantity sold
select top 5 sub_category,sum(quantity) as total_quantity
from super
where region='West'
group by sub_category
order by total_quantity desc;

--8 write a query to find total sales for each region and ship mode combination for orders in year 2020
select region,ship_mode,sum(sales) as total_sales
from super
where year(order_date)=2020
group by region,ship_mode
order by total_sales desc;

--9 Calculate total sales for each product category, sorted in descending order of sales value.
select category,sum(sales) as total_sales
from super 
group by category
order by total_sales desc;
--10 Find the average discount percentage for each sub-category.
select sub_category,avg(discount) as discount_percents_avg
from super
group by sub_category
order by discount_percents_avg desc;

--11 Retrieve the top 5 customers who made the highest profits, along with their total profit.
select top 5 customer_name,max(profit) as highest_profit,sum(profit) as total_profit
from super
group by customer_name
order by total_profit desc;

--12 Count the number of orders placed in each region, sorted alphabetically by region name.
select region, count(*) as cnt
from super
group by region 
order by region;

--13 Find the minimum and maximum sales values for each product category
select category,min(sales) as min_sales,max(sales) as max_sales
from super 
group by category;
--14 Calculate the total quantity of products sold in each country, ordered by total quantity in descending order.
select country,sum(quantity) as total_quantity
from super
group by country
order by total_quantity desc;

--15 Determine the average profit per order for each segment, sorted by segment name
select segment,avg(profit) as average_profit from super
group by segment
order by segment;

--16 Find the number of orders shipped via each shipping mode.
select ship_mode,count(*) as no_of_order
from super
group by ship_mode
order by no_of_order;

--17 Retrieve the top 3 most profitable products along with their profit values.
select top 3 product_name,sum(profit) as profit_value from super
group by product_name
order by profit_value desc;

--18 Calculate the total sales, average discount, and total profit for each product category, sorted by total sales in descending order.
select category ,sum(sales) as total_sales,avg(discount) as avg_discount,sum(profit) as total_profit
from super
group by category
order by total_sales desc;