-- 01/50 Days SQL challenge

-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert records for three departments
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

select * from employees

/*

Write the SQL query to find the second highest salary

*/

--Method-1
select * from employees
order by salary desc
limit 1 offset 1;

--Method-2
select * from(
select *, row_number() over(order by salary desc) rn
from employees
)
where rn=2


-- Question: Get the details of the employee with the second-highest salary from each department

select department,max(salary) as salary from employees
where salary<(select max(salary) from employees)
group by department

select department,max(salary) as salary from employees
group by department


--Day 2

/*
-- 02 of 100 Days Challenge
-- Amazon Interview questions by Abbas


--Considering the below three tables, write a query that would:

i. List out the department wise maximum salary, minimum salary, average salary of the employees. 
ii. List out employee having the third highest salary.
iii. List out the department having at least four employees.
iv. Find out the employees who earn greater than the average salary for their department.
*/


CREATE TABLE department (
    Department_ID INT PRIMARY KEY,
    Department VARCHAR(50),
    Location_ID INT
);

-- Insert data into department table
INSERT INTO department (Department_ID, Department, Location_ID)
VALUES 
    (10, 'Accounting', 122),
    (20, 'Research', 124),
    (30, 'Sales', 123),
    (40, 'Operations', 167);


-- Create emp_fact table

CREATE TABLE emp_fact (
    Employee_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Job_ID INT,
    Manager_ID INT,
    Hired_Date DATE,
    Salary DECIMAL(10, 2),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES department(Department_ID)
);

-- Insert data into emp_fact table
INSERT INTO emp_fact (Employee_ID, Emp_Name, Job_ID, Manager_ID, Hired_Date, Salary, Department_ID)
VALUES 
    (7369, 'John', 667, 7902, '2006-02-20', 800.00, 10),
    (7499, 'Kevin', 670, 7698, '2008-11-24', 1550.00, 20),
    (7505, 'Jean', 671, 7839, '2009-05-27', 2750.00, 30),
    (7506, 'Lynn', 671, 7839, '2007-09-27', 1550.00, 30),
    (7507, 'Chelsea', 670, 7110, '2014-09-14', 2200.00, 30),
    (7521, 'Leslie', 672, 7698, '2012-02-06', 1250.00, 30);

-- Create jobs table


CREATE TABLE jobs (
    Job_ID INT PRIMARY KEY,
    Job_Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert data into jobs table
INSERT INTO jobs (Job_ID, Job_Role, Salary)
VALUES 
    (667, 'Clerk', 800.00),
    (668, 'Staff', 1600.00),
    (669, 'Analyst', 2850.00),
    (670, 'Salesperson', 2200.00),
    (671, 'Manager', 3050.00),
    (672, 'President', 1250.00);

SELECT * FROM department;
SELECT * FROM emp_fact;
SELECT * FROM jobs;


-- i. List out the department wise maximum salary, 
-- minimum salary, average salary of the employees.

-- join d and e on departid
-- departmentname, ef. salary
-- GROUP BY departmentname, MIN, MAX, AVG

select d.department,max(ef.salary) as maxi,min(ef.salary) as minxi, round(avg(ef.salary),2) as avge
from department as d join emp_fact as ef
on d.department_id=ef.department_id
group by d.department

-- 3rd height salary
select * from emp_fact
order by salary desc
limit 1 offset 2;




select * from employees

--List out the name of the emp whose salary is greater than average salary
select * from employees
where salary>(select avg(salary) from employees)



