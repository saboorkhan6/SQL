create  database mydb2
use mydb2


--This is single line comment

/*
this is 
multiline
coment
*/



--Data type is a cconcept which tell us what type of data a particular variable store
/*
--int :- stores numerical value
char (30) :- stores textual data
varchar(30) :- stores textual data

Datetime 
float
*/

/*
DDL
DML
DCL
DQL
*/

/*
DDL --Data defination Language
gets something in existance

Create 
Alter
drop

*/



--use mydb1
--drop database mydb2

create table employee
(
id int,
Name varchar(20),
Address varchar(30)
)


select * from employee
 

alter table employee
add roll_no int

alter table employee 
drop column Address

truncate table employee


/*
DML : data manupilation language
works on existing data

1. insert : to insert data in table (add)
2. select : to retrive data in table
3.update  : to modify the exististing data
4. data : deletes individual row in table 
*/

insert employee(id,Name,roll_no)
values (1,'saboor',10),
(2,'aayat',11)


/*
clause : to filter out data,group or organise

1.select
2.from
3.where
4.having
5.group by
6.ordre by
7.distinct
8.top

*/

 update employee
 set name = 'abc'
 where id=1

 delete employee
 where id=1

 use mydb2  --to access database
 
 select * from employee

 alter table employee
 add age int

 alter table employee
 add salary int

 delete employee
 where id=2
 
 
 insert into employee (id,Name ,roll_no,salary)
 values(1,'Saboor',101,1000),
 (2,'Aayat',102,1),
 (3,'Sarmad',103,100000),
 (4,'Abc',104,1000111)

select * from employee 
 order by salary          --default is in ascending order

 
select * from employee
 order by salary desc      --descending


 --top

 select top 1 * from employee

 select top 1 * from employee
 order by salary desc


 /*
 Constraints : rules that are applied to particular table
 1. Primary key --- uniquely idenfies each row
2. not null -- null are not allowed
3. Default --- pre defined
4. check ---apply condtion
5. unique -- duplicate value are not allowed
6. foreign key -- establish relationship between two tables

 */


 drop table employee


 create table employ
 (
 id int Primary key,
 Name varchar(30) not null,
 Email varchar(50) unique not null,
 Address varchar(100) default'Srinagar',
 Age int check(Age>=18),
 Salary int
 )

 select * from employ

  
 insert into employ(id,Name,Email,Address,Age,Salary)
 values(1,'abc','abc@','Ladakh',30,1155),
 (2,'saboor','s@','Ladakh',20,112),
 (3,'aayat','a@','srinagar',21,113),
 (4,'sarmad','sar@','Ladakh',19,1155)



 --checking the constriants: 

 insert into employ(id,Email,Address,Age,Salary)
 values(1,'s@',20,111)                              --error as name should'nt be null

 insert into employ(id,Name,Email,Address,Age,Salary)
 values(2,'saboor','s@','Ladakh',20,112)            -- error - email needs to be unique and not null 
 
 insert into employ(id,Name,Email,Age,Salary)
 values(3,'aayat','a@',21,113)  --if adress is missing ,default
 
 insert into employ(id,Name,Email,Address,Age,Salary)
 values(4,'sarmad','sar@','Ladakh',14,1155)             --error -condition is invalid as age is below 18

 drop table employ
 


 /*if new table is added e.g, department , then dept in employ is foriengn key and the same dept  is primary key in that new table*/

 drop table employ

 --Agrigate functions
 use mydb2

  create table employ
 (
 id int Primary key,
 Name varchar(30) not null,
 Email varchar(50) unique not null,
 Address varchar(100) default'Srinagar',
 Age int check(Age>=18),
 Salary int
 )
 INSERT INTO employ (id, Name, Email, Address, Age, Salary)
VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Srinagar', 25, 35000),
(2, 'Ayesha Khan', 'ayesha@gmail.com', 'Jammu', 28, 42000),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Delhi', 30, 50000),
(4, 'Zoya Ahmed', 'zoya@gmail.com', 'Mumbai', 24, 30000),
(5, 'Aditya Singh', 'aditya@gmail.com', 'Chandigarh', 32, 60000),
(6, 'Sara Mir', 'sara@gmail.com', 'Srinagar', 27, 45000),
(7, 'Kabir Gupta', 'kabir@gmail.com', 'Jammu', 29, 38000),
(8, 'Inaya Bhat', 'inaya@gmail.com', 'Anantnag', 26, 40000),
(9, 'Rohan Das', 'rohan@gmail.com', 'Kolkata', 35, 70000),
(10, 'Maira Ali', 'maira@gmail.com', 'Delhi', 23, 28000)

select * from employ

select max (salary) as hightest_salary from employ
select min (salary) as lowest_salary from employ
select avg (Age) from employ         --avg is for average/mean
select count(*) from employ          -- count is for quantity
select sum (salary) from employ

select * from employ
where Address = 'Srinagar' and salary < 20000

select * from employ
where Address = 'Srinagar' or salary < 20000

select * from employ
where salary between 40000 and 50000

--to do between manually

select * from employ
where salary > 40000 and salary <50000

--	WILDCARD SELECTOR
select * from employ
where name like '%s'   --end

select * from employ
where name like 'a%'  --start

select sum(salary) from employ
where Address = 'Srinagar'

select count(*) from employ
where Address = 'Delhi'


--group by : to group similar data
use mydb2
select * from employ

--group by :
select address,count(*) from employ
group by address                     --shows count of each region(address)

select count(*) from employ
where Address='srinagar'
group by address                     --shows count of srinagar


select address,count(*) as number_of_employ from employ
group by address
order by number_of_employ desc                           --address and count column and in descending order

select address,max(salary) from employ
group by address                                          --shows max salary of each region


select address,count(*) from employ   --shows count greater than 1 of each region
group by address
having count(*)>1


select address,avg(salary) from employ
group by address

select avg(salary) as avg_sal_sri from employ
where address='srinagar'

select address,avg(salary) from employ    --groups regions having avg salary more than 20000
group by address                         
having avg(salary)>20000                 --having


select address,sum(salary) from employ
group by address
having sum(salary)>70000

select avg(age) as avg_age_kolkata from employ
where address ='Kolkata'

select address,avg(age) from employ
group by address
having avg(age)>30


use mydb2

drop table employ


create table department
(
deptid int primary key,
deptname varchar(30),
deptlocation varchar(40)
)

create table employee
(
id int primary key,
name varchar(30),
age int,
salary int,
deptid int,
foreign key (deptid) references department (deptid)
)

select * from department

insert into department(deptid,deptname,deptlocation)
values(100,'HR','lal bazaar') ,(101,'cs','Lal chowk'),(102,'main office','Ny')

INSERT INTO employee (id, name, age, salary, deptid)
VALUES
(1, 'Aamir', 25, 25000, 100),
(2, 'Zoya', 28, 32000, 101),
(3, 'Rahul', 30, 40000, 102),
(4, 'Sana', 24, 22000, 100),
(5, 'Adil', 35, 50000, 101),
(6, 'Priya', 27, 30000, 102),
(7, 'Arif', 29, 35000, 100),
(8, 'Neha', 32, 45000, 101),
(9, 'Bilal', 26, 28000, 102),
(10, 'Ayesha', 31, 42000, 100),
(11, 'Rohan', 23, 20000, 101),
(12, 'Irfan', 34, 48000, 102),
(13, 'Mehak', 28, 33000, 100),
(14, 'Karan', 36, 55000, 101),
(15, 'Sahil', 25, 27000, 102),
(16, 'Anaya', 29, 38000, 100),
(17, 'Danish', 33, 46000, 101),
(18, 'Simran', 24, 24000, 102),
(19, 'Farhan', 30, 41000, 100),
(20, 'Riya', 27, 31000, 101);


select * from employee


/*
SUB-QUERIES : nested query (query within a query)
first inner query is solved then outer query ...and the result of inner query influnces the outer query
*/
--to get second greatest salary 

select max(salary) from employee
where salary<(select max(salary) from employee)

--here the inner query is solved i.e the brackets of second line which gives the first greatest salary and then the second greatest from outer query which is 1 less than the greatest


use mydb2
select * from employee
select  * from department


--department of rahul

select deptname from department
where deptid = 
(
select deptid from employee
where name = 'Rahul'

)


