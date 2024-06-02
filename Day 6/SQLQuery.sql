-- Self join to get each employee with their manager's details
SELECT * 
FROM employee e1
INNER JOIN employee e2 
ON e1.manager_id = e2.emp_id;

-- Find the employees whose salary is more than their manager's salary
SELECT e1.emp_name, e1.salary AS emp_salary, e2.salary AS manager_salary
FROM employee e1
INNER JOIN employee e2 
ON e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;

-- List of employees in each department, ordered by employee name in descending order
SELECT dept_id, STRING_AGG(emp_name, ',') WITHIN GROUP (ORDER BY emp_name DESC) AS list_of_emp
FROM employee
GROUP BY dept_id;

-- Extract parts of the date (year, month, week) from order_date
SELECT order_date, order_id,
DATEPART(yy, order_date) AS order_year,
DATEPART(m, order_date) AS order_month,
DATEPART(week, order_date) AS order_week
FROM super;

-- Extract parts of the date (year, month, weekday name) from order_date
SELECT order_date, order_id,
DATENAME(yy, order_date) AS order_year,
DATENAME(m, order_date) AS order_month,
DATENAME(weekday, order_date) AS order_week
FROM super;

-- Add and subtract various date parts (days, weeks, months, years) to/from order_date
SELECT order_date,
DATEADD(day, 5, order_date) AS new_date,
DATEADD(week, 5, order_date) AS new_week_date,
DATEADD(month, 4, order_date) AS new_month_date,
DATEADD(year, 3, order_date) AS new_year_date
FROM super;

-- Subtract date parts by using a negative value in DATEADD function
SELECT order_date,
DATEADD(day, -5, order_date) AS new_date,
DATEADD(week, -5, order_date) AS new_week_date,
DATEADD(month, -4, order_date) AS new_month_date,
DATEADD(year, -3, order_date) AS new_year_date
FROM super;

-- Calculate the difference in days between order_date and ship_date
SELECT order_date, ship_date,
DATEDIFF(day, order_date, ship_date) AS time_taken
FROM super;

-- Categorize profit into different categories based on its value
SELECT order_id, profit,
CASE
    WHEN profit < 100 THEN 'Low Profit'
    WHEN profit < 250 THEN 'Medium Profit'
    WHEN profit < 400 THEN 'High Profit'
    ELSE 'Very High Profit'
END AS profit_category
FROM super;

-- Add a date of birth (dob) column to the employee table
ALTER TABLE employee ADD dob DATE;

-- Update dob for each employee based on their age
UPDATE employee 
SET dob = DATEADD(year, -1 * emp_age, GETDATE());

-- Verify the update
SELECT * FROM employee;

-- Print employee name, their manager name, and difference in their age (in days) for employees whose year of birth is before their manager's year of birth
SELECT e1.emp_name, e2.emp_name AS manager_name, DATEDIFF(day, e1.dob, e2.dob) AS date_diff
FROM employee e1
INNER JOIN employee e2 ON e2.emp_id = e1.manager_id
WHERE DATEPART(yy, e1.dob) < DATEPART(yy, e2.dob);

-- Find subcategories that never had any return orders in the month of November
SELECT s.sub_category
FROM super s
LEFT JOIN returns r ON s.order_id = r.order_id
WHERE DATEPART(month, s.order_date) = 11
GROUP BY s.sub_category
HAVING COUNT(r.order_id) = 0;

-- Find order IDs where only one product was bought by the customer
SELECT order_id 
FROM super
GROUP BY order_id
HAVING COUNT(1) = 1;

-- Print manager names along with a comma-separated list (ordered by employee salary) of all employees directly reporting to them
SELECT e1.emp_name AS manager_name, STRING_AGG(e2.emp_name, ',') WITHIN GROUP (ORDER BY e2.salary DESC) AS list_of_emp
FROM employee e1
INNER JOIN employee e2 ON e1.emp_id = e2.manager_id
GROUP BY e1.emp_name;

-- Get number of business days between order_date and ship_date (excluding weekends)
SELECT order_date, ship_date,
DATEDIFF(day, order_date, ship_date) - 2 * DATEDIFF(week, order_date, ship_date) AS business_day
FROM super;

-- Print category, total_sales, and total sales of returned orders
SELECT s.category, SUM(s.sales) AS total_sales,
SUM(CASE WHEN r.order_id IS NOT NULL THEN s.sales END) AS return_sale
FROM super s
LEFT JOIN returns r ON s.order_id = r.order_id
GROUP BY s.category;

-- Print category, total sales in 2019, and total sales in 2020
SELECT s.category,
SUM(CASE WHEN DATEPART(yy, s.order_date) = 2019 THEN s.sales END) AS sale_2019,
SUM(CASE WHEN DATEPART(yy, s.order_date) = 2020 THEN s.sales END) AS sale_2020
FROM super s
LEFT JOIN returns r ON s.order_id = r.order_id
GROUP BY s.category;

-- Print top 5 cities in the West region by average number of days between order date and ship date
SELECT TOP 5 city, AVG(DATEDIFF(day, s.order_date, s.ship_date)) AS avg_day
FROM super s
LEFT JOIN returns r ON s.order_id = r.order_id
WHERE region = 'West'
GROUP BY s.city
ORDER BY avg_day DESC;

-- Print employee name, manager name, and senior manager name (manager's manager)
SELECT e1.emp_name, e2.emp_name AS manager_name, e3.emp_name AS senior_manager
FROM employee e1 
INNER JOIN employee e2 ON e1.manager_id = e2.emp_id
INNER JOIN employee e3 ON e2.manager_id = e3.emp_id;
