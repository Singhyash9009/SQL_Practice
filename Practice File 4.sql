use hr;

select count(employee_id) from employees;

select d.department_name Department_Name,count(employee_id) Employee_Count from employees e join departments d on e.department_id=d.department_id
group by e.department_id;

select first_name,salary from employees
where salary>6000;

select count(employee_id) from employees
where salary>20000;


select * from employees
where commission_pct is not null;

select concat(first_name," ",last_name) FULL_NAME from employees
where commission_pct is null;

select employee_id,concat(first_name," ",last_name) FULL_NAME,email,phone_number Contact_Number  from employees
where commission_pct is not null;

select * from(
select * , dense_rank() over(partition by department_name order by salary desc) rnk from
(select d.department_name department_name , e.salary salary from employees e 
join departments d on e.department_id =d.department_id)a)b where rnk=1 limit 3;


select d.department_name department_name , max(e.salary) salary from employees e 
join departments d on e.department_id =d.department_id
group by department_name
order by salary desc limit 3;

select * from employees
where job_id like '%Clerk%';

select count(employee_id) Clerical_emp, avg(salary) Average_salary from employees;

select d.department_name department_name  from employees e 
join departments d on e.department_id =d.department_id
where salary  between 7000 and 10000
group by department_name 
;