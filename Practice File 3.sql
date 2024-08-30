use stylecar_db;

select * from salesperson
where sp_city='LONDON';

select * from salesperson
where commission_rate=0;

select * from salesperson
order by commission_rate desc limit 3;


select * from salesperson  where commission_rate < (select avg(commission_rate) from salesperson);

select * from salesperson  where commission_rate < (select avg(commission_rate) from salesperson) 
having sp_city='London';

select * from salesperson  where sp_city in ('Florida','Barcelona','San Jose');

-- lowest rating
select * from customers
where customer_rating= (select min(customer_rating)  from customers);

-- highest rating
select c_city from customers
where customer_rating= (select max(customer_rating)  from customers)
;

select * from customers
order by customer_rating desc;

select f_name,l_name from customers where f_name like "J_n%" or l_name like "J_n%";

select avg(amount), max(amount) from orders;

select count(o_id) from orders_bkp;

select * from orders_bkp;

-- total and average sales amount by month
select monthname(orderdate),sum(amount), avg(amount) from orders
group by month(orderdate)
order by month(orderdate);