--highest salary in each department
select * from employee e
where salary=(

select max(salary) from employee
where deptid = e.deptid
)

select * from department

--employes which have dept location SXR

select * from employee
where deptid in
(
select deptid from department
where deptlocation = 'SXR'

)


--nested subquery -- to get third largest salary
select max(salary) as Thirdsal from employee
where salary <(select max(salary) from employee
where salary<(select max(salary) from employee )
)


/*
H/W : do 30 questions on subqueries . Each question should solve different problems 
*/
 use mydb2
 drop table employee
 drop table department
 
 CREATE TABLE department (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(30),
    deptlocation VARCHAR(40)
)

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    deptid INT,
    FOREIGN KEY (deptid) REFERENCES department(deptid)
)

INSERT INTO department (deptid, deptname, deptlocation)
VALUES
(100, 'HR', 'Lal Bazaar'),
(101, 'CS', 'Lal Chowk'),
(102, 'Finance', 'Srinagar'),
(103, 'Marketing', 'Lal Chowk'),
(104, 'IT', 'Srinagar'),
(105, 'Sales', 'Jammu')

 select * from department

 INSERT INTO employee (id, name, age, salary, deptid)
VALUES
(1, 'Ayesha', 22, 30000, 100),
(2, 'Rahul', 25, 45000, 101),
(3, 'Zara', 28, 60000, 102),
(4, 'Arjun', 24, 35000, 100),
(5, 'Sana', 32, 70000, 101),
(6, 'Adil', 29, 50000, 102),
(7, 'Mehak', 21, 28000, 103),
(8, 'Kabir', 35, 80000, 104),
(9, 'Hina', 26, 45000, 103),
(10, 'Irfan', 31, 55000, 104),
(11, 'Nida', 23, 40000, 105),
(12, 'Sameer', 27, 65000, 105),
(13, 'Farah', 30, 35000, 101),
(14, 'Danish', 20, 25000, 100),
(15, 'Rida', 34, 90000, 104)

select *  from employee

-- 1. Display the names of employees who earn more than the average salary of all employees.

select * from employee 
where salary >(select avg(salary) from employee) 

--2.Find the employee or employees who receive the highest salary

select * from employee
where salary=(select max(salary) from employee)

--3 Display employees who earn less than the minimum salary of employees in department 101
select * from employee
where salary=(
select min(salary) from employee
where deptid = 101
)

--4. Find employees whose salary is equal to the average salary of department 100
 select * from employee
 where salary=(
 select avg(salary) from employee
 where deptid=100)

 --5.Display the names of employees who work in the same department as employee named 'Ayesha'.
 select * from employee
 where deptid=
 (select deptid from employee
 where name= 'Ayesha')

--6. Display employees whose age is greater than the age of employee with ID 5
 
 select * from employee
 where age > 
 (select age from employee
 where id= 5)

--7. Find employees who earn more than the employee named 'Rahul'

select * from employee
where salary >
(select salary from employee
where name = 'Rahul')

--8.Display the department name of the employee whose ID is 3

select deptname from department
where deptid=(
select deptid from employee
where id=3)

--9. Display employees who earn exactly the lowest salary in the company

select * from employee
where salary =(
select min(salary) from employee)

--10. Find employees whose salary is greater than the average salary of employees aged below 25
 
select * from employee
where salary >
(select avg(salary) from employee
where age < 25)

--11.Display the names of employees who work in the department located in 'Lal Chowk
 select * from department


select * from employee
where deptid in
(
select deptid from department
where deptlocation = 'Lal Chowk')

--12.Display employees who work in departments located in 'Srinagar'.
 
 select * from employee
 where deptid in
 (select deptid from department
 where deptlocation='Srinagar')

 --13. Find employees who do not belong to department 100
 select * from employee
 where deptid !=
 (select deptid from department
 where deptid =100)

 --14  Display department names that have at least one employee
select * from department

select deptname from department
where exists (
select * from employee
where employee.deptid = department.deptid)

--15 Display departments that have no employees

select deptname from department
where not exists
(select * from employee
where employee.deptid= department.deptid)

--16 Find employees whose salary is greater than the salary of ANY employee in department 101

