use hr;

select l.city City,count(e.employee_id) Employee_id from departments d  join employees e
on d.department_id=e.department_id 
join locations l on l.location_id=d.location_id
group by l.city
order by Employee_id
desc limit 5 ;

select CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,c.country_name Country_Name
,l.city City,d.department_name Department_Name,
e.salary Salary
 from departments d  join employees e
on d.department_id=e.department_id 
join locations l on l.location_id=d.location_id
join countries c on c.country_id=l.country_id;

select l.city City,count(e.employee_id) Total_No_Employee
 from departments d  join employees e
on d.department_id=e.department_id 
join locations l on l.location_id=d.location_id
group by l.city
order by Total_No_Employee
desc limit 5 ;

select e.employee_id,CONCAT(e.first_name, ' ', e.last_name) FULL_NAME, timestampdiff(year, jb.start_date,curdate()) Total_year_cmp
from employees e join job_history jb on
e.employee_id=jb.employee_id
having Total_year_cmp>10;

select e.employee_id,CONCAT(e.first_name, ' ', e.last_name) FULL_NAME,e.manager_id,
CONCAT(m.first_name, ' ', m.last_name),
 timestampdiff(year, jb.start_date,curdate()) Total_year_cmp
from employees e join job_history jb on
e.employee_id=jb.employee_id
join employees m  
on m.employee_id=e.employee_id
having Total_year_cmp>10;


SELECT 
    distinct(e1.employee_id) AS EmployeeID,
    concat(e1.first_name,' ',e1.last_name) AS EmployeeName,
    e1.manager_id AS ManagerID,
    
    concat(e2.first_name,' ',e2.last_name) AS ManagerName,
    timestampdiff(year, jb.start_date,curdate()) Total_year_cmp
FROM 
    employees e1
JOIN 
    employees e2 
ON 
    e1.manager_id = e2.employee_id
join job_history jb on
e1.employee_id=jb.employee_id
having Total_year_cmp>10;


-- Manager Id and Name of Manager applying self join
SELECT 
    e1.employee_id AS EmployeeID,
    concat(e1.first_name,' ',e1.last_name) AS EmployeeName,
    e1.manager_id AS ManagerID,
    concat(e2.first_name,' ',e2.last_name) AS ManagerName
FROM 
    employees e1
JOIN 
    employees e2 on
    e1.manager_id = e2.employee_id;