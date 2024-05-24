-- Select all records from the 'super' table
SELECT * FROM super;

-- Update the 'city' column to NULL for specific order IDs
UPDATE super
SET city = NULL
WHERE order_id IN ('CA-2020-137330', 'CA-2018-143336');

-- Filtering null values
-- Select records where the 'city' column is NULL
SELECT * FROM super
WHERE city IS NULL;

-- Select records where the 'city' column is NOT NULL
SELECT * FROM super
WHERE city IS NOT NULL;

-- Aggregation Queries

-- Count the total number of records in the 'super' table
SELECT COUNT(*)
FROM super;

-- Calculate the sum of the 'sales' column
SELECT SUM(sales) AS total_sales
FROM super;

-- Find the maximum value of the 'sales' column
SELECT MAX(sales) AS max_sales
FROM super;

-- Find the minimum value of the 'sales' column
SELECT MIN(sales) AS min_sales
FROM super;

-- Calculate the average value of the 'profit' column
SELECT AVG(profit) AS avg_profit
FROM super;

-- Group By Queries

-- Group by 'region' and 'category' and calculate aggregate functions
SELECT region, category, COUNT(*) AS cnt,
SUM(sales) AS total_sales,
MAX(sales) AS max_sales,
MIN(sales) AS min_sales,
AVG(profit) AS avg_profit
FROM super
GROUP BY region, category;

-- Select the top 2 regions with the highest total sales where profit is greater than 50
SELECT TOP 2 region, SUM(sales) AS total_sales
FROM super
WHERE profit > 50
GROUP BY region
ORDER BY total_sales DESC;

-- Select the top 10 cities with the highest order counts
SELECT TOP 10 city, COUNT(*) AS cnt
FROM super
GROUP BY city
ORDER BY cnt DESC;

-- Error Example (will produce an error because 'category' is not in GROUP BY clause)
-- SELECT region, category, SUM(sales) AS total_sales
-- FROM super
-- GROUP BY region;

-- Assignments

-- 1. Update city to NULL for specific order IDs
UPDATE super
SET city = NULL
WHERE order_id IN ('CA-2020-161389', 'US-2021-156909');

-- 2. Find orders where city is NULL
SELECT * FROM super
WHERE city IS NULL;

-- 3. Get total profit, first order date, and latest order date for each category
SELECT category, SUM(profit) AS total_profit, MIN(order_date) AS first_order_date, MAX(order_date) AS latest_order_date
FROM super
GROUP BY category;

-- 4. Find sub-categories where average profit is more than half of the max profit
SELECT sub_category, AVG(profit) AS avg_profit, MAX(profit) / 2 AS half_of_max_profit, MAX(profit) AS max_profit
FROM super
GROUP BY sub_category
HAVING AVG(profit) > MAX(profit) / 2
ORDER BY avg_profit DESC;

-- 6. Find total number of products in each category
SELECT category, COUNT(*) AS cnt
FROM super
GROUP BY category
ORDER BY cnt DESC;

-- 7. Find top 5 sub-categories in the West region by total quantity sold
SELECT TOP 5 sub_category, SUM(quantity) AS total_quantity_sold
FROM super
WHERE region = 'West'
GROUP BY sub_category
ORDER BY total_quantity_sold DESC;

-- 8. Find total sales for each region and ship mode combination for orders in the year 2020
SELECT region, ship_mode, SUM(sales) AS total_sales
FROM super
WHERE YEAR(order_date) = 2020
GROUP BY region, ship_mode
ORDER BY total_sales DESC;

-- 9. Calculate total sales for each product category, sorted in descending order of sales value
SELECT category, SUM(sales) AS total_sales
FROM super
GROUP BY category
ORDER BY total_sales DESC;

-- 10. Find the average discount percentage for each sub-category
SELECT sub_category, AVG(discount) AS avg_discount
FROM super
GROUP BY sub_category
ORDER BY avg_discount DESC;

-- 11. Retrieve the top 5 customers who made the highest profits, along with their total profit
SELECT TOP 5 customer_id, customer_name, SUM(profit) AS total_profit
FROM super
GROUP BY customer_name, customer_id
ORDER BY total_profit DESC;

-- 12. Count the number of orders placed in each region, sorted alphabetically by region name
SELECT region, COUNT(order_id) AS total_order
FROM super
GROUP BY region
ORDER BY region;

-- 13. Find the minimum and maximum sales values for each product category
SELECT category, MAX(sales) AS max_sales, MIN(sales) AS min_sales
FROM super
GROUP BY category;

-- 14. Calculate the total quantity of products sold in each country, ordered by total quantity in descending order
SELECT country, SUM(quantity) AS total_quantity
FROM super
GROUP BY country
ORDER BY total_quantity DESC;

-- 15. Determine the average profit per order for each segment, sorted by segment name
SELECT segment, AVG(profit) AS avg_profit
FROM super
GROUP BY segment
ORDER BY segment;

-- 16. Find the number of orders shipped via each shipping mode
SELECT ship_mode, COUNT(order_id) AS Order_count
FROM super
GROUP BY ship_mode;

-- 17. Retrieve the top 3 most profitable products along with their profit values
SELECT TOP 3 product_name, SUM(profit) AS max_profit
FROM super
GROUP BY product_name
ORDER BY max_profit DESC;

-- 18. Calculate the total sales, average discount, and total profit for each product category, sorted by total sales in descending order
SELECT category, SUM(sales) AS total_sales, AVG(discount) AS avg_discount, SUM(profit) AS total_profit
FROM super
GROUP BY category
ORDER BY total_sales DESC;
