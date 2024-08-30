-- MySQL Stored Procedure
/* It is collection of pre-compiled SQL statement stored in Database*/
use hr;
call get_emp_info;
desc employees;

-- Stored Procedure Parameters- IN/OUT/INOUT
call geet_emp_infoo('IT_PROG');

call emp_out(@records);
call emp_inout(@records,'IT_PROG');
select @records;
-- diff b/w dbms and rdbms
-- what constraints in sql and what are different type of constraint in sql
-- difference between primary key and foreign key
-- difference b/w delete /drop /truncate command explain with the help of example
-- what are the different ddl and dml queries
-- what is join in sql and what are the diffeerent types of join in sql
-- what do you understand by pattern matching and what are   different ways of pattern matching
-- what do you understand by sql or nosql .is it possible to replace sql with nosql.
-- what is trigger and with its applications along with advantages and disadvantages.
-- what is stored procedure in sql, does it reduce the running time of sql queries
-- what is normalisation in database,what are the different normalisaton forms
-- difference b/w groupby and orderby
-- how to insert a image in database,what is datatype of it if we store
-- what is difference b/w char and varchar tool
-- what is subquery and what are the different types of sub queries available in sql
