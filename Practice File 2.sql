create database stylecar_db;
use stylecar_db;

create table if not exists salesperson(
					sp_id int primary key,
                    sp_name varchar(100) not null,
                    sp_city varchar(200) not null,
                    commission_rate int
);

create table if not exists customers(
					c_id int primary key,
                    f_name varchar(100) not null,
                    l_name varchar(100) not null,
                    c_city varchar(200) not null,
                    customer_rating int not null
);

create table if not exists orders(
					o_id int primary key,
                    amount int not null,
                    orderdate date not null,
                    sp_id int not null, foreign key (sp_id) references salesperson(sp_id),
                    c_id int not null, foreign key (c_id) references customers(c_id)
);

insert into salesperson values
(1001,'William','London',12),
(1002,'Liam','San Jose',13),
(1003,'Axelrod','New York',10),
(1004,'James','London',11),
(1005,'Fran','London',26),
(1007,'Oliver','Barcelona',15),
(1008,'John','London',0),
(1009,'Charles','Florida',0);

insert into customers values
(2001,'Hoffman','Anny','London',100),
(2002,'Giovanni','Jenny','Rome',200),
(2003,'Liu','Williams','San Jose',100),
(2004,'Grass','Harry','Berlin',300),
(2005,'Clemens','John','London',200),
(2006,'Cisneros','Fanny','San Jose',200),
(2007,'Pereira','Jonathan','Rome',300);

INSERT INTO orders VALUES
(3001, 123, STR_TO_DATE('2021-02-01', '%Y-%m-%d'), 1009, 2007),
(3002, 100, STR_TO_DATE('2021-07-30', '%Y-%m-%d'), 1001, 2007),
(3003, 187, STR_TO_DATE('2021-10-02', '%Y-%m-%d'), 1001, 2001),
(3005, 201, STR_TO_DATE('2021-10-09', '%Y-%m-%d'), 1003, 2003),
(3007, 167, STR_TO_DATE('2021-04-02', '%Y-%m-%d'), 1004, 2002),
(3008, 189, STR_TO_DATE('2021-03-06', '%Y-%m-%d'), 1002, 2002),
(3009, 145, STR_TO_DATE('2021-10-10', '%Y-%m-%d'), 1009, 2005),
(3010, 200, STR_TO_DATE('2021-02-23', '%Y-%m-%d'), 1007, 2007),
(3011, 100, STR_TO_DATE('2021-09-18', '%Y-%m-%d'), 1001, 2004);

select * from salesperson;

set SQL_SAFE_UPDATES=0;
-- commision_rate 15 where it is  between 0 & 13 %
update salesperson set commission_rate =15 where commission_rate between 0 and 13;

-- clone of orders table
create table if not exists orders_bkp like orders;
insert into orders_bkp select * from orders;

delete from orders where o_id in (3005,3008);

delete from orders_bkp where o_id in (3005,3008);

select c_id,count(c_id) from orders
group by c_id
having count(c_id)>2
;

update customers set customer_rating = customer_rating +50 where c_id=2007;
select * from customers;
