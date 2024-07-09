CREATE TABLE employeeinfo (
 employee_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 department VARCHAR(50)
);

CREATE TABLE employeedetail (
 employee_id INT PRIMARY KEY,
 salary DECIMAL(10,2),
 hire_date DATE,
 job_title VARCHAR(50),
 FOREIGN KEY (employee_id) REFERENCES employeeinfo(employee_id)
);


INSERT INTO employeeinfo (employee_id, first_name, last_name, department)
VALUES
 (1, 'Hari', 'Kumar', 'Marketing'),
 (2, 'Dau', 'Das', 'Sales'),
 (3, 'R', 'Madhav', 'Engineering'),
 (4, 'Lalita', 'Kumari', 'Human Resources'),
 (5, 'Raghav', 'Singh', 'IT');
 
 
INSERT INTO employeedetail (employee_id, salary, hire_date, job_title)
VALUES
 (1, 80000.00, '2020-01-01', 'Marketing Manager'),
 (2, 65000.00, '2021-05-12', 'Sales Representative'),
 (3, 95000.00, '2019-07-28', 'Senior Engineer'),
 (4, 50000.00, '2022-10-20', 'HR Specialist'),
 (5, 72000.00, '2018-03-15', 'Network Administrator');
select * from employeeinfo; 

select * from employeedetail;

-- 1. Find employees in a specific department:

select * from employeeinfo
where department='Marketing';

--2.Get employees with their salaries and hire dates

select ei.first_name,ei.last_name,e.salary,e.hire_date from employeedetail e inner join employeeinfo ei
on e.employee_id=ei.employee_id

--3. Calculate average salary per department:

select e.department,round(avg(ei.salary),0) as sal from employeeinfo e join employeedetail ei on e.employee_id=ei.employee_id
group by e.department;

--4. Find employees hired before a specific date

select * from employeedetail
where hire_date<'2020-01-01';

--5.Find employees with a specific job title- SR and salary range- 50K to 70K

SELECT * FROM employeedetail
WHERE job_title = 'Sales Representative' AND salary between 50000 and 70000;

--6. Count employees by department and job title
select e.department,count(e.employee_id) from employeeinfo e left join employeedetail ei on e.employee_id=ei.employee_id
group by e.department,ei.job_title

SELECT department, job_title, COUNT(*) AS employee_count
FROM employeeinfo e
INNER JOIN employeedetail d ON e.employee_id = d.employee_id
GROUP BY department, job_title;

--7.Find the highest-paid employee in each department

select employee_id,max(salary) from employeedetail 
group by employee_id,salary
order by salary desc
limit 1

9. Find employees with duplicate names:

select first_name,last_name, count(concat(first_name,' ',last_name)) as duplicate_count from employeeinfo
group by employee_id

--10. Find employees whose job title doesn't exist in the employeeinfo table:

SELECT * FROM employeedetail
WHERE job_title NOT IN (SELECT job_title FROM employeeinfo);


 
 