create database if not exists techmac_db_2;
use techmac_db_2;

drop table if exists techhvye_emp;
create table if not exists techhvye_emp(
			emp_id varchar(20),
            f_name varchar(70),
            l_name varchar(70),
            gender varchar(10),
            age int
);

create table if not exists techhcloud_emp(
			emp_id int,
            f_name varchar(70),
            l_name varchar(70),
            gender varchar(10),
            age int
);
create table if not exists techhsoft_emp(
			emp_id int,
            f_name varchar(70),
            l_name varchar(70),
            gender varchar(10),
            age int
);

alter table techhvye_emp add column proficiency_lvl int;
alter table techhcloud_emp add column proficiency_lvl int;
alter table techhsoft_emp add column proficiency_lvl int;
desc techhvye_emp;
alter table techhvye_emp modify column emp_id varchar(20) Primary key ,
						 modify column proficiency_lvl int check (proficiency_lvl between 0 and 6) default 1,
                         modify column age int check (age between 21 and 55);

alter table techhcloud_emp modify column emp_id varchar(20) Primary key,
						 modify column proficiency_lvl int check (proficiency_lvl>=1) default 1,
                         modify column age int check (age between 21 and 55);
                         
alter table techhsoft_emp modify column emp_id varchar(20) Primary key ,
						 modify column proficiency_lvl int check (proficiency_lvl>=1) default 1,
                         modify column age int check (age between 21 and 55);

desc techhsoft_emp;
insert into techhvye_emp values
('TH0001','Eli','Evans','Male',26, 1),
('TH0002','Carlos','Simmons','Male',32, 2),
('TH0003','Kathie','Bryant','Female',25, 1),
('TH0004','Joey','Hughes','Male',41, 4),
('TH0005','Alice','Matthews','Female',52, 4);

truncate table techhsoft_emp;
insert into techhsoft_emp values
('TS0001','Peter','Burtler','Male',44, 4),
('TS0002','Harold','Simmons','Male',54, 4),
('TS0003','Juliana','Sanders','Female',36, 2),
('TS0004','Paul','Ward','Male',29, 2),
('TS0005','Nicole','Bryant','Female',30, 2);



insert into techhcloud_emp values
('TC0001','Teresa','Bryant','Female',39, 2),
('TC0002','Alexis','Patterson','Male',48, 5),
('TC0003','Rose','Bell','Female',42, 3),
('TC0004','Gemma','Watkins','Female',44, 3),
('TC0005','Kingston','Martinez','Male',29, 2);


-- Cloning 3 tables
create table if not exists techhvye_emp_bkp like techhvye_emp;
insert into techhvye_emp_bkp select * from techhvye_emp;

create table if not exists techhsoft_emp_bkp like techhsoft_emp;
insert into techhsoft_emp_bkp select * from techhsoft_emp;

create table if not exists techhcloud_emp_bkp like techhcloud_emp;
insert into techhcloud_emp_bkp select * from techhcloud_emp;

select * from techhcloud_emp_bkp;
select * from techhvye_emp;

delete  from techhvye_emp  where  emp_id in('TH0003','TH0005');
delete  from techhcloud_emp  where  emp_id in('TC0001','TC0004');

create table if not exists techhvyecloud_emp like techhvye_emp;
insert into techhvyecloud_emp select * from techhvye_emp;
insert into techhvyecloud_emp select * from techhcloud_emp;
select * from techhvyecloud_emp;