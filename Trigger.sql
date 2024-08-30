/*A Trigger is a named database object that associated with a table, and that activates
  when a particular event occurs for the table*/
/* A trigger  is defined to activate when the statement insert, update and delete 
rows in associated table.These row operations are known as triggers event*/
create database if not exists prep;
use prep;
drop table if exists account;
create table account
(acc_num int,amount decimal(10,2));
-- Creating Triggers
-- Syntax
/*create trigger trigger_name
(before | after)
[Insert | update |delete]
on [Table_name]
[for each rows | for each column]
[Trigger Body]*/
drop trigger if exists uns_sum;
create trigger uns_sum before insert on account
for each row set @sum=@sum +New.amount;

/*Create a insert query*/
set @sum=0;
insert into account values(100,40.5),(101,50.6),(123,-20.3);
select * from account;
-- to check trigger activated or not
select @sum  ;
show triggers in prep;
-- Example 2
drop table account_bkp;
create table account_bkp like account;
-- Creating a trigger
create trigger t1
before delete on account
for each row
insert into account_bkp values(old.acc_num,old.amount);
set sql_safe_updates=0;
delete  from account where acc_num=100;
select * from account;
select * from account_bkp;
-- Example 3
drop table student;
create table student 
(
Id int primary key,
f_name varchar(50),
l_name varchar(50),
marks int);
insert into student values(1,'Yash','Singh',50),
(2,'Sagar','Singh',55),(3,'Yogesh','Singh',65);
select * from student;
drop table final_marks;
create table final_marks(Id int,marks int);
select * from final_marks;
drop trigger t2;
create trigger t2
after insert on student
for each row
insert into final_marks values(new.Id,new.marks);
insert into student values(4,'Raj','Singh',59);
select * from final_marks;
drop trigger t3;
create trigger t3
before insert on student
for each row
set new.marks=new.marks+10;
insert into student values(6,'Siva','S',60);
select * from student;
select * from final_marks;
-- Example 4 (if else application in trigger)
drop table stud_info;
create table stud_info
(Id int primary key, f_name varchar(50) not null,
l_name varchar(50) not null,
occup varchar(50) not null,marks decimal);
create trigger occu 
before insert on stud_info
for each row 
set new.occup= case when new.occup like 'Doctor' then 'Teacher'
else new.occup
end;
insert into stud_info values (1,'Yash','Singh','Doctor',75),
(2,'JaiRaj','Singh','Engg',60),(3,'Rudra','Singh','Lawyer',55);
select * from stud_info;

-- Example 5
create trigger n_age 
before insert on stud_info
for each row 
set new.marks= case when new.marks<0 then 0
else new.marks
end;
insert into stud_info values (4,'Sanchi','Singh','Doctor',-12),
(5,'Gauravi','Singh','Engg',80),(6,'Samrat','Singh','Lawyer',-1);
select * from stud_info;