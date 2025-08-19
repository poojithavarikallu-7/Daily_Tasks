create database StudentDB;
use StudentDB;
-- Create Departments table
create table Departments (
    DeptID int primary key,
    DeptName varchar(20)
);

-- Employees table
create table Employees (
    EmpID int primary key,
    EmpName varchar(20),
    DeptID int,
    Salary int,
    HireDate date,
    foreign key (DeptID) references Departments(DeptID)
);

-- Insert values into Departments table
insert into Departments values
(1,'HR'),
(2,'IT'),
(3,'Sales');

-- Insert values into Employees table
insert into Employees values
(101,'John',1,50000,'2018-02-12'),
(102,'Alice',2,60000,'2019-07-10'),
(103,'Bob',1,55000,'2020-05-05'),
(104,'Carol',3,45000,'2017-09-20');

-- 1.Display all records from the Employees table
select * from Employees;

-- 2.Display only EmpName and Salary of all employees
select EmpName, Salary from employees;

-- 3.Find all employees who belong to the IT department 
select EmpName from Employees join Departments ON Employees.DeptID = Departments.DeptID where Departments.DeptName = 'IT';

-- 4.List employees whose salary is greater than 50,000
select * from Employees where Salary>50000;

-- 5.Find employees hired before 2020-01-01
select * from Employees where HireDate < '2020-01-01';

-- 6.Display employees in descending order of salary
select * from Employees order by Salary desc;

-- 7.Count total number of employees
select count(*) as Total_Employees from Employees;

-- 8.Find the average salary of all employees
select avg(Salary) as Average_Salary from Employees;

-- 9.Find the maximum salary in each department
select DeptID, max(Salary) as Max_Salary from Employees group by DeptID;

-- 10.Find departments having more than 1 employee
select DeptID, count(*) as Employee_Count from Employees group by DeptID having count(*) > 1;
