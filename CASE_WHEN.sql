create database case_when;
use case_when;
drop table if exists table1;
create table table1(
ID varchar(133),
name varchar(133)
);

insert into table1 (id,name) 
values ('n1','AS'),
('n2','BR'),
('n3','GA'),
('n4','GJ'),
('n5','HR');
----------------------------------------------------------------
drop table if exists table2;
create table table2(
orderID varchar(133),
custid varchar(133),
sale integer
);

insert into table2 (orderid,custid,sale) 
values ('1','1','936'),
('2','2','698'),
('3','3','232'),
('4','4','672'),
('5','5','413');
-----------------------------------------------------------------

drop table if exists table3;
create table table3(
name varchar(133),
height integer
);

insert into table3 (name,height) 
values 
('n1','259'),
('n2','204'),
('n3','154'),
('n4','188'),
('n5','236');

SELECT 
    *,
    CASE
        WHEN name = 'AS' THEN 'ASSAM'
        WHEN name = 'BR' THEN 'Bihar'
        WHEN name = 'GA' THEN 'Goa'
        WHEN name = 'GJ' THEN 'Gujarat' 
        WHEN name = 'HR' THEN 'Haryana'
        ELSE "State not found"
    END as FULL_NAME_STATE
    from table1;
    
SELECT 
    *,
    CASE
        WHEN sale > 500 THEN sale * 10 / 100
        ELSE 0
    END AS Discount
FROM
    table2;
    
SELECT 
    *,
    CASE
        WHEN height > 250 THEN 'Over 250'
        WHEN height BETWEEN 201 AND 250 THEN '201-250'
        WHEN height BETWEEN 176 AND 200 THEN '176-201'
        WHEN height < 176 THEN '175 or under'
    END AS bucket
FROM
    table3;
    
CREATE TABLE table4(orderid integer,stateid varchar(200),status varchar(200),amount integer); 

INSERT INTO table4(orderid,stateid,status,amount) 
VALUES
('1','s1','shipped','67050'),
('2','s2','delivered','68608'),
('3','s3','packed','62545'),
('4','s2','shipped','54033'),
('5','s1','delivered','39284'),
('6','s2','shipped','80372'),
('7','s2','delivered','66399'),
('8','s3','packed','48914'),
('9','s1','packed','95459'),
('10','s1','delivered','70493'),
('11','s2','delivered','58017'),
('12','s3','packed','80360'),
('13','s1','delivered','90328'),
('14','s3','shipped','32283'),
('15','s2','packed','62551'),
('16','s3','packed','18273'),
('17','s2','shipped','46131'),
('18','s1','packed','18713');
select orderid,stateid,status,sum(amount) "Grand Total"  from table4
group by stateid,status;

select stateid,
count(case when status='shipped' then orderid end) as shipped_orders,
count(case when status='delivered' then orderid end) as delivered_orders,
count(case when status='packed' then orderid end) as packed_orders
from table4
group by stateid;

select stateid,
sum(case when status='shipped' then amount end) as shipped_orders,
sum(case when status='delivered' then amount end) as delivered_orders,
sum(case when status='packed' then amount end) as packed_orders
from table4
group by stateid;

drop table if exists table6;
create table table6(
id varchar(133),
name varchar(133));

-- swapping consecutive id's
insert into table6 (id,name) 
values ('1','n1'),
('2','n2'),
('3','n3'),
('4','n4'),
('5','n5');

create table table7(
id varchar(133),
name varchar(133));


insert into table7 (id,name) 
values ('1','n1'),
('2','n2'),
('3','n3'),
('4','n4'),
('5','n5');
-- swapping consecutive id's
SELECT 
    t6.id,
    -- t6.name,
--     (CASE
--         WHEN t7.id THEN t7.id
--         WHEN t7.id IS NULL THEN t6.id
--     END),
    (CASE
        WHEN t7.name IS NULL THEN t6.name
        ELSE t7.name
    END) st_name
FROM
    table6 t6
        LEFT JOIN
    table7 t7 ON (CASE
        WHEN t6.id % 2 = 0 THEN t6.id - 1
        WHEN t6.id % 2 = 1 THEN t6.id + 1
    END) = t7.id;
    
    /*-----------------------------------------------------------------------------------*/
    
CREATE TABLE table1a(name varchar(200),amount integer); 

INSERT INTO table1a(name,amount) 
VALUES
('n1','5713'),
('n2','8275'),
('n1-online','3316'),
('n2-online','3622');

drop table if exists table1b;
CREATE TABLE table1b(name varchar(200),state varchar(200)); 

INSERT INTO table1b(name,state) 
VALUES
('n1','s1'),
('n2','s2');
select * from table1b;

SELECT 
    a.name, a.amount, b.state
FROM
    table1a a
        LEFT JOIN
    table1b b ON (CASE
        WHEN a.name LIKE '%n1%' THEN 'n1'
        WHEN a.name LIKE '%n2%' THEN 'n2'
    END) = b.name
;

-- facebook question asked 

drop table if exists facebook;
CREATE TABLE facebook( user_id_sender varchar(200),user_id_reciever varchar(200),date date,actions varchar(200)); 

INSERT INTO facebook(user_id_sender,user_id_reciever,date,actions) 
VALUES
('AN51BN20','BN20NT50',str_to_date('01-04-2023','%m-%d-%Y'),'sent'),
('AN51BN20','BN20NT50',str_to_date('01-06-2023','%m-%d-%Y'),'accepted'),
('SR35GJ60','GJ60WX16',str_to_date('01-04-2023','%m-%d-%Y'),'sent'),
('SR35GJ60','GJ60WX16',str_to_date('01-15-2023','%m-%d-%Y'),'accepted'),
('ZI97OJ70','OJ70YH66',str_to_date('01-06-2023','%m-%d-%Y'),'sent'),
('MR88TU48','TU48BK74',str_to_date('01-06-2023','%m-%d-%Y'),'sent'),
('MR88TU48','TU48BK74',str_to_date('01-10-2023','%m-%d-%Y'),'accepted'),
('RP41CQ98','CQ98FD79',str_to_date('01-04-2023','%m-%d-%Y'),'sent'),
('RP41CQ98','CQ98FD79',str_to_date('01-10-2023','%m-%d-%Y'),'accepted'),
('YG48OS65','OS65MC53',str_to_date('01-04-2023','%m-%d-%Y'),'sent');
-- rate of acceptance of request question
SELECT 
    a.date,
 --    COUNT(a.actions) sent,
--     COUNT(b.actions) accepted,
    CONCAT(ROUND((COUNT(b.actions) / COUNT(a.actions) * 100),
                    2),
            ' ',
            '%') rate_of_acceptance
FROM
    ((SELECT 
        *
    FROM
        facebook
    WHERE
        actions = 'sent') a
    LEFT JOIN (SELECT 
        *
    FROM
        facebook
    WHERE
        actions = 'accepted') b ON a.user_id_sender = b.user_id_sender)
GROUP BY a.date;
