select * from store_sales

/* check first  rows */
 select * from store_sales
 limit 10;
 
 /* check how many rows */
 
 select count(*) from store_sales;
 
 /* how many rows in each month*/
 
 select month_of_year,count(*) from store_sales
 group by month_of_year
 order by month_of_year;
 
 /*maximum number of employees during any shift of the year */
 
 select max(employee_shifts) from store_sales
 
 /*what is the smallest number of employees during any shift of the year*/
 SELECT * FROM store_sales
 
select min(employee_shifts) from store_sales;
 
 /* min, max together */
 select max(employee_shifts) as max_employee,
 min(employee_shifts) as min_employee from store_sales;
 
/* min, max employees in during per shift of the year*/
select month_of_year,max(employee_shifts),min(employee_shifts)
from store_sales
group by month_of_year
order by month_of_year asc;

/******************************************************/
SELECT * FROM store_sales

/* what is the total unit sold */

select sum(units_sold) from store_sales;

/* What is the total unit sold , avg unit sold per month? */

select month_of_year, sum(units_sold) as total_unit_sold,
round(avg(units_sold),2) as avg_unit_sold from store_sales
group by month_of_year
order by month_of_year asc;


/************************** Standard Deviation & Variance ******/
 /* how spread out the unit sold in each month? */
 /* As we can see from the result, variance values quite high. Because variance measure in squared.
 so better way to get a sense of spread out is standard deviation*/
 
 select month_of_year,sum(units_sold) as total_unit_sold,
 round(avg(units_sold),2) as average_unit_sold,
 var_pop(units_sold) as variance_units_sold,
 stddev_pop(units_sold) as std_units_sold
 from store_sales
 group by month_of_year
 order by month_of_year asc;
 
 /* Interpretation based on data: 
For month 1, it seems like stddev is pretty close around 3.48 across the sales.

However like month 12, it seems like stddev is very large 231.15 across the sales. 
So it seems like in some sales, many units are sold in large quanity and some sales aren't. 
So we can check whether our assumptions are correct or not */

/* When we check the data and our assumptions are correct.
* for 12 month, lowest sales is 0 and largest sale is 879 which leads to large value of stddev.*/ 
SELECT 
	month_of_year, 
	MIN(units_sold),
	MAX(units_sold)
FROM store_sales
GROUP BY month_of_year
ORDER BY month_of_year ASC;
 
 
 




 
 
 
 
 
