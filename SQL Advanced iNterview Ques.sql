create database if not exists SQL_interview_ques;
use SQL_interview_ques;

drop table if exists transactions;
CREATE TABLE transactions (
    transaction_id INT,
    user_id INT ,
    created_at DATE,
    updated_at DATE,
    status TEXT,
    amount INT
);


INSERT INTO transactions(transaction_id,user_id,created_at,updated_at,status,amount) 
 VALUES (1,1,str_to_date('04-19-2017','%m-%d-%Y'),str_to_date('04-21-2017','%m-%d-%Y'),'Fail',105),
(2,3,str_to_date('12-18-2019','%m-%d-%Y'),str_to_date('12-19-2019','%m-%d-%Y'),'Success',215),
(3,2,str_to_date('07-20-2020','%m-%d-%Y'),str_to_date('07-23-2020','%m-%d-%Y'),'Success',416),
(4,1,str_to_date('10-23-2019','%m-%d-%Y'),str_to_date('10-26-2019','%m-%d-%Y'),'Fail',410),
(5,1,str_to_date('03-19-2018','%m-%d-%Y'),str_to_date('03-22-2018','%m-%d-%Y'),'Success',254),
(6,3,str_to_date('12-20-2016','%m-%d-%Y'),str_to_date('12-23-2016','%m-%d-%Y'),'Fail',227),
(7,1,str_to_date('11-09-2016','%m-%d-%Y'),str_to_date('11-11-2016','%m-%d-%Y'),'Success',351),
(8,1,str_to_date('05-20-2016','%m-%d-%Y'),str_to_date('05-23-2016','%m-%d-%Y'),'Success',110),
(9,2,str_to_date('09-24-2017','%m-%d-%Y'),str_to_date('09-27-2017','%m-%d-%Y'),'Success',135),
(10,1,str_to_date('03-11-2017','%m-%d-%Y'),str_to_date('03-14-2017','%m-%d-%Y'),'Fail',281),
(11,1,str_to_date('03-11-2016','%m-%d-%Y'),str_to_date('03-12-2016','%m-%d-%Y'),'Success',57),
(12,3,str_to_date('11-10-2016','%m-%d-%Y'),str_to_date('11-11-2016','%m-%d-%Y'),'Success',417),
(13,3,str_to_date('12-07-2017','%m-%d-%Y'),str_to_date('12-08-2017','%m-%d-%Y'),'Fail',385),
(14,3,str_to_date('12-15-2016','%m-%d-%Y'),str_to_date('12-16-2016','%m-%d-%Y'),'Success',329),
(15,2,str_to_date('11-08-2017','%m-%d-%Y'),str_to_date('11-10-2017','%m-%d-%Y'),'Fail',67),
(16,2,str_to_date('09-10-2018','%m-%d-%Y'),str_to_date('09-13-2018','%m-%d-%Y'),'Success',233);

drop table if exists customer;
CREATE TABLE customer (
    user_id INT,
    signup_date DATE
); 

INSERT INTO customer(user_id,signup_date) 
 VALUES 
(1,str_to_date('09-22-2009','%m-%d-%Y')),
(2,str_to_date('09-10-2011','%m-%d-%Y')),
(3,str_to_date('04-21-2015','%m-%d-%Y'));

select * from transactions;

select * from transactions t join customer c on
t.user_id=c.user_id
order by c.signup_date desc ;

select * from transactions where user_id in (
select user_id from customer where signup_date in (
select max(signup_date) from customer));


select * from(
select *,row_number() over(partition by user_id order by amount desc) rnk  from(
select * from transactions)a)b where b.rnk=2 ;

select *, sum(amount) over(partition by user_id order by transaction_id)
from transactions;

-- without using window function
select a.transaction_id,a.user_id,a.updated_at,a.amount,sum(a.amt) cumulative_sum from
(select a.*,b.amount amt from transactions a join transactions b on
a.transaction_id>=b.transaction_id and a.user_id=b.user_id)a
group by a.transaction_id,a.user_id,a.updated_at,a.amount;

select * from transactions;
-- moving average
select *, avg(amount) over(order by created_at rows between 2 preceding and current row) as Moving_Average
from transactions;










select *, avg(amount) over(order by created_at rows between 2 preceding and current row) as MA
from transactions;