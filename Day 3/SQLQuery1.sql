-- Select all records from the 'super' table
SELECT * FROM super;

-- Select all records from the 'exams' table
SELECT * FROM exams;

-- Select the top 5 Order_Date and Order_ID from the 'store' table
SELECT TOP 5 Order_Date, Order_ID FROM store;

-- Select the top 5 records from the 'store' table, ordered by Order_Date in descending order
SELECT TOP 5 * FROM store ORDER BY Order_Date DESC;

-- Select distinct values of the Ship_Mode column from the 'store' table
SELECT DISTINCT Ship_Mode FROM store;

-- Filter records from the 'store' table where Ship_Mode is 'First Class'
SELECT * FROM store WHERE Ship_Mode = 'First Class';

-- Filter records from the 'store' table where Order_Date is '2020-12-08'
SELECT * FROM store WHERE Order_Date = '2020-12-08';

-- Select the top 5 Order_Date and Quantity from the 'store' table where Quantity is greater than or equal to 5, ordered by Quantity in descending order
SELECT TOP 5 Order_Date, Quantity FROM store WHERE Quantity >= 5 ORDER BY Quantity DESC;

-- Filter records from the 'store' table where Order_Date is between '2020-12-08' and '2020-12-12' and Quantity is greater than or equal to 6, ordered by Quantity
SELECT * FROM store WHERE Order_Date BETWEEN '2020-12-08' AND '2020-12-12' AND Quantity >= 6 ORDER BY Quantity;

-- Filter records from the 'store' table where Ship_Mode is either 'First Class' or 'Same Day'
SELECT * FROM store WHERE Ship_Mode IN ('First Class', 'Same Day');

-- Filter records from the 'store' table where Quantity is either 3, 5, or 7, ordered by Quantity in descending order
SELECT * FROM store WHERE Quantity IN (3, 5, 7) ORDER BY Quantity DESC;

-- Filter records from the 'store' table where Ship_Mode is not 'First Class' or 'Same Day'
SELECT * FROM store WHERE Ship_Mode NOT IN ('First Class', 'Same Day');

-- Filter records from the 'store' table where Ship_Mode is 'First Class' and Segment is 'consumer'
SELECT * FROM store WHERE Ship_Mode = 'First Class' AND Segment = 'consumer';

-- Filter records from the 'store' table where Ship_Mode is 'First Class' or Segment is 'consumer'
SELECT * FROM store WHERE Ship_Mode = 'First Class' OR Segment = 'consumer';

-- Select all columns from the 'store' table and calculate the profit-to-sales ratio for each record
SELECT *, profit / sales AS ratio FROM store;

-- Filter records from the 'store' table where Customer_Name starts with 'C'
SELECT order_id, order_date, customer_name FROM store WHERE Customer_Name LIKE 'C%';

-- Filter records from the 'store' table where Customer_Name ends with 'schild'
SELECT order_id, order_date, customer_name FROM store WHERE Customer_Name LIKE '%schild';

-- Filter records from the 'store' table where Customer_Name contains 'eve'
SELECT order_id, order_date, customer_name FROM store WHERE Customer_Name LIKE '%eve%';

-- Filter records from the 'store' table where Customer_Name has 'a' as the first character and 'a' as the last character
SELECT order_id, order_date, customer_name FROM store WHERE Customer_Name LIKE 'a%a';

-- Filter records from the 'store' table where Customer_Name has 'o' as the second character
SELECT order_id, order_date, customer_name FROM store WHERE Customer_Name LIKE '_o%';

-- Filter records from the 'store' table where Customer_Name is exactly 10 characters long
SELECT Order_id, order_date, customer_name FROM store WHERE Customer_Name LIKE '__________';

-- Assignment Day 3

-- 1. Get all orders where Customer_Name has 'a' as the second character and 'd' as the fourth character
SELECT * FROM store WHERE Customer_Name LIKE '_a_d%';

-- 2. Get all orders placed in December 2020
SELECT * FROM store WHERE Order_Date >= '2020-12-01' AND Order_Date <= '2020-12-31';

-- 3. Get all orders where Ship_Mode is neither 'Standard Class' nor 'First Class' and Ship_Date is after November 2020
SELECT * FROM store WHERE Ship_Mode NOT IN ('Standard Class', 'First Class') AND Ship_Date > '2020-11-30';

-- 4. Get all orders where Customer_Name neither starts with 'A' nor ends with 'n'
SELECT * FROM store WHERE Customer_Name NOT LIKE 'A%' AND Customer_Name NOT LIKE '%n';

-- 5. Get all orders where profit is negative
SELECT * FROM store WHERE profit < 0;

-- 6. Get all orders where Quantity is less than 3 or profit is 0
SELECT * FROM store WHERE Quantity < 3 OR profit = 0;

-- 7. Report for South region orders where some discount is provided
SELECT * FROM store WHERE Region = 'south' AND Discount > 0;

-- 8. Find top 5 orders with highest sales in Furniture category
SELECT TOP 5 * FROM store WHERE Category = 'Furniture' ORDER BY Sales DESC;

-- 9. Find all records in Technology and Furniture categories for orders placed in the year 2020
SELECT * FROM store WHERE Category IN ('Furniture', 'Technology') AND Order_Date BETWEEN '2020-01-01' AND '2020-12-31';

-- 10. Find all orders where Order_Date is in 2020 but Ship_Date is in 2021
SELECT * FROM store WHERE Order_Date BETWEEN '2020-01-01' AND '2020-12-31' AND Ship_Date BETWEEN '2021-01-01' AND '2021-12-31';
