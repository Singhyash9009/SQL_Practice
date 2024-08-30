create database CTE_COMMON_TABLE_EXPRESSION;
use CTE_COMMON_TABLE_EXPRESSION;

drop table if exists order_summary;
CREATE TABLE order_summary (
    order_id INT PRIMARY KEY,
    amount INT,
    quantity INT
);

insert into order_summary values
 (1,4922,8),
(2,7116,8),
(3,1206,4),
(4,2841,7),
(5,2522,2),
(6,5084,3),
(7,6680,4),
(8,8123,7),
(9,6015,2),
(10,4092,3),
(11,7224,2),
(12,7679,8),
(13,1303,2),
(14,5185,7),
(15,2139,8);


drop table if exists customer;
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50)
);

insert into customer values
(1,'Henry','Brown'),
(2,'James','Williams'),
(3,'Jack','Taylor');
select * from customer;

drop table if exists orders;
CREATE TABLE orders (
    order_id INT,
    FOREIGN KEY (order_id)
        REFERENCES order_summary (order_id),
    date DATE,
    cust_id INT,FOREIGN KEY (cust_id)
        REFERENCES customer (cust_id)
); 

INSERT INTO orders(order_id,date,cust_id) 
 VALUES 
 (1, '2020-08-05', 1),
 (2, '2020-08-04', 2),
 (3, '2020-08-03', 3),
 (4, '2020-08-04', 1),
 (5, '2020-08-05', 2),
 (6, '2021-08-05', 3),
 (7, '2021-08-04', 1),
 (8, '2021-08-03', 2),
 (9, '2021-08-04', 3),
 (10, '2021-08-05', 2),
 (11, '2022-08-05', 1),
 (12, '2022-08-04', 2),
 (13, '2022-08-03', 3),
 (14, '2022-08-04', 1),
 (15, '2022-08-05', 2);

select c.cust_id,concat(c.f_name," ",c.l_name) as "Full_Name", sum(os.amount*os.quantity) as "Total_Sales",Year(o.date) as yearr
from orders o join customer c on c.cust_id=o.cust_id
join order_summary os on os.order_id = o.order_id
group by yearr,Full_Name;

with cte_2020_sales as (select c.cust_id,concat(c.f_name," ",c.l_name) as "Full_Name", sum(os.amount*os.quantity) as "Total_Sales_2020",Year(o.date) as yearr
from orders o join customer c on c.cust_id=o.cust_id
join order_summary os on os.order_id = o.order_id
where Year(o.date)=2020
group by yearr,Full_Name),
cte_2021_sales as
(select c.cust_id,concat(c.f_name," ",c.l_name) as "Full_Name", sum(os.amount*os.quantity) as "Total_Sales_2021",Year(o.date)
from orders o join customer c on c.cust_id=o.cust_id
join order_summary os on os.order_id = o.order_id
where Year(o.date)=2021
group by Year(o.date),Full_Name),
cte_2022_sales as
(select c.cust_id,concat(c.f_name," ",c.l_name) as "Full_Name", sum(os.amount*os.quantity) as "Jack_Taylor",Year(o.date)
from orders o join customer c on c.cust_id=o.cust_id
join order_summary os on os.order_id = o.order_id
where Year(o.date)=2022
group by Year(o.date),Full_Name
)
SELECT 
    cte_2020_sales.cust_id,
    cte_2020_sales.Full_Name,
    cte_2020_sales.Total_Sales_2020,
    cte_2021_sales.Total_Sales_2021,
    cte_2022_sales.Jack_Taylor
FROM 
    cte_2020_sales
JOIN 
    cte_2021_sales ON cte_2020_sales.cust_id = cte_2021_sales.cust_id
JOIN 
    cte_2022_sales ON cte_2020_sales.cust_id = cte_2022_sales.cust_id;
    
select * from order_summary;
-- pivot function
select c.cust_id,concat(f_name," ",l_name) as Full_Name,
sum(case when c.cust_id=1 then os.quantity
    when c.cust_id=2 then os.quantity 
    when c.cust_id=3 then os.quantity end) as Cust_1  from 
orders o join customer c on c.cust_id=o.cust_id
join order_summary os on o.order_id=os.order_id
group by c.cust_id;

select c.cust_id,concat(f_name," ",l_name) as Full_Name,sum(os.quantity)  from 
orders o join customer c on c.cust_id=o.cust_id
join order_summary os on o.order_id=os.order_id
where c.cust_id=1
group by c.cust_id
;

select c.cust_id,concat(f_name," ",l_name) as Full_Name,sum(os.quantity)from 
orders o join customer c on c.cust_id=o.cust_id
join order_summary os on o.order_id=os.order_id
group by c.cust_id
;
 
select * from order_summary;
with cte as
(select c.cust_id,c.f_name,os.quantity from orders o join customer c on c.cust_id=o.cust_id
	join order_summary os on os.order_id=o.order_id
    union all
    select c.cust_id,c.f_name,os.quantity-1 from orders o join customer c on c.cust_id=o.cust_id
	join order_summary os on os.order_id=o.order_id where quantity>=2
    )
    select * from cte;
    