select * from employee
where salary > 
(select max(salary) from employee
where deptid=101)

--17 Find employees whose salary is greater than the salary of EVERY employee in department 101
 
 select * from employee
 where salary>
 (select sum(salary) from employee
 where deptid =101)

 --18 Display employees who earn the same salary as at least one employee in department 100
 
 select * from employee
 where salary in 
 (select salary from employee
 where deptid=100)

 --19 Find employees who earn more than at least one employee in department 102 but less than every employee in department 100
 select * from employee
 where salary > any
( select salary from employee
 where deptid=102)
 and salary < all
( select sum(salary) from employee 
 where deptid= 100) 
 
 --20 Display employees who work in a department whose location matches the location of department 100.
 select * from employee
 where deptid in
 (select deptid from department
 where deptlocation= 
 (select deptlocation from department
 where deptid=100))

 select * from employee

 --21 Find the highest-paid employee in each department
 select * from employee e1
 where salary=(
 select max(salary) from employee e2
 where e2.deptid = e1.deptid)

 --22 Display employees who earn more than the average salary of their own department
 -- ??
 select * from employee e1
 where salary >
  (select avg(e2.salary) from employee e2
  where e2.deptid = e1.deptid)

 --23  Find the second-highest distinct salary in the company.

select * from employee
where salary =(
select max(salary) from employee
where salary < (
select max(salary) from employee))

--24 Display the employee or employees who have the third-highest distinct salary.

select * from employee
where salary = (select max(salary) from employee
where salary <(select max(salary) from employee
where salary < (select max(salary) from employee)))

use mydb2
select * from employee
select * from department

--Join
select e.name ,d.deptname from employee e join department d
on e.deptid=d.deptid


 INSERT INTO employee (id, name, age, salary,deptid)
 values (16,'Saboor',20,1234,Null)

--left join
select e.name ,d.deptname from employee e left join department d
on e.deptid=d.deptid


INSERT INTO department (deptid, deptname, deptlocation)
values(106,'Management','delhi')

--right join
select e.name ,d.deptname from employee e right join department d
on e.deptid=d.deptid


--full join
select e.name ,d.deptname from employee e full join department d
on e.deptid=d.deptid


use mydb2
drop table employee
drop table department


CREATE TABLE department (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(30),
    deptlocation VARCHAR(40)
)

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    deptid INT,
    managerid INT,
    FOREIGN KEY (deptid) REFERENCES department(deptid)
)

INSERT INTO department (deptid, deptname, deptlocation)
VALUES
(100, 'HR', 'Lal Bazaar'),
(101, 'IT', 'Lal Chowk'),
(102, 'Finance', 'Hazratbal'),
(103, 'Marketing', 'Srinagar'),
(104, 'Sales', 'Bemina')

INSERT INTO employee (id, name, age, salary, deptid, managerid)
VALUES
(1, 'Aisha', 25, 50000, 101, 3),
(2, 'Rahul', 28, 35000, 100, 3),
(3, 'Zoya', 35, 70000, 101, NULL),
(4, 'Amir', 30, 45000, 102, 3),
(5, 'Sara', 32, 60000, 100, NULL),
(6, 'Imran', 24, 30000, 101, 1),
(7, 'Arjun', 27, 40000, 102, 3),
(8, 'Mehak', 29, 55000, 101, 3),
(9, 'Danish', 31, 25000, 100, 2)

select * from department
select * from employee

--Q1. Employees earning above the company average
--Display the employee name, salary, and department name of employees whose salary is greater than the average salary of all employees.

select e.name, e.salary,d.deptname from employee e join department d
on e.deptid=d.deptid
where salary>(
select avg(salary) from employee
)

-- Q2. Highest-paid employee in each department
--Display the employee name, salary, and department name of employees who earn the highest salary in their respective departments.

select e.name ,e.salary,d.deptname from employee e join department d
on e.deptid=d.deptid
where salary =
(
select max(salary) from employee e1
where e1.deptid=e.deptid
)

--Q3. Employees earning more than their managers
--Display the employee name, employee salary, manager name, manager salary, and department name for employees whose salary is greater than their manager's salary.
Select
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary,
    d.deptname
