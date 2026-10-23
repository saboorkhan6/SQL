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

--hhh
--new