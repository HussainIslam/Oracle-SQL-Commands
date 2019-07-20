--Selecting all columns
select *
from departments;

--Show table structure
desc[ribe] employees;

--Show details of all the tables
select *
from tabs;

--Specific columns
select department_id, location_id
from departments;

--Arithmatic Operations
select last_name, salary, salary + 300
from employees;

--Aliases (AS can be optional for names without any spaces)
select last_name name, commission_pct as "Commission Percent"
from employees;

--Concatanation Operator
select last_name || ' is a ' || job_id "Employee Details"
from employees;

--[Alternative]
select last_name || q'[ is a ]' || job_id as "Employee Details"
from employees;

--Display unique records
select distinct department_id
from departments;

--General format for where
select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

--Character string is enclosed by single quote are case sensitive
select last_name, job_id
from employees
where last_name = 'Whalen';

--Dates are single quote enclosed and formatted 'DD-MON-RR'
select last_name
from employees
where hire_date = '17-FEB-96';

--Comparison Operators and Conditions
	--	Equal to 				=
	--	Greater than			>
	--	Greater or equal 		>=
	--	Less than				<
	--	Less than equal 		<=
	--	Not equal 				<> or != or ^=
	--	Between two values		Between...and...
	--	Any of list of values	in(set)
	--	Match character pattern	like
	-- 	Is a null values 		is null
--Between
select last_name, salary
from employees
where salary between 2500 and 3500;

--Range of character values
select last_name
from employees
where last_name between 'King' and 'Smith'

--Set of values
select employee_id, last_name
from employees
where manager_id in(100,101,201);

--Set of character of string
select last_name, hire_date
from employees
where last_name in('King','Whalen');

--Wildcard Character (zero or more)
select first_name
from employees
where first_name like '%S';

--Wildcard Character (one character)
select last_name
from employees
where last_name like '_o%';

--Search for % or _
select last_name
from employees
where job_id like '%SA\_'
escape '\';
'
--Using null condition
select last_name, manager_id
from employees
where manager_id is null;

--Logical Operators
	--	Return true if both condition are true		and
	--	Return true if either condition are true	or
	--	Return true if condition is false			not

--Logical Operator (and/or)
select last_name, job_id, salary
from employees
where (job_id = 'SA_REP'
or 	job_id = 'AD_PRES')
and salary > 15000;

--Sorting (ascending by default; always the last statement)
select last_name, job_id, department_id
from employees
order by hire_date;

--Sorting (descending, multiple, alias)
select employee_id, last_name, salary*12 Annual
from employees
order Annual desc, employee_id asc;

--Sorting by column number
select last_name, job_id, department_id, hire_date
from employees
order by 3;

--Getting user input
select last_name Last, department_id departments
from employees
where department_id = &deptno;

--Multiple user input
select last_name Last, department_id departments
from employees
where department_id in (&deptno1, &deptno2);

--User input for character string
select last_name, department_id, salary*12
from employees
where job_id = '&job_title';

--User input column name, expressions, text
select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;

--Substitution variable (double ampersand)
select employee_id, last_name, job_id, &&column_name
from employees
order by &column_name;

--Create a variable and destroy
define employee_num = 200
select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num;
undefine employee_num

--Verify the data
set verify on
select employee_id, last_name, salary
from employees
where employee_id = &employee_num;

--Lower function
select lower(first_name)
from employees;

--Upper Function
select upper(first_name)
from employees;

--Initial Case
select initcap(first_name)
from employees;

--Case-manipulation functions in condition
select employee_id, last_name, department_id
from employees
where lower(last_name) = lower('higgins');

--Case manipulation and user input
select employee_id, last_name
from employees
where lower(last_name) = lower('&last');

--Character-manipulation functions
	--	Concatanation			concat('string1','string2')
	--	substring				substr('string',start,end)
	--	length of string 		length(string)
	--	in string 				instr('string','w')
	--	left padding			lpad(field,widthofpadding,'*')
	--	right padding 			rpad(field,widthpadding,'*')
	-- 	replace					replace('string','what','withwhat')
	--	trim					trim('what' from 'source')

--Concatanation
select concat(last_name, first_name)
from employees;

--Substring
select last_name, substr(last_name,-1,1) --the -1 indicates last
from employees;

