use employee;
--1. Display all records from the EMP table
select * from emp;
--2. Show the employee name and job for all employees.
select ename, job from emp;
--3. List the names and salaries of all employees.
select ename, sal from emp;
--4. Show all employees who work in department 10.
select * from emp where deptno = 10;
--Display all employees whose job is 'MANAGER'
select * from emp where job = 'MANAGER';
--Find employees with salary greater than 2000.
select * from emp where sal > 2000;
--7. List employees whose salary is between 1000 and 3000.
select * from emp where sal between 1000 and 2000;
--8. Display employees who were hired after 1981-01-01
select * from emp where hiredate > '1981-01-01';
--9. List all employees whose commission is not null.
select * from emp where comm is not null;
--10. Find all employees whose name starts with ‘A’.
SELECT * from emp where ename like 'A%';
