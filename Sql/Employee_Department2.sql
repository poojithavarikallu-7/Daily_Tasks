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

-- 6. Display employees in descending order of salary
select * from Employees order by Salary desc;

-- 7. Count total number of employees
select count(*) as Total_Employees from Employees;

-- 8. Find the average salary of all employees
select avg(Salary) as Average_Salary from Employees;

-- 9. Find the maximum salary in each department
select DeptID, max(Salary) as Max_Salary from Employees group by DeptID;

-- 10. Find departments having more than 1 employee
select DeptID, count(*) as Employee_Count from Employees group by DeptID having count(*) > 1;

-- 11. Display employees whose names start with 'A'
select * from Employees where EmpName like 'A%';

-- 12. Find employees whose salary is between 45,000 and 60,000
select * from Employees where Salary between 45000 and 60000;

-- 13. Show the department name of each employee (JOIN query)
select Employees.EmpID,Employees.EmpName,Departments.DeptName,Employees.Salary,Employees.HireDate from Employees join Departments on Employees.DeptID=Departments.DeptID;

-- 14. Find the number of employees in each department
select Departments.DeptName,count(Employees.EmpID) as Employee_Count from Departments left join Employees on Departments.DeptID=Employees.DeptID group by Departments.DeptName;

-- 15. Display all employees, including those without a department (LEFT JOIN)
select Employees.EmpID,Employees.EmpName,Departments.DeptName,Employees.Salary,Employees.HireDate from Employees left join Departments on Employees.DeptID=Departments.DeptID;