--length of string
select last_name, length(last_name)
from employees;

--Search of a piece of string return position
select instr(last_name, lower('A'))
from employees;

--Insert padding on left
select lpad(last_name,20,'-')
from employees;

--Insert padding on right
select rpad(last_name,20,'-')
from employees;

--Replace some text
select replace(last_name,'a', '?')
from employees;

--Trim a substring from a string
select trim('H' from last_name)
from employees;

--Number Functions
	--	Rounding			round(number,precision)
	--	Truncate			trunc(number,precision)
	--	Modulous			mod(dividend, divisor)

--Rounding
select salary, round(salary,-3)
from employees;

--Truncate (chops off the extra)
select salary, trunc(salary,0)
from employees;

--Modulous Division
select salary, mod(salary,5000)
from employees
where job_id = 'SA_REP';

--Showing current date
select sysdate
from dual;

--Date subtraction
select last_name,trunc((sysdate-hire_date)/7,2) "Weeks employed"
from employees

--Date Addition
select sysdate+1 Tomorrow
from DUAL;

--Date Functions
		--	Months between two Dates 			months_between
		-- 	Adds months to a date 				add_months
		--	Day after a date 					next_day
		-- 	Day before a date 					last_day
		--	Rounding a date 					round
		--	Truncate a date 					trunc

--Months beteen two dates
select months_between(sysdate,hire_date)
from employees;

--Adds months to a date
select hire_date,add_months(hire_date,3)
from employees;

--Day after a date
select next_day(sysdate)
from DUAL;

--Day before a date
select last_day(sysdate)
from dual;

--Rounding date
select hire_date,round(hire_date,'MONTH')
from employees;

--Truncate date
select hire_date, trunc(hire_date,'YEAR')
from employees;

--Wildcard with date
select employee_id,hire_date
from employees
where hire_date like '%97'

--Convert date to character
select to_char(hire_date,'YYYY-Month--DD')
from employees

--Date Format
		--	Full year 				YYYY
		-- 	Year spelled out 		YEAR, SYEAR
		-- 	2-digit value for month MM
		--	Full name of month 		MONTH
		-- 	3-letter of month 		MON
		-- 	3-letter of day 		DY
		-- 	Full name of day 		DAY
		--	Numeric day of month 	DD
		-- 	Quarter of year 		Q
		-- 	Week of year/month 		WW,W
		-- 	Century 				SCC, CC
--Number suffixes spell out
select to_char(hire_date, 'ddspth')
from employees;

--Spell out the dates
select last_name, to_char(hire_date,'fmddspth "of" Month year fmHH:MI')
from employees;

--Format number with to_char
		--	Represents a number 	9
		-- 	Force 0 to be displayed	0
		--	Floating dollar sign 	$
		--	Local currency			L
		-- 	Print decimal 			.
		-- 	Thousand seperator 		,
--Format numbers
select last_name, to_char(salary,'$99,999.00') as Salary 
from employees;

--Convert string to number
SELECT	to_number('1234')-2
from dual;

--Convert string to date
select last_name,to_char(hire_date,'DD-MON-YYYY')
from employees
where hire_date < to_date('01-Jan-90','DD-MON-YY');

--Nested Functions
select last_name,upper(concat(substr(last_name,1,4),'_US')) Email
from employees
where department_id = 60;

--Handling NULLs
		-- NVL(expr1,expr2)					Converts null to value
		-- NVL2(expr1,expr2,expr3)			if expr1 is not null then expr2, otherwise expr3
		-- NULLIF(expr1, expr2)				returns null if expr1 == expr2, return expr1 otherwise
		-- COALESCE(expr1,expr2,...exprn) 	returns first non-null expr in list
--NVL
select last_name,salary,salary*nvl(commission_pct,0)
from employees;

--Case Statements
select last_name,job_id,salary,
	case job_id when 	'IT_PROG' 	then	1.10 * salary
				when 	'ST_CLERK'	then 	1.15 * salary
				when 	'SA_REP'	then 	1.20 * salary
	else 	salary 
	end "Revised_Salary"
from employee;

--Group Functions
		--	Average				AVG 		[distinct|all]Expre
		-- 	Count				COUNT 		*[distinct|all]
		--	Maximum				MAX 		[distinct|all]Expre
		--	Minimum				MIN 		[distinct|all]Expre
		--	Standard Deviation	STDDEV 		[distinct|all]
		-- 	Summation			SUM 		[distinct|all]
		--	Variance			Variance	[distinct|all]
