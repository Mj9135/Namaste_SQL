-- Drop the table 'amazon' if it exists to ensure a fresh start
DROP TABLE IF EXISTS amazon;

-- Create Table
-- This command creates a table named 'amazon' with columns for order date, order ID, product name,
-- total price, and payment method.
CREATE TABLE amazon(
    order_date DATE,
    order_id INTEGER,
    product_name VARCHAR(100),
    total_price DECIMAL(5,2),
    payment_method VARCHAR(100)
);

-- Insert Data into Table
-- These commands insert four records into the 'amazon' table.
INSERT INTO amazon VALUES('2024-04-01', 1234, 'Keyboard', 400, 'Card');
INSERT INTO amazon VALUES('2024-04-01', 1235, 'Mouse', 300, 'UPI');
INSERT INTO amazon VALUES('2024-04-01', 1236, 'Pendrive', 600, 'Cash');

-- Note: The following insert statement has an extra value 'Delhi', which does not match the table structure
-- Uncomment and correct if needed:
-- INSERT INTO amazon VALUES('2024-04-08 11:10:34', 1266, 'Drive', 600, 'Cash', 'Delhi');

-- Display Table
-- This command selects and displays all data from the 'amazon' table.
SELECT * FROM amazon;

-- Limiting Column
-- This command selects and displays only the 'total_price' and 'product_name' columns from the 'amazon' table.
SELECT total_price, product_name FROM amazon;

-- Limiting Rows
-- This command selects and displays the top 2 rows from the 'amazon' table.
SELECT TOP 2 * FROM amazon;

-- Change column datatype and size
-- This command alters the 'order_date' column to be of type 'DATETIME'.
ALTER TABLE amazon ALTER COLUMN order_date DATETIME;

-- Adding new column in table
-- This command adds a new column named 'address' with a varchar data type and a maximum length of 100 to the 'amazon' table.
ALTER TABLE amazon ADD address VARCHAR(100);

-- Deleting column in table
-- This command attempts to drop the 'addre' column, but it should be 'address'.
-- Corrected command:
ALTER TABLE amazon DROP COLUMN address;

-- Data sorting
-- This command selects and displays all data from the 'amazon' table and sorts it by 'total_price' in ascending order.
SELECT * FROM amazon ORDER BY total_price;

-- This command selects and displays all data from the 'amazon' table and sorts it by 'total_price' in descending order and by 'order_date' in ascending order.
SELECT * FROM amazon ORDER BY total_price DESC, order_date ASC;

-- New Table for playing with constraints
-- Drop the table 'student' if it exists to ensure a fresh start
DROP TABLE IF EXISTS student;

-- Create Table
-- This command creates a table named 'student' with columns for Name, Age, Roll_No, and DOB.
CREATE TABLE student(
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Roll_No VARCHAR(20),
    DOB DATE
);

-- Display the empty 'student' table structure.
SELECT * FROM student;

-- Insert Data into Table
-- These commands insert six records into the 'student' table.
INSERT INTO student VALUES('Mrityunjay', 21, '124', '2003-01-21');
INSERT INTO student VALUES('Anshul', 21, '97', '2003-06-12');
INSERT INTO student VALUES('Ayush', 21, '53', '2003-11-12');
INSERT INTO student VALUES('Gagan', 21, '49', '2003-08-24');
INSERT INTO student VALUES('Suraj', 18, '72', '2002-04-12');
INSERT INTO student VALUES('Yashwant', 23, '132', '2002-11-11');

-- Adding Not Null constraints through alter table
-- This command alters the 'DOB' column to add a NOT NULL constraint.
ALTER TABLE student ALTER COLUMN DOB DATE NOT NULL;

-- Dropping Not Null from column
-- This command alters the 'DOB' column to remove the NOT NULL constraint.
ALTER TABLE student ALTER COLUMN DOB DATE;

-- Check Constraints
-- Drop the table 'student' if it exists to ensure a fresh start
DROP TABLE IF EXISTS student;

-- This command creates a table named 'student' with check constraints on the 'Name' and 'Age' columns.
CREATE TABLE student(
    Name VARCHAR(100) NOT NULL CHECK (Name IN ('Mrityunjay', 'Anshul', 'Ayush', 'Gagan', 'Suraj', 'Yashwant')),
    Age INT NOT NULL CHECK (Age >= 18),
    Roll_No VARCHAR(20),
    DOB DATE
);

-- Defining Check Constraints on Multiple Columns
-- Drop the table 'student' if it exists to ensure a fresh start
DROP TABLE IF EXISTS student;