from employee e join  employee m
on e.managerid=m.id
join department d
on e.deptid=d.deptid
where e.salary >(
select salary from employee
where id=e.managerid)

--Q4. Departments without employees
--Display the department name and location of departments that have no employees

select d.deptname,d.deptlocation,e.name from department d left join employee e
on e.deptid=d.deptid

where not exists (
    select deptid from employee e1
    where e1.deptid= d.deptid
)

--Q5. Employees earning above their department's average
--Display the employee name, salary, and department name of employees whose salary is greater than the average salary of their own department

select e.name,e.salary,d.deptname from employee e join department d
on e.deptid=d.deptid
where salary >(
select avg(salary) from employee e1
where e1.deptid=e.deptid)

--Q.6 — Second-highest salary
--Display the employee name, salary, and department name of the employee(s) earning the second-highest distinct salary in the company

select e.name,e.salary,d.deptname from employee e join department d
on d.deptid =e.deptid
where salary =(
    select max(salary) from employee
    where salary < (
    select max(salary) from employee)
)

--Q.7 Departments with above-average employee counts
--Display the department name and number of employees for departments whose employee count is greater than the average employee count across all departments


--Q.8 — Departments with employees earning more than ₹40,000
--Display the department names of departments that have at least one employee earning more than ₹40,000

select distinct d.deptname,e.name from department d join employee e
on d.deptid=e.deptid

where d.deptid in (
    select deptid from employee
    where salary > 40000
)


--9 Employees earning more than the average salary of IT
--Display the employee name, salary, and department name of employees whose salary is greater than the average salary of employees in the IT department.
select e.name ,e.salary,d.deptname from employee e join department d
on d.deptid =e.deptid
where salary>(
select avg(salary) from employee
where deptid =
(select deptid from department 
where deptname ='IT'))

-- 10 — Employees working in the department with the highest salary
--Display the employee name, salary, and department name of employees who earn the highest salary in the company.

select e.name, e.salary,d.deptname from employee e join department d
on d.deptid =e.deptid
where salary =(
select max(salary) from employee)


use mydb2


--CTE : common table expression; view that dont get stored

/*with ss as 
(
select e.name ,e.age,d.deptname from employee e join department d
on e.deptid = d.deptid
)
select * from ss

create view abc as 
(
select e.name ,e.age,d.deptname from employee e join department d
on e.deptid = d.deptid
)
select  * from abc

alter view abc as
(
select e.name ,e.age,e.salary,d.deptname from employee e join department d
on e.deptid = d.deptid
)
select * from abc */


 drop procedure abc

create procedure abc
as 
begin
select * from employee
end

abc


 drop procedure getemploybyid

create  procedure getemploybyid
@id int
as 
begin
select * from employee 
where id = @id
end


getemploybyid @id = 2

drop procedure getemploybyname

create  procedure getemploybyname
@name varchar(20)
as 
begin
select * from employee 
where name = @name
end





getemploybyname @name = 'Aisha'


alter procedure getemploybyname
@id int,
@name varchar(30)
as
begin
select * from employee
where name= @name and id = @id
end




getemploybyname 5,'sara'


--Q3. Display employees of a given department
--Question: Create a procedure named GetEmployeesByDept that accepts a department ID and displays employees belonging to that department


drop procedure GetEmployeesByDept

create procedure GetEmployeesByDept
@deptid int
as
begin
    select name, salary, age from employee
    where deptid = @deptid
END

exec GetEmployeesByDept @deptid=102


--Q4. Update an employee's salary
--Create a procedure named UpdateSalary that accepts an employee ID and a new salary, then updates the employee's salary.

drop procedure updatesalary

create procedure updatesalary
@id int,
@new_salary int
as 
begin
update employee
set salary = @new_salary
where id = @id
END

EXEC updatesalary @id = 2, @new_salary = 40000


select * from employee where id= 2


--Q5. Find employees earning above a given salary
--Question: Create a procedure named EmployeesAboveSalary that accepts a salary amount and displays employees earning more than that amount.

create procedure  EmployeesAboveSalary 
@salary int
as
begin
select * from employee
where salary > @salary
end

exec  EmployeesAboveSalary @salary = 20000