--Group Functions
select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like '%REP%';

--Min and Max for date(Min: oldest, Max: newest)
select min(hire_date), max(hire_date)
from employees;

--Min and max for string
select 	min(last_name) as "First in line",
		max(last_name) as "Always last to be called"
from employees;

--Counting number of rows
select count(*)
from employees;

--Use count with an expression
select count(commission_pct)
from employees
where department_id = 80;

--Use count for rows meeting condition
select count(last_name)
from employees
where last_name between 'A' and 'G'

--Count distinct
select count(distinct department_id)
from employees;

--Group function NVL
select AVG(NVL(commission_pct,0))
from employees;

--Group by
select department_id,avg(salary)
from employees
group by department_id;

--Group by more than one column
select department_id,job_id,sum(salary)
from employees
group by department_id, job_id;

--Condition on group by
select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

--Types of join:
	--Equijoin/sample join/inner join: data that is common betwen two
	--Outer join: All data from both table
	--Left join: all data from left side but only common from right
	--Right join: all data from right side but only common from left
--Joining two tables
select c.pname, o.amount as "Sales per Customer"
from customer c, orders o
where c.pid = o.pid;

--Joins with Join...on clause
select e.employee_id, e.last_name, d.location_id
from emplyees e 
join departments d
on (e.department_id = d.department_id);

--Three-way joins (join on)
select e.employee_id, d.department_name
from employee e 
join departments d 
	on d.department_id = e.department_id
join locations l
	on d.location_id = l.location_id;

--Three-way joins (where/equijoin)
select employee_id, city, department_name
from employees e, departments d
where d.department_id = e.department_id
and d.location_id = l.location_id;

--Self join
select e.last_name emp, m.last_name mgr
from employees e
join employees m
on (e.manager_id = m.employee_id)
where e.last_name like 'Lorentz';

--Self join with conditions
select e.employee_id, e.last_name, e.department_id, d.location_id
from employees e
join departments d
and e.manager_id = 149

--Self join with conditions (alternative)
select e.employee_id, e.last_name, e.department_id, d.location_id
from employees e
join departments d 
on (e.department_id = d.department_id)
where e.manager_id = 149;

--Explicitly define inner joins
select employee_id, last_name, department_name
from employees
inner join departments
on (employees.department_id = departments.department_id);

--Implicitly define inner joins (equijoin)
select employee_id,last_name,department_name
from employees,departments
where employees.department_id = departments.department_id;

--Group by with join
select pname,sum(amount) as TotalSales
from customers
join orders
on (customers.pid = orders.pid)
group by pname;

--Left outer join (displays all items from left table but only common from right)
select pname, sum(amount)
from customers
left join orders
on (custoemrs.pid = orders.pid)
group by pname;

--Right join(displays all items from right table but only common from left)
select pname, sum(amount)
from customers
right join orders
on (customers.pid = orders.pid)
group by pname;

--Full outer join (all data from both table)
select pname, sum(amount)
from customers
full outer join orders
on (customers.pid = orders.pid)
group by pname;

--Subqueries
select last_name
from employees
where salary > 
				(select salary
				from employees
				where last_name = 'Abel');
--Types of subqueries
	--single row subqueries
	--multiple row subqueries

--Multiple subqueries
select last_name,job_id,salary
from employees
where job_id = 
				(select job_id
				from employees
				where employee_id = 141)
and salary > 
				(select salary
				from employees
				where employee_id = 143);

--Group functions in subquery
select last_name, job_id,salary
from employees
where salary =
				(select min(salary)
				from  employees);

--Having with subqueries
select department_id,min(salary)
from employees
group by department_id
having min(salary) >
					(select min(salary)
					from employees
					where department_id = 50);

--Multiple row subqueries
select department_id,employee_id,last_name,salary
from employees
where salary in
				(select min(salary)
				from employees
				group by department_id);

--Multiple row comparison operators
		-- IN 		Equal to any of the value in list
		-- ANY 		less than/greater than any value in list
		-- ALL 		Less than/greater than all value in list

