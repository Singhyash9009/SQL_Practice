
create view It_Department as
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,
    e.employee_id Employee_ID,
    d.department_name
FROM
    employees e join departments d on
    e.department_id=d.department_id
    where d.department_name = "IT";
    
select * from It_department;

select *, min(salary) over(partition by department_id order by job_id) Min_Salary,max(salary) over(partition by department_id order by job_id) Max_Salary from 
(select e.first_name, e.department_id,e.job_id, e.salary salary from employees e join jobs j on e.job_id= j.job_id)a;

select e.first_name, e.job_id,e.salary, j.min_salary,j.max_salary from employees e join jobs j on e.job_id= j.job_id;

select l.city City,count(e.employee_id) Employee_Count  from departments d join employees e   on
e.department_id=d.department_id join
locations l on l.location_id=d.location_id
group by l.city
order by Employee_Count desc limit 10;

select e.employee_id, CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,jb.end_date from employees e
join job_history jb on e.employee_id=jb.employee_id
where end_date='1999-12-31';

SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,
    d.department_name Department_Name,
    timestampdiff(Year,jb.start_date,curdate())
FROM
    employees e
        JOIN
    job_history jb ON e.employee_id = jb.employee_id
        JOIN
    departments d ON e.department_id = d.department_id
    where timestampdiff(Year,jb.start_date,curdate())>=25
;