--Q6. Count employees in a department
--Question: Create a procedure named CountDeptEmployees that accepts a department ID and displays the department name and total number of employees in it
drop procedure CountDeptEmployees

create procedure CountDeptEmployees
@deptid int
as
begin
select d.deptname, COUNT(e.id) AS total_employees from employee e JOIN department d
on e.deptid = d.deptid
where d.deptid = @deptid
group by d.deptname
END

exec CountDeptEmployees @deptid = 101

--Q7. Find the highest-paid employee
--Question: Create a procedure named HighestPaidEmployee that displays the name, salary, and department ID of the employee receiving the highest salary.

create procedure HighestPaidEmployee
as 
begin
select name, salary, deptid from employee
where salary = (
select MAX(salary) from employee
)
end

EXEC HighestPaidEmployee


--Q8. Display employees with their department names
--Question: Create a procedure named DepartmentEmployeeDetails that displays each employee's name, salary, and department name using a JOIN

create procedure DepartmentEmployeeDetails
as
begin
select e.name,e.salary,d.deptname from employee e join department d
on e.deptid=d.deptid
end

exec DepartmentEmployeeDetails

--Q9. Display employees with their manager names
--Question: Create a procedure named EmployeeManagerDetails that displays each employee's name and their manager's name. Employees without managers should also appear.

create procedure EmployeeManagerDetails
as
begin
select e.name as employee_name,   m.name as manager_name from employee e LEFT JOIN employee m
ON e.managerid = m.id
end

exec EmployeeManagerDetails


--Q10. Display employees earning above their department's average salary
--Question: Create a stored procedure named EmployeesAboveDeptAvg that accepts a department ID and displays the names and salaries of employees whose salary is greater than the average salary of that department.
 drop procedure EmployeesAboveDeptAvg
create procedure EmployeesAboveDeptAvg
@deptid int
as
begin
select e.name, e.salary, d.deptname from employee e JOIN department d
ON e.deptid = d.deptid
where e.deptid = @deptid
and e.salary > (
    select avg(salary) from employee
    where deptid = @deptid
)
END

exec EmployeesAboveDeptAvg @deptid=101
drop table employee
drop table department


CREATE TABLE department (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(30),
    deptlocation VARCHAR(40)
)

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    salary INT,
    deptid INT,
    managerid INT,
    FOREIGN KEY (deptid) REFERENCES department(deptid)
)

INSERT INTO department (deptid, deptname, deptlocation)
VALUES
(100, 'HR', 'Lal Bazaar'),
(101, 'IT', 'Lal Chowk'),
(102, 'Finance', 'Hazratbal'),
(103, 'Marketing', 'Srinagar'),
(104, 'Sales', 'Bemina')

INSERT INTO employee (id, name, age, salary, deptid, managerid)
VALUES
(1, 'Aisha', 25, 50000, 101, 3),
(2, 'Rahul', 28, 35000, 100, 3),
(3, 'Zoya', 35, 70000, 101, NULL),
(4, 'Amir', 30, 45000, 102, 3),
(5, 'Sara', 32, 60000, 100, NULL),
(6, 'Imran', 24, 30000, 101, 1),
(7, 'Arjun', 27, 40000, 102, 3),
(8, 'Mehak', 29, 55000, 101, 3),
(9, 'Danish', 31, 25000, 100, 2)

select * from department
select * from employee

use mydb2


--system stored procedures

sp_help 'employee'    --all info of that table


sp_tables --total number of tables

sp_columns 'employee'     --columns in that particular table

sp_spaceused 'department'    --total storage taken by that table


sp_rename 'employee.name' , 'new_name'  


sp_rename 'employee.age' , 'new_age' , 'column'


--to delete column which has constraints on it - delete the contraints (drop constraint 'id code of error') then drop the column



--H/w : get more sp with their use

sp_databases -- enuerates all databases 

sp_pkeys --- returens primary key constarints

sp_fkeys -- identifies all foriegn key relationships

sp_attach_db --attaches an existing database

sp_cycle_errorlog --closes the active error log file

sp_depends --maps database object dependencies , showing which tables /views are referenced by a procedure , or what object depends on specific table

sp_helpuser -- lists database level security principles,roles and permisins granted within the active daabase framework

