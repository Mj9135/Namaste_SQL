-- Select all records from the 'returns' table
select * from returns;

-- Inner join 'returns' and 'super' tables on 'order_id', selecting all columns from both tables
select *
from returns r
inner join super s
on s.order_id=r.order_id;

-- Select distinct 'order_id' from 'super' where there is a matching 'order_id' in 'returns'
select distinct(s.order_id)
from super s
inner join returns r
on s.order_id=r.order_id;

-- Inner join 'returns' and 'super' tables on 'order_id', selecting all columns from both tables
select * from
super s 
inner join returns r on s.order_id=r.order_id;

-- Inner join 'returns' and 'super' tables on 'order_id', selecting all columns from 'super' and 'return_reason' from 'returns'
select s.*,r.return_reason 
from super s 
inner join returns r
on s.order_id=r.order_id;

-- Inner join 'returns' and 'super' tables on 'order_id', selecting all columns from 'returns'
select r.* from 
super s 
inner join returns r
on s.order_id=r.order_id;

-- Left join 'returns' and 'super' tables on 'order_id', selecting specific columns including 'return_reason'
select s.order_id, s.product_id, r.return_reason, r.order_id as return_order_id
from super s
left join returns r on s.order_id=r.order_id;

-- Left join 'returns' and 'super' tables on 'order_id', selecting all columns from both tables where 'order_id' in 'returns' is null
select *
from super s
left join returns r on s.order_id=r.order_id
where r.order_id is null;

-- Left join 'returns' and 'super' tables on 'order_id', grouping by 'return_reason' and summing 'sales', selecting 'return_reason' and total sales
select r.return_reason, sum(sales) as Total_sales
from super s
left join returns r on s.order_id=r.order_id
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
insert into employee values (1,'Ankit',100,10000,4,39);
insert into employee values (2,'Mohit',100,15000,5,48);
insert into employee values (3,'Vikas',100,10000,4,37);
insert into employee values (4,'Rohit',100,5000,2,16);
insert into employee values (5,'Mudit',200,12000,6,55);
insert into employee values (6,'Agam',200,12000,2,14);
insert into employee values (7,'Sanjay',200,9000,2,13);
insert into employee values (8,'Ashish',200,5000,2,12);
insert into employee values (9,'Mukesh',300,6000,6,51);
insert into employee values (10,'Rakesh',500,7000,6,50);

-- Create 'dept' table
create table dept(
    dep_id int,
    dep_name varchar(20)
);

-- Insert records into 'dept' table
insert into dept values (100,'Analytics');
insert into dept values (200,'IT');
insert into dept values (300,'HR');
insert into dept values (400,'Text Analytics');

-- Select all records from 'employee' table
select * from employee;

-- Select all records from 'dept' table
select * from dept;

-- Cross join 'employee' and 'dept' tables, selecting all columns and ordering by 'emp_id'
select * from employee, dept
order by employee.emp_id;

-- Cross join 'employee' and 'dept' tables using 'inner join' with condition 1=1, ordering by 'emp_id'
select * from employee
inner join dept on 1=1
order by employee.emp_id;

-- Inner join 'employee' and 'dept' tables on 'dept_id', selecting specific columns
select e.emp_id, e.emp_name, e.dept_id, d.dep_name 
from employee e
inner join dept d on e.dept_id=d.dep_id;

-- Left join 'employee' and 'dept' tables on 'dept_id', selecting specific columns
select e.emp_id, e.emp_name, e.dept_id, d.dep_name 
from employee e
left join dept d on e.dept_id=d.dep_id;

-- Right join 'employee' and 'dept' tables on 'dept_id', selecting specific columns
select e.emp_id, e.emp_name, e.dept_id, d.dep_name, d.dep_id 
from employee e
right join dept d on e.dept_id=d.dep_id;

-- Left join 'dept' and 'employee' tables on 'dept_id', selecting specific columns
select e.emp_id, e.emp_name, e.dept_id, d.dep_name, d.dep_id 
from dept d
left join employee e on e.dept_id=d.dep_id;

-- Full outer join 'dept' and 'employee' tables on 'dept_id', selecting specific columns
select e.emp_id, e.emp_name, e.dept_id, d.dep_name, d.dep_id 
from dept d
full outer join employee e on e.dept_id=d.dep_id;

-- Create 'people' table
create table people (
    manager varchar(20),
    region varchar(10)
);

-- Insert records into 'people' table
insert into people values ('Ankit', 'West'), ('Deepak', 'East'), ('Vishal', 'Central'), ('Sanjay', 'South');

-- Inner join 'returns', 'super', and 'people' tables on 'order_id' and 'region', selecting specific columns
select s.order_id, s.order_date, r.return_reason, p.region, p.manager
from super s
inner join returns r on s.order_id=r.order_id
inner join people p on s.region=p.region;

-- 1. Query to get region wise count of return orders
select s.region, count(1) as count_
from super s
inner join returns r on s.order_id=r.order_id
group by s.region;

-- 2. Query to get category wise sales of orders that were not returned
select s.category, sum(sales) as total_sales
from super s
left join returns r on s.order_id=r.order_id
where r.return_reason is null
group by category;

-- 3. Query to print department name and average salary of employees in that department
select d.dep_name, avg(e.salary) as avg_salary
from employee e 
inner join dept d on e.dept_id=d.dep_id
group by d.dep_name;

-- 4. Query to print department names where none of the employees have the same salary
select e.dept_id,d.dep_name
from employee e
left join dept d on e.dept_id=d.dep_id
group by dept_id,d.dep_name
having count(e.salary) = count(distinct e.salary);

-- 5. Query to print sub-categories where we have all 3 kinds of returns (Others, Bad Quality, Wrong Items)
SELECT s.sub_category 
FROM super s
INNER JOIN returns r ON s.order_id = r.order_id
GROUP BY s.sub_category
HAVING COUNT(DISTINCT r.return_reason) = 3;

-- 6. Query to find cities where not even a single order was returned
select city 
from super s
left join returns r on r.order_id=s.order_id
group by city
having count(r.return_reason) = 0;

-- 7. Query to find top 3 subcategories by sales of returned orders in East region
select top 3 s.sub_category, sum(sales) as sal 
from super s
left join returns r on s.order_id=r.order_id
where s.region = 'East'
group by s.sub_category 
order by sum(sales) desc;

-- 8. Query to print department name for which there is no employee
select d.dep_name 
from dept d
left join employee e on e.dept_id=d.dep_id
group by dep_name
having count(e.emp_id) = 0;

-- 9. Query to print employees' names for departments not available in 'dept' table
select e.emp_name 
from employee e
left join dept d on e.dept_id=d.dep_id
where d.dep_id is NULL;
