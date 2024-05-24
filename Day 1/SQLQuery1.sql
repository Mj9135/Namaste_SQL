-- Create Table
-- This command creates a table named 'mj' with six columns: 
-- 'order_id' (integer), 'order_date' (date), 'customer_name' (varchar with a maximum length of 30), 
-- 'product_name' (varchar with a maximum length of 20), 'price' (decimal with precision 15 and scale 2),
-- and 'payment_method' (varchar with a maximum length of 20).
CREATE TABLE mj (
    order_id INTEGER,
    order_date DATE,
    customer_name VARCHAR(30),
    product_name VARCHAR(20),
    price DECIMAL(15,2),
    payment_method VARCHAR(20)
);

-- Insert Values in Table
-- These commands insert four records into the 'mj' table.
INSERT INTO mj VALUES (1, '2024-01-01', 'Mrityunjay', 'Laptop', 40000, 'UPI');
INSERT INTO mj VALUES (2, '2024-01-02', 'Gagandeep', 'Pendrive', 800, 'UPI');
INSERT INTO mj VALUES (3, '2024-01-03', 'Anshul', 'Mouse', 300, 'UPI');
INSERT INTO mj VALUES (4, '2024-01-04', 'Ayush', 'Keyboard', 900, 'UPI');

-- Limiting Column
-- This command selects and displays only the 'order_id', 'customer_name', and 'price' columns from the 'mj' table.
SELECT order_id, customer_name, price FROM mj;

-- Limiting Rows
-- This command selects and displays the top 3 rows from the 'mj' table.
SELECT TOP 3 * FROM mj;

-- Change column data type and size
-- These commands alter the data type of the 'order_date' column to 'DATETIME'
-- and the 'price' column to 'INTEGER'.
ALTER TABLE mj ALTER COLUMN order_date DATETIME;
ALTER TABLE mj ALTER COLUMN price INTEGER;

-- Adding new column in table
-- This command adds a new column named 'address' with a varchar data type and a maximum length of 30 to the 'mj' table.
ALTER TABLE mj ADD address VARCHAR(30);

-- Inserting values into the new column (corrected method)
-- These commands update the 'address' column for the specific rows based on 'order_id'.
UPDATE mj SET address = 'value1' WHERE order_id = 1;
UPDATE mj SET address = 'value2' WHERE order_id = 2;
UPDATE mj SET address = 'value3' WHERE order_id = 3;

-- Drop the new column
-- This command drops the 'address' column from the 'mj' table.
ALTER TABLE mj DROP COLUMN address;

-- Delete rows with NULL order_id
-- This command deletes rows from the 'mj' table where the 'order_id' column has NULL values.
DELETE FROM mj WHERE order_id IS NULL;

-- Sort the data
-- This command selects and displays all data from the 'mj' table and sorts it by 'price' in ascending order
-- and by 'customer_name' in descending order.
SELECT * FROM mj ORDER BY price, customer_name DESC;