sp_helplogins --provides account details for sql server logins

sp_addlogin--deletes a sql server login

sp_helptext --displays the underlying T-SQL definition code of non - encrypted user defined objects 



use mydb2

--WINDOES FUNCTION

select * ,ROW_NUMBER() over (order by salary desc) as rn
from employee


select * ,Rank() over (order by salary desc) as rn
from employee


select * ,dense_rank() over (order by salary desc) as rn
from employee



select name,salary,deptid,
sum (salary) over (partition by deptid) as total_sal,
avg(salary) over (partition by deptid) as avg_sal
from employee


use mydb2

--max and min slary using windows

select name,salary,deptid,
max(salary) over (partition by deptid) as max_sal
from employee

select name,salary,deptid,
min(salary) over (partition by deptid) as min_sal
from employee

--difference between avg dept. salary and individual salary

select name,salary,deptid,
avg(salary) over (partition by deptid) as sal_diff
from employee

--to check how many employees share the same salary (count)
select salary ,count(*) from employee
group by salary

--to order the count in desc 
select salary ,count(*) as num_emp from employee
group by salary
order by num_emp desc


--doing the same using windows function
select name,salary,
count(*) over (partition by salary) as sal_count
from employee


--Lag : shows previous value
--lead : shows next value (based on order)
--syntax : e.g. lag(col_name,steps)


--1 step
select id , name, deptid , salary,
lag(salary,1) over (partition by deptid order by salary desc) as prev_sal     
from employee                                                               


select id , name, deptid , salary,
lead(salary,1) over (partition by deptid order by salary desc) as next_sal
from employee

--2 steps

select id , name, deptid , salary,
lag(salary,2) over (partition by deptid order by salary desc) as prev_sal2     
from employee                                                               


select id , name, deptid , salary,
lead(salary,2) over (partition by deptid order by salary desc) as next_sal2
from employee


use mydb2

/*
TRANSACTION : its a commant to manage data in database
An SQL transaction is a single logical unit of work that groups one or more SQL queries together to ensure they either all succeed or all fail as a pack.

2 pillars : 
1. COMMIT : is used to save data permanantly in database
2. ROLLBACK : is a command that restores the database to last commit state
*/
-- default 

--banking system to understand the same 
 drop table account 
create table account (
id int,
name varchar (30),
balance int
)

insert into account values
(1,'abc',2000),
(2,'xyz',3000)

select * from account

begin transaction 
begin try


update account 
set balance = balance - 500 
where id =1
---
---
---
update account
set balance += 500
where id = 2  
commit
end try
begin catch
rollback
end catch



/*
ACID : a set of four core rules that guarantee reliable processing of database transactions

1. A — Atomicity ("All or Nothing"):
A transaction is treated as a single, indivisible unit. Either every SQL statement inside the transaction succeeds, or if one fails, the entire transaction is rolled back so the database is left unchanged.
• Example: Transferring money from Account A to Account B requires withdrawing from A and depositing into B. Atomicity ensures that if the deposit into B fails, the withdrawal from A is undone

2. C — Consistency ("Valid State to Valid State"):
A transaction takes the database from one valid state to another, strictly adhering to all database rules, constraints, cascades, and foreign keys. If a transaction breaks a rule (like inserting a null value into a mandatory column), it fails and rolls back

3. I — Isolation ("No Interference/Independent execution"):
Concurrent transactions run independently without seeing each other's half-finished or intermediate changes. Even if multiple users or apps run queries at the exact same time, isolation keeps them separated based on defined isolation levels

4.D — Durability ("Permanent Changes"):
Once a transaction is committed using a COMMIT statement, the updates are permanent. Even if the system crashes, loses power, or restarts immediately afterward, the saved data survives

*/


 use mydb2

 select * from employee
--Trigger 

create trigger t_update
on employee
after update
as begin
print('updated succesfully')
end

update employee
set name = 'saboor'
where id=3



create trigger t_del
on employee
after delete
as begin
print('deleted successfully ')
end

delete from employee
where id=2

--INDEX : reduces retrieval time
--1. clustered 
--2. Non clustered



sp_helpindex 'employee'

create nonclustered index idx_name
on employee(name)

drop index idx_name on employee