-- This command creates a table named 'student' with a composite check constraint on the 'Age' and 'Name' columns.
CREATE TABLE student(
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Roll_No VARCHAR(20),
    DOB DATE,
    CONSTRAINT chk_students CHECK (Age >= 18 AND Name IN ('Mrityunjay', 'Anshul', 'Ayush', 'Gagan', 'Suraj', 'Yashwant'))
);

-- Adding Constraints through Alter Method
-- This command adds a check constraint to ensure 'Age' is less than or equal to 15.
ALTER TABLE student ADD CHECK (Age <= 15);

-- This command adds a composite check constraint on the 'Age' and 'Name' columns.
ALTER TABLE student ADD CONSTRAINT chk_students CHECK (Age >= 18 AND Name IN ('Mrityunjay', 'Anshul', 'Ayush', 'Gagan', 'Suraj', 'Yashwant'));

-- Drop Constraints
-- This command drops the 'chk_students' constraint from the 'student' table.
ALTER TABLE student DROP CONSTRAINT chk_students;

-- Unique Constraints
-- Drop the table 'student' if it exists to ensure a fresh start
DROP TABLE IF EXISTS student;

-- This command creates a table named 'student' with unique constraints on the 'Roll_No' column and a check constraint on the 'Name' and 'Age' columns.
CREATE TABLE student(
    Name VARCHAR(100) NOT NULL CHECK (Name IN ('Mrityunjay', 'Anshul', 'Ayush', 'Gagan', 'Suraj', 'Yashwant')),
    Age INT NOT NULL CHECK (Age >= 18),
    Roll_No VARCHAR(20) UNIQUE,
    DOB DATE
);

-- Adding Unique Constraints with Alter Table
-- This command adds a unique constraint on the 'Name' column.
ALTER TABLE student ADD UNIQUE (Name);

-- Adding Unique Constraints to Multiple Columns
-- This command adds a composite unique constraint on the 'Age' and 'DOB' columns.
ALTER TABLE student ADD CONSTRAINT uc_student UNIQUE (Age, DOB);

-- Drop Unique Constraints
-- This command drops the composite unique constraint on the 'Age' and 'DOB' columns.
ALTER TABLE student DROP CONSTRAINT uc_student;

-- Default Constraints
-- Drop the table 'student' if it exists to ensure a fresh start
DROP TABLE IF EXISTS student;

-- This command creates a table named 'student' with a default constraint on the 'city' column.
CREATE TABLE student(
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL CHECK (Age >= 18),
    Roll_No VARCHAR(20) UNIQUE,
    DOB DATE,
    city VARCHAR(20) CHECK (city IN ('Delhi', 'JSR')) DEFAULT 'JSR'
);

-- Insert Data into Table using DEFAULT
-- These commands insert records into the 'student' table, using the default value for the 'city' column where specified.
INSERT INTO student VALUES('Mrityunjay', 21, '124', '2003-01-21', DEFAULT);
INSERT INTO student (Name, Age, Roll_No, DOB) VALUES('Anshul', 21, '97', '2003-06-12');
INSERT INTO student (Name, Age, Roll_No, DOB) VALUES('Ayush', 21, '53', '2003-11-12');
INSERT INTO student (Name, Age, Roll_No, DOB) VALUES('Gagan', 21, '49', '2003-08-24');
INSERT INTO student (Name, Age, Roll_No, DOB) VALUES('Suraj', 18, '72', '2002-04-12');
INSERT INTO student (Name, Age, Roll_No, DOB, city) VALUES('Yashwant', 23, '132', '2002-11-11', DEFAULT);

-- Display the 'student' table data.
SELECT * FROM student;

-- Default constraint using alter table
-- This command adds a default constraint on the 'Age' column with a default value of 21.
ALTER TABLE student ADD CONSTRAINT ct_stud DEFAULT 21 FOR Age;

-- Insert Data into Table using new default constraint
-- These commands insert records into the 'student' table, using the default value for the 'Age' column where specified.
INSERT INTO student (Name, Roll_No, DOB) VALUES('Anshul', '97', '2003-06-12');
INSERT INTO student (Name, Roll_No, DOB) VALUES('Ayush', '57', '2003-11-12');
INSERT INTO student (Name, Roll_No, DOB) VALUES('Gagan', '49', '2003-08-24');
INSERT INTO student (Name, Roll_No, DOB) VALUES('Suraj', '72', '2002-04-12
