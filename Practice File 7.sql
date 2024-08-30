use hr;

select e.employee_id,e.first_name,e.last_name ,(select department_name from departments d  where e.department_id=d.department_id) department_name
from employees e -- where -- exists  (select department_name from departments d  where e.department_id=d.department_id)
order by e.employee_id;

select e.employee_id,e.first_name,e.last_name, d.department_name 
from employees e join departments d on
e.department_id=d.department_id
order by e.employee_id;

select CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,e.salary from employees e
where salary > all (select avg(salary) from employees);


            
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,
    e.salary,
	d.department_name
FROM
    employees e join departments d on e.department_id = d.department_id
WHERE
    salary < ALL (SELECT 
            AVG(salary)
        FROM
            employees)
having d.department_name='Sales';


            
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,
    e.salary,
	d.department_name
FROM
    employees e join departments d on e.department_id = d.department_id
WHERE
    salary > all(SELECT 
				salary
				FROM
					employees where job_id='IT_Prog')
order by e.salary asc;

select * from employees
order by salary asc;


select * , dense_rank() over(partition by department_id )from(
select CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,e.department_id from employees e
where salary > all(select sum(salary)*.60 from employees group by department_id))a;

select CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,e.department_id from employees e
where e.salary > all(select sum(salary)*0.6 from employees e
group by e.department_id);

select first_name,last_name,salary ,e.department_id
from employees e join 
(select employee_id,round(0.6*sum(salary)) as Total 
from employees e 
-- join departments d on e.department_id=d.department_id
group by e.department_id) as AA
on e.employee_id=AA.employee_id
and e.salary>AA.Total;


SELECT 
    CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,
    e.department_id,
    e.salary
FROM
    employees e
        JOIN
    (SELECT 
        employee_id, SUM(salary) * 0.6 salary
    FROM
        employees e
    GROUP BY e.department_id) a ON e.employee_id = a.employee_id
WHERE
    e.salary > a.salary;

select CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,c.country_name,d.department_name,e.manager_id from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
where e.manager_id is not null
having c.country_name='United Kingdom';
