use prep;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
select * from employee;

-- SQL Window Function
/* Window function in SQL is known as analytic function which uses values from one or 
multiple rows to return a value for each row. This contrasts with aggregate function, which 
returns a single value for multiple rows*/
/*Windows function have an OVER clause. Any function without an over 
clause is not a window fuction.*/
select max(SALARY) as 'Maximum Salary' from employee;
-- Extract Max Salary Dept. Wise
select DEPT_NAME as 'Department Name',max(SALARY) as 'Maximum Salary' from 
employee group by DEPT_NAME;
-- select DEPT_NAME as 'Department Name',SALARY from employee group by DEPT_NAME
-- having avg(SALARY) >(select SALARY from employee )
select e.*,
max(SALARY) over() as max_salary
from employee e;
/*Over() will help you to create window of record and one window 
for whole record(here 24 records)* and it applys the max() function 
which is aggregate function*/
-- if we want windows dept. wise
select e.*,
max(SALARY) over(partition by DEPT_NAME order by SALARY desc) as max_salary
from employee e ;
select * from
(select e.*,
rank() over(partition by DEPT_NAME order by SALARY desc) as 'rank'
from employee e) as x where x.rank<2;

use prep;
select * from employee;

select *,
row_number() over(order by salary  ) as 'Index'
from employee ;


select *,
row_number() over(order by salary  ) as 'Index' ,
rank() over(order by salary) as 'Rank',
dense_rank() over(order by salary) as 'Dense Rank'
 from employee ;
 
select * ,
last_value(emp_NAME) over () as 'Last Value'
from employee;
