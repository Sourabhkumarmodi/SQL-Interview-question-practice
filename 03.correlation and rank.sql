select * from store_sales
/********************* Correlation and Ranks  *******/
/* check the correlation between revenue and unit sold */
select corr(units_sold,revenue) from store_sales;

/* we can see that there is a high correlation between revenue and units sold, which make sense.*/

/* What about correlation between unit sold and number of employees on shift? */

select corr(units_sold, employee_shifts) from store_sales;

/* As per the result, there is a positive correlation of 0.5595 but not as strong as between units sold and revenue */

/* What about correlation between unit sold and month of the year */

select corr(units_sold, month_of_year)
from store_sales;

/* As per the result, there is a very very low positive correlation of 0.128.
which again make sense because month value increase from 1 to 12 and revenue gets high on december although these 1, 2,..1
numbers shouldn't have no correlation with the unit sold.
*/


/*------------------------------------------------------------*/

/************** Rows Number **********/

/* Row Number is a window function which operates an ordered set. It is added as a new column to the result
It is very useful when we want to assign row order based on the ordered list.
*/

/* we want to add a row number based on the units sold*/
select row_number() over(order by units_sold),
sale_date,month_of_year,units_sold from store_sales;

/* We also want to know the standing (rank) of month_of_year based on the units sold */

select row_number() over(order by units_sold),
sale_date,month_of_year,units_sold
from store_sales
order by month_of_year;

/*-------------------------------------------------------------------------------------------*/


/*********** Mode ***********/

/* What is the frequently occuring numbers of employee per shift in each month? */
/* we can see that May through July and December are the months which have most number of employee on shifts*/
SELECT 
	month_of_year,
	MODE() WITHIN GROUP(ORDER BY employee_shifts) AS most_frequent_employee_shifts
FROM store_sales
GROUP BY month_of_year;