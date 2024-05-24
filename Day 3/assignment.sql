select * from store;
select * from store;

select top 5 Order_Date,Order_ID from store;
select top 5 *  from store order by Order_Date desc;
--to get distinct value of a column
select distinct Ship_Mode from store;

--Filter
select * from store 
where Ship_Mode='First Class';
select * from store
where Order_Date='2020-12-08';

select top 5 Order_Date,Quantity from store
where quantity >=5
order by Quantity desc;

select * from store
where Order_Date between'2020-12-08' and '2020-12-12' and  Quantity>=6
order by Quantity;

select * from store 
where Ship_Mode in('First Class','Same Day');

select *  from store
where quantity in(3,5,7)
order by Quantity desc;
 
select * from store 
where Ship_Mode not in('First Class','Same Day');

select * from store
where Ship_Mode='First Class' and Segment='consumer';

select * from store
where Ship_Mode='First Class' or Segment='consumer';

select *,profit/sales as ratio from store; 

select order_id,order_date,customer_name
from store
where Customer_Name like 'C%';

select order_id,order_date,customer_name
from store
where Customer_Name like '%schild';

select order_id,order_date,customer_name
from store
where Customer_Name like '%eve%';


select order_id,order_date,customer_name
from store
where Customer_Name like 'a%a';

select order_id,order_date,customer_name
from store
where Customer_Name like '_o%';

select Order_id,order_date,customer_name
from store
where Customer_Name like '__________';


--Assignment Day 3
--1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
select * from store
where Customer_Name like '_a_d%';

--2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
select * from store
where Order_Date >='2020-12-01' and Order_Date<= '2020-12-31';

--3- write a query to get all the orders where ship_mode is neither in '3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
select * from store
where Ship_Mode !='Standard Class' and Ship_Mode!='First Class' and Ship_Date>'2020-11-30';

--4 write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)

select * from store
where Customer_Name not like 'A%N' ;

select * from store
where not (Customer_Name like 'a%' and Customer_Name like '%n');


--5- write a query to get all the orders where profit is negative (1871 rows)
select * from store where
profit<0;

--6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
select * from store
 where Quantity<3 or profit=0;

--7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
select * from store
where Region='south' and Discount>0;

--8- write a query to find top 5 orders with highest sales in furniture category 
select top 5 * from store 
where Category='Furniture'
order by Sales desc; 

--9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
select * from store
where Category in('Furniture','Technology') and Order_Date between '2020-01-01' and '2020-12-31';


--10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
select * from store 
where Order_Date between '2020-01-0 1' and '2020-12-31' and Ship_Date between '2021-01-01' and '2021-12-31';