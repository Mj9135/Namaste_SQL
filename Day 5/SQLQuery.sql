-- Select all records from the 'returns' table
select * from returns;

-- Select specific columns from the 'super' and 'returns' tables, using an INNER JOIN to get matching records
select s.order_id, s.order_date, r.return_reason
from super s
inner join returns r
on s.order_id = r.order_id;

-- Select distinct order IDs from the 'super' table that have matching records in the 'returns' table
select distinct(s.order_id)
from super s
inner join returns r
on s.order_id = r.order_id;

-- Select all columns from both 'super' and 'returns' tables where there is a matching order_id
select * from super s
inner join returns r on s.order_id = r.order_id;

-- Select all columns from the 'super' table and the return reason from the 'returns' table for matching records
select s.*, r.return_reason
from super s
inner join returns r
on s.order_id = r.order_id;

-- Select all columns from the 'returns' table where there are matching records in the 'super' table
select r.* from super s
inner join returns r
on s.order_id = r.order_id;

-- Select specific columns from both 'super' and 'returns' tables, using a LEFT JOIN to include all records from 'super'
select s.order_id, s.product_id, r.return_reason, r.order_id as return_order_id
from super s
left join returns r on s.order_id = r.order_id;

-- Select all columns from 'super' table and perform a LEFT JOIN with 'returns' table to find orders with no returns
select *
from super s
left join returns r on s.order_id = r.order_id
where r.order_id is null;

-- Select return reasons and the total sales for each return reason, using a LEFT JOIN and grouping by return reason
select r.return_reason, sum(sales) as Total_sales
from super s
left join returns r on s.order_id = r.order_id
where r.return_reason is not null
group by r.return_reason;

-- Create 'employee' table
create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);

-- Insert records into 'employee' table
insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);

-- Create 'dept' table
create table dept(
    dep_id int,
    dep_name varchar(20)
);

-- Insert records into 'dept' table
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');

-- Select all records from 'employee' table
select * from employee;

-- Select all records from 'dept' table
select * from dept;

-- Cross Join: Select all combinations of records from 'employee' and 'dept' tables, ordered by employee ID
select * from employee, dept
order by employee.emp_id;

-- Cross Join using INNER JOIN with a condition that always evaluates to true
select * from employee
inner join dept on 1=1
order by employee.emp_id;

-- INNER JOIN: Select specific columns from 'employee' and 'dept' tables for matching department IDs
select e.emp_id, e.emp_name, e.dept_id, d.dep_name from employee e
inner join dept d on e.dept_id = d.dep_id;

-- LEFT JOIN: Select specific columns from 'employee' and 'dept' tables, including all employees even if no matching department
select e.emp_id, e.emp_name, e.dept_id, d.dep_name from employee e
left join dept d on e.dept_id = d.dep_id;

-- RIGHT JOIN: Select specific columns from 'employee' and 'dept' tables, including all departments even if no matching employee
select e.emp_id, e.emp_name, e.dept_id, d.dep_name, d.dep_id from employee e
right join dept d on e.dept_id = d.dep_id;

-- LEFT JOIN from 'dept' to 'employee' to show all departments, including those without employees
select e.emp_id, e.emp_name, e.dept_id, d.dep_name, d.dep_id from dept d
left join employee e on e.dept_id = d.dep_id;

-- FULL OUTER JOIN: Select specific columns from 'dept' and 'employee' tables, including all records from both tables
-- Note: MySQL does not support FULL OUTER JOIN directly. This is an example assuming such support.
select e.emp_id, e.emp_name, e.dept_id, d.dep_name, d.dep_id from dept d
full outer join employee e on e.dept_id = d.dep_id;

-- Create 'people' table
create table people
(
    manager varchar(20),
    region varchar(10)
);

-- Insert records into 'people' table
insert into people values ('Ankit','West'), ('Deepak','East'), ('Vishal','Central'), ('Sanjay','South');

-- Select all records from 'people' table
select * from people;