--Any operator
select employee_id, last_name, job_id, salary
from employees
where salary < any
					(select salary
					from employees
					where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

--All operator
select employee_id,last_name,job_id,salary
from employees
where salary < all
					(select salary
					from employees
					where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

--Exclusion subquery
select emp.last_name
from employees emp 
where emp.employee_id not in
							(select mgr.manager_id
							from employees mgr);

--Not null query
select last_name
from employees emp
where emp.employee_id in
						(select mgr.manager_id
						from employees mgr
						where manager_id is not null);

/*
Set Operators
--------------
Set Operators are used to combine two or more select statements. Valid set operations are:
    1. UNION: Returns the results of both queries however, duplicates are listed only once.
    2. UNION ALL: Returns the result of both queries without including the duplicates.
    3. INTERSECTION: Returns records that are returned by both queries.
    4. MINUS: Removes 2nd query's results from output, if they are found in the first query's results.
    5. EXISTS:
*/

/* Display all the employees from job_histor */
select *
from job_history;

/* Display employee_id, job_id, department_id from Employees table*/
select employee_id, job_id, department_id
from employees;

/*Result of the UNION of both tables using just employee_id and job_id*/
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history
order by job_id; /*added just for readability*/

/* Result of UNION ALL showing duplicate values twice*/
select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history
order by employee_id;

/* Results of querying including the department_id*/
select employee_id, job_id, department_id
from employees
UNION
select employee_id, job_id, department_id
from job_history
order by employee_id;

/* Query the common records (only duplicates) using INTERSECT*/
select employee_id, job_id, department_id
from employees
INTERSECT
select employee_id, job_id, department_id
from job_history
order by employee_id;

/* Query the common records using INTERSECT without deparment_id*/
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history
order by employee_id;

/* Query all data, include aliases, and order by*/
select employee_id as "Emp#", job_id as "Job Title"
from employees
union all
select employee_id, job_Id
from job_history
order by 1, 2;

/*  Query using differnet number of columns from each table
    This will result in error: "Query block has incorrect number of result collumns"*/

select employee_id as "Emp#", job_id as "Job Title", department_id
from employees
union all
select employee_id, job_id
from job_history
order by 1, 2;

/* Query using MINUS resulting in records that are unique to first query*/
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history
order by 1, 2;

/* Query a list of department_id, location_id, hire_date*/
select e.department_id, location_id, hire_date
from employees e, departments d
where e.department_id = d.department_id;

/*  Query using UNION where some columns don't exits 
    Need to pass 'null' with appropriate type of conversion */
select department_id, to_number (null) as location, hire_date
from employees
union
select department_id, location_id, to_date(null)
from departments
order by department_id;

/* Query all the employees, their job_id, and salary
    Problem is employees have several jobs, some in employees, and some in 
    job_history table. We need to UNION both. However, the job_history
    table doesn't have salary in it.  */
select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history

/*  INSERT statement syntax
    There are two ways of inserting new row in tabl:
        1. List all the values in the default order of the columns in the table
        2. List the columns in the insert table along with the values to be inserted
*/

/* inserting with all values in default order*/
insert into departments
values(100, 'Finance', 10, 5);

/* listing the columns with the respective values*/
insert into departments (department_id, department_name)
values(30, 'Purchasing');

/* inserting with NULL values explicitly */
insert into departments
values(101, 'Finance', NULL, NULL);

/* insert multiple values, need to include a SELECT */
insert all
into departments values(2, 'Finance', 20, 10)
into departments values(5, 'Purchaing', NULL, 10)
select 1
from dual;

/* insert special values: SYSDATE or USER */
insert into employees
    (employee_id, first_name, last_name,
    email, phone_number, hire_date,
    job_id, salary, commission_pct,
    manager_id, department_id)
values
    (113, 'Louis', 'Popp',
    'lpopp', '515.124.4567', SYSDATE,
    'AC_ACCOUNT', 6900, NULL,
    205, 110);

/* insert with specific date and time */
insert into employees
values 
    (113, 'Louis', 'Popp',
    'lpopp', '515.124.4567', to_date('Feb 3, 1999','MON DD, YYYY'),
    'AC_ACCOUNT', 6900, NULL,
    205, 110);
    
/* insert value by prompting the user */
insert into departments
    (department_id, department_name, location_id)
values
    (&departmetnt_id, '&department_name', &location_id);
    
/* insert by copying from another table 
        Things to remember:
            1. No values clause
            2. Number of columns must match
            3. Data types must match
*/
insert into sales_reps
    (id, name, salary, commission_pct)
select employee_id, last_name, salary, commission_pct
from employees
where job_id like '%REP%';

/* update values for one record */
update employees
set department_id = 50
where employee_id = 113;

/* update all rows */
update employees
set department_id = 100;

/* update two items */
update employees
set job_id = 'IT_PROG',
    commission_pct = NULL
where employee_id = 114;

/* update one record from information of another record - method 1*/
update employees
set job_id = 
        (select job_id
        from employees
        where employee_id = 205),
    salary =
        (select salary
        from employees
        where employee_id = 205)
where employee_id = 113;

/* update one record from information of another record - method 2*/
update employees
set (job_id, salary) = 
                        (select job_id, salary
                        from employees
                        where employee_id = 205)
where employee_id = 113;

/* updating rows based on another table */
update employees
set department_id = 
                    (select department_id
                    from employees
                    where employee_id = 100)
where job_id = 
                    (select job_id
                    from employees
                    where employee_id = 200);

/* remove specific row or rows */
delete from departments
where department_name = 'Finance';

/* removde all rows */
delete from employees; /* no where clause */

/* remove rows based on another table */
delete from employees
where department_id = 
                        (select department_id
                        from departments
                        where department_name like '%Public');
                        
/* remove all the rows from a table but leaves structure intact 
    Use the 'truncate' keyword; it is DDL statement and doesn't allow rollback
*/

TRUNCATE table employees;

/*
    Database Transaction Control
    ============================
    There are three key term in database transaction control:
        1. COMMIT: ends last transaction making all pending changes to be permanent
        2. SAVEPOINT name: marks a savepoint within current transaction
        3. ROLLBACK: discards all the uncommitted transations
        4. ROLLBACK TO SAVEPOINT name: discards all the changes upto the SAVEPOINT
    Remember: If two savepoint are created with same name, the preceding one is overwritten    
*/
update employees
set department_id = 50
where employee_id = 113; /* updates data of an employee */

savepoint update_done; /* creates a savepoint with name 'update_done' */

insert into departments
    (department_id, department_name, location_id)
values
    (&departmetnt_id, &department_name, &location_id); /* insert data of a department */

rollback to update_done;    /* rollsback to savepoint with name 'update_done' */

/*
    State of data
    =============
    1. Before a commit or rollback
            - Previous state of data can be recovered
            - Current state of data can be reveiewed with SELECT
            - Other uses cannot see the effect of DML changes (can see upto last commit)
            - Affected rows are locked (other users cannot change affected rows)
    2. After a commit
            - Data changes are saved
            - Previous state of data is overwritten
            - All users can view the results
            - Locks on affected rows are released
            - All savepoints are erased
    3. After a rollback
            - Data changes are undone
            - Previous state of the data is restored
            - Locks on affected rows are released
    4. Statement level rollback
            - if one statement fails, only that one is rolled back
            - Oracle server implements implicit savepoint
            - Other changes can be committed or rolled back
    5. Read Consistency (FOR UPDATE)
            - Ensures consistent view of data
            - Changes by one user do not conflict with other user
            - Ensure that:
                    - Readers (SELECT) do not wait for writers
                    - Writers (INSERT, UPDATE, DELETE) don't wait for readers
                    - Writers wait for writers
*/

/* commit the changes */
delete from departments
where department_id in (290, 300); /* deletes data from departments */

commit; /* commits the delete */

/* rollback the changes */
delete from departments
where department_id in (290, 300); /* deletes data from departments */

rollback; /* rollbacks the delete */

/* FOR UPDATE clause in SELECT statement*/
select employee_id, salary, commission_pct, job_id
from employees
where job_id = 'SA_REP'
for update      /* locks the rows where job_id is SA_REP */
order by employee_id;

/*
    FOR UPDATE:
        - Locks rows in concern
        - Lock released only when a ROLLBACK or COMMIT is issued
        - If the rows are already locked by another user SELECT waits for it to be available
        - NO WAIT can be issued to get the control back from system
*/

/* FOR UPDATE using multiple tables (whole row is locked) */
select e.employee_id, e.salary, e.commission_pct
from employees e
join department d
using (department_id)
where job_id = 'ST_CLERK'
and 'location_id' = 1500
for update      /* waits for any update of the data specified */
order by e.employee_id;

/* FOR UPDATE using multiple tables (only a column is locked) */
select e.employee_id, e.salary, e.commission_pct
from employees e
join department d
using (department_id)
where job_id = 'ST_CLERK'
and 'location_id' = 1500
for update of e.salary     /* waits for any update of the data specified */
order by e.employee_id;

/* FOR UPDATE wait for 5 seconds */
select employee_id, salary, commissin_pct, job_id
from employees
where job_id = 'SA_REP'
for update wait 5
order by employee_id;

/*
    Objects         Description
    -------         -----------
    Table           Basic storage unit, composed of rows and columns
    View            Logical representation of data, not physical
    Sequence        Object in Oracle used to generate number sequence
    Index           Speeds up the search
    Synonyms        Alaternative name to an object

    Object Naming Rules
    -------------------
    1. Begin with a letter
    2. 1-30 character long
    3. Contain only A-Z, a-z, 0-9, _ (underscore), $ (dollar), and # (hash)
    4. Not duplicate object name for the same user
    5. Not Oracle reserved word
*/

-- create table
create table dept(
    deptno      number(2),
    dname       varchar2(14),
    loc         varchar2(13),
    create_date date);

-- Confirm creation
describe dept;

-- Query what tables the user have
select table_name
from user_tables;

-- Default option for data insertion
create table hire_dates (
    id number(8),
    hire_date date default sysdate);
    
/*
    Data Types
    ---------------------------------------
    varchar2(size)      variable length character
    char(size)          fixed length character
    number(p,s)         variable length numeric
    date                date and time values
    long                variable length caracter data (upto 2gb)
    clob                character data (upto 4gb)
    raw/long raw        raw binary data
    blob                binary data (upto 4gb)
    bfile               binary data stored in external file
    rowid               Base-64 number system, representing unique address of a row in table

    DATETME data types
    ------------------
    timestamp           By default is in microsecond
    timestamp(0)        removes part seconds
    timestamp(9)        Nanoseconds
    interval to month
    interval to second
    
    Constrains
    ----------
    not null            cannot be null
    unique              no duplication of data
    primary key         unique identifier
    foreign key         establish referential integrity
    check               specifies a true condition
    
    Constraint definition
    ---------------------
    Constrain can be defined:
        - at the time of creating table
            - inline/column level
            - outline/table level
        - after creatin a table
*/

-- Table level constraint
create table employees(
    employee_id number(6),
    first_name varchar2(20),
    cosntraint emp_emp_id_pk
    primary key(employee_id);


-- Column level constraint
create table employees(
    employee_id number(6) primary key,
    first_name varchar2(20));

-- Composit primary key
create table studentCourse(
    student_id  number(9),
    course_id   char(6),
    grade       char(1),
    constraint  stud_crse_stud_id_crse_id_pk
                primary key(student_id, course_id));

-- Unique constraint
create table employees(
    employee_id     number(6),
    last_name       varchar2(25) not null,
    email           varcar2(25),
    salary          number(8,2),
    commission_pct  number(2,2),
    hire_date       date         not null,
    constraint      emp_email_uk 
    unique          (email));
    
-- Foreign key (table level)
create table employees(
    employee_id     number(6),
    last_name       varchar2(25) not null,
    email           varchar2(25),
    salary          number(8,2),
    commission_pct  number(2,2),
    hiredate        date        not null,
    department_id   number(4),
    constraint emp_dept_fk
    foreign key     (department_id)
    references      departments(department_id),
    constraint      emp_email_uk
    unique          (email));

-- foreign key (column level)
create table employees(
    employee_id     number(6),
    last_name       varchar2(25) not null,
    department_id   number(4)   constraint emp_deptid_fk
                    references  departments(department_id));

-- Using 'On delete cascade' with foreign key (Deletes 
-- the dependent rows in the child table when a row in 
-- the parent table is deleted)
create table employees(
    employee_id     number(6),
    last_name       varchar2(25)    not null,
    department_id   number(4)       constraint  emp_deptid_fk
                                    references  departments(department_id)
                                    on delete cascade);
                                    
-- Using 'on delete set null with foreigh key
-- (sets dependent foreign key values to null)
create table employees(
    employee_id     number(6),
    last_name       varchar2(25)    not null,
    department_id   number(4)       constraint  emp_deptid_fk
                                    references  departments(department_id)
                                    on delete set null);
                                    
-- Check constraints
create table employees (
    employee_id     number(6),
    salary          number(6)       constraint emp_sal_min
                                    check (salary > 0));

-- Contraints full example
create table employees (
    employee_id     number(6)       constaint emp_emp_id_pk         primary key,
    first_name      varchar2(25)    not null,
    last_name       varchar2(25)    constraint emp_last_name_nn     not null,
    email           varchar2(25)    constraint emp_email_nn         not null
                                    constraint emp_email_uk         unique,
    hire_date       date            constraint emp_hire_date_nn     not null,
    job_id          varchar2(10)    constraint emp_job_nn           not null,
    salary          number(8,2)     constraint emp_salary_ck        check(salary > 0),
    commission_pct  number(2,2),
    manager_id      number(6)       constraint emp_manager_fk       references employees(employee_id),
    department_id   number(4)       constraint emp_dept_fk          references departments(department_id));

-- creating table using subquery (have to use aliases for calculated fields
create table dept80
as  (
        select      employee_id, last_name, salary *12 ANNSAL, hire_date
        from        employees
        where       department_id = 80);

/* When to use Alter table statement
        - add a new column
        - modify an existing column definition
        - define a default value for the new column
        - drop a column
        - rename a column
        - change table to read-only
*/

-- Put a table on read-only status
alter table employees read only;

-- Enable for read and write
alter table employees read write;

-- Deleting/dropping a table (doesn't release space)
drop table employees;

-- Dropping a table (releases the space it occupied)
drop table employees purge;

-- Recovers a table from recycle bin

-- Alter table (add a column), if the table has values, will be filled with null or default
-- if the column is not null, then need to specify a default value
alter   table dept80
add     (job_id varchar2(9));

/*  Permissible actions for modifying a column:
        - Increase width or precision
        - Increase width of character
        - Decrease only if,
            - column has only NULL values
            - Table has no rows
            - Decrease is more than or equal the values in column
        - Change data type only if null
            - except for CHAR to VARCHAR
        - Change in default affects only late inserts    
*/

-- Alter table (modify a column)
alter   table dept80
modify  (last_name varchar2(30));

/*  Permissible actions for dropping a column:
        - After dropping the column, there has to be atleast 1 column left
        - Columns that are part of a constraint cannot be dropped
*/

-- Alter table (dropping a column)
alter   table dept80
drop column job_id;

-- Alter table (make a column unused)
alter table departments
set unused(phone);

-- ALter table (drop unused columns)
alter table departments
drop unused columns;

-- Alter table to modify a field to work as primary key
alter table emp2
modify employee_id Primary key;

-- Alter table to add a foreign key
alter   table emp2
add     constraint emp_mgr_fk
        foreign key(manager_id)
        references emp(employee_id);

-- Alter table to 'on delete cascade'
alter table     employees
add constraint  emp_dt_fk
foreign key     (department_id)
references      departments(department_id)
on delete cascade;

-- Alter table to 'on delete set null' (prevents cascading deletion)
alter table     employees
add constraint  empt_dt_fk
foreign key     (department_id)
references      departments(department_id)
on delete set null;

/*  Deferring Constraints
    ---------------------
    This is about deferring the checking of transactions until the end of a transaction.
    Constraints can have the following attributes:
        - deferrable or not deferrable
        - Initially
                - initially deferred: waits to check the contraint untill the transaction ends
                - initially immediate: checks the constraint at the end of the statement
*/

-- Deferring constraints on creation
alter table dept2
add constraint dept2_id_pk
primary key(department_id)
deferrable initially deferred;

-- Changing all constraints for a session
alter session
set constraints = immediate;

-- changing a specifi constraint attribute
set constraints dept2_id_pk immediate;

-- Set all constraints that can be deferred to that status
set constraints all deferred;

-- change status from deferred to immediate
set constraints all immediate;

-- Drop constrains
alter table emp2
drop constraint emp_mgr_fk;

-- Remove a PK and drop associated FK constraints (with cascade)
alter table dept2
drop primary key cascade;

-- Disabling constraints
alter table emp2
disable constraint emp_dt_fk;

-- Disable constraint and also dependent contraints
alter table emp2
disable constraint emp_dt_fk cascade;

-- Disable constraints on creation
create table divisions (
    divno       number(2)       constraint ck_divno
                                check(divno between 10 and 99) disable,
    divname     varchar2(9)     constraint ck_divname
                                check(divname = upper(divname)) disable);

-- Enable constraints
alter table emp2
enable constraint emp_dt_fk;

/*
    Views
    ==================
    Advantages of views:    
        - To restrict data access
        - To make complex queries eash
        - To improve data independence
        - To present different views of same data
        
    Difference between Simple and Complex views
    Feature                 Simple Views        Complex Views
    --------------------    -----------------   --------------------
    Number of tables        one                 one or more
    Contain functions       no                  yes
    Contain groups of data  no                  yes
    DML operation on view   Yes                 not always
    
    Syntax:
    create [or replace] [force | noforce] view view_name
    [(alias[, alias]...)]
    as subquery
        [with check option [constraint constraint_name]]
        [with read only [constraint constraint_name]];
*/

-- create a view
create view empvu80 as
    select employee_id, last_name, salary
    from employees
    where department_id = 80;
    
-- Descrive a view
describe empvu80;

-- create view with column aliases
create view salvu50 as
    select employee_id id_number, last_name name, salary*12 annsalary
    from employees
    where department_id = 50;
    
-- retrieving data from view
select *
from salvu50;

-- modify a view
create or replace view empvu80
    (id_number, name, sal, department_id)
    as 
        select employee_id, first_name || ' ' || last_name, salary, department_id
        from employees
        where department_id = 80;
        
-- create a complex view
create or replace view dept_sum_vu
    (name, minsal, maxsal, avgsal)
    as
        select      d.department_name,
                    min (e.salary),
                    max (e.salary),
                    avg (e.salary)
        from        employees e join departments d
        on          (e.department_id = d.department_id)
        group by    d.department_name;

/*
    Rules for performain DML on a view
         - Usually on simple views
         - Cannot remove a row if contains:
            - Group function
            - Group by clause
            - distinct keyword
            - pseudocolumn 'rownum' keyword
*/

-- create view with check option
create or replace view empvu20
as
    select *
    from employees
    where department_id = 20
    with check option constraint empvu20_ck;
    
-- Restrict all DML operation on a view
create or replace view empvu10
    (employee_number, employee_name, job_title)
as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;

-- Removing a view
drop view empvu80;

/*
    Sequence is a database object that creates integer values.
    We can create sequence to generate numbers.
    Sequence:
        - can automatically generate unique numbers
        - is a shareable object
        - can be used to create primary keys
        - replaces application code
        - speeds up efficiency of accessing sequence values
        
    General syntax:
        create sequence sequence_name
            [increment by n]                increment value
            [start with n]                  default 1
            [{maxvalue n | nomaxvalue}]     default nomax
            [{minvalue n | nominvalue}]     
            [{cycle | nocycle}]             allows recycling of numbers-reuse
            [{cache n | nocache}];          allows caching x values-faster
*/

-- create sequence for PK
create sequence dept_deptid_seq
    increment by 10
    start with 120
    maxvalue 9999
    nocache
    nocycle;
    
-- using 'nextval' as PK
insert into departments
        (department_id, department_name, location_id)
values  (dept_deptid_seq.nextval, 'Support', 2500);

-- display the current value of sequence
select dept_deptid_seq.currval
from dual;

/*
    Gaps in sequence can occur:
        - a rollback occurs
        - system crashes
        - a sequence is used in another table
*/

-- modifying a sequence
alter sequence dept_deptid_seq
    increment by 20
    maxvalue 999999
    nocache
    nocycle;

-- drop a sequence
drop sequence dept_deptid_seq;

-- create index on last_name
create index emp_last_name_idx
    on employees(last_name);
    
-- remove index
drop index emp_last_name_idx;

-- creating synonym
create synonym  d_sum
for             dept_sum_vu;

-- removing synonym
drop synonym d_sum;

-- create public synonym
create public synonym studlist
for registration.student;         --allows access to table 'student' owned by user 'registration'
					