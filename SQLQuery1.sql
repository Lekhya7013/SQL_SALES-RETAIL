-----SQL sales analysis of retail-----
create database sqlproject1;

----create table
drop table if exists;
create table sales_retail(transactions_id	int primary key,
                   sale_date date,	
                   sale_time time,
                   customer_id int,
				   gender varchar(10),	
                   age int,
				   category	varchar(20),
                   quantiy int,
				   price_per_unit float,
                   cogs float,	
                   total_sale float);

BULK INSERT sales_retail
FROM 'C:\Users\LEKHYA\OneDrive\Documents\SQL - Retail Sales Analysis_utf .csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
select * from sales_retail ;
select count(*) as total_count from sales_retail;
-----------data cleaning--------
select * from sales_retail where transactions_id is null;
select * from sales_retail where sale_date is null;
select * from sales_retail where sale_time is null;
----------instead of writting multiple times-------------
select * from sales_retail
where 
     transactions_id is null
	 or 
	 sale_date is null
	 or
	 sale_time is null
	 or 
	 customer_id is null 
	 or
	 gender is null
	 or
	 age is null
	 or category is null
	 or 
	 quantiy is null 
	 or 
	 price_per_unit is null 
	 or
	 cogs is null
	 or 
	 total_sale is null;
delete from sales_retail 
where 
     transactions_id is null
	 or 
	 sale_date is null
	 or
	 sale_time is null
	 or 
	 customer_id is null 
	 or
	 gender is null
	 or
	 age is null
	 or category is null
	 or 
	 quantiy is null 
	 or 
	 price_per_unit is null 
	 or
	 cogs is null
	 or 
	 total_sale is null;
-----------------data exploration---
----how many sales we have 
select count(*) from sales_retail;
-----------how many unique customers we have
select count(distinct(customer_id)) as total_customers from sales_retail;
-------------how many unique categories we have-------
select count(distinct(category)) as total_categories from sales_retail;
select distinct category as categories from sales_retail;

---------------data analysis and bussiness key problem and answer
--1.write an sql query to retrive all columns for sales made on '2022-11-05'?
select * from sales_retail where sale_date='2022-11-05'

--2.write a sql query to retrive category,transactions_id,quantiy where the category is 'clothing' and the
--quantity sold is more than 3 in the month of nov-2022
select category,transactions_id,quantiy from sales_retail where category='clothing' and 
sale_date between '2022-11-01' and '2022-11-30' and quantiy>3;

--3.write a sql query to caluculate the total sales(total_Sale) for each category
select sum(total_sale),category from sales_retail group by category;

--4.write a category to find the the average age of customers wgo purcahsed itrems from the 'beauty' cataegory

select avg(age) as avg_age from sales_retail where category='Beauty';

--5.write a query to find all tranactions where 'total_Sale' is greater than 1000
select * from sales_retail where total_sale>1000;

--6.write an sql query to find total no of transactions (transactions_id) made by each gender in each category
select count(transactions_id),category,gender from sales_retail   group by category, gender;

--7.write a sql query to find no of unique customers who purchased item from each category
select count(distinct(customer_id)),category from sales_retail group by category;

---end---

