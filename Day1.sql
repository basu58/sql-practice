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
--11. Display all employees whose name ends with ‘N’.
SELECT * from emp where ename like '%N';
--12. Find all employees whose name contains ‘L’.
select * from emp where ename like '%L%';
--13. List all employees in ascending order of salary.
select * from emp order by sal;
--14. List all employees in descending order of hire date.
select * from emp order by hiredate;
-- 15. Show the top 5 highest-paid employees.
SELECT * from emp order by sal desc limit 5;
-- 16. Show the lowest 3 salaries in the company.
select * from emp order by sal limit 3;
-- 17. Find the employee with the maximum salary.
SELECT * from emp where sal = (select max(sal) from emp);
-- 18. Find the employee with the minimum salary.
select * from emp order by sal limit 1;
-- 19. Display the total number of employees.
select count(distinct empno) from emp;
-- 20. Show the total salary paid to all employees.
SELECT sum(sal) from emp;
-- 21. Find the average salary of all employees.
SELECT avg(sal) from emp;
-- 22. Find the number of distinct job titles.
SELECT count(distinct job) from emp;
-- 23. List all job titles in alphabetical order.
select job from emp order by job;
-- 24. Show employee names and their departments.
select e.ename, e.deptno, d.dname from emp e 
JOIN
dept d on d.deptno = e.deptno;
-- 25. Display all department names from DEPT.
select dname from dept;
-- 26. Show the name, job, and department number for each employee.
select e.ename, e.deptno, e.job from emp e 
JOIN
dept d on d.deptno = e.deptno;
-- 27. Find employees whose department is located in 'DALLAS'.
select * from dept;
select e.*, d.loc from emp e
join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
-- 28. List all employees who do not have a manager.
select * from emp where mgr is null;
-- 29. Find employees who have commission greater than their salary.
select * from emp where comm > sal;
-- 30. Display employees whose job is not 'CLERK'.
select * from emp where job <> 'CLERK';
-- 31. Show employee details for those who joined in 1981.
select * from emp where EXTRACT(year from hiredate) = '1981';
-- 32. Display the names of employees who joined in the month of December.
select * from emp where EXTRACT(MONTH from hiredate) = '12';
-- 33. Display all employees with their annual salary (SAL * 12).
select *, sal*12 annual_salary from emp;
-- 34. Find employees whose name has exactly 5 letters.
SELECT * from emp where char_length(ename) = 5;
-- 35. Show employees with no commission.
select * from emp where comm is null;
-- 36. Display all departments located in 'CHICAGO'.
SELECT * from dept where loc  = 'CHICAGO';
-- 37. Show employees hired in 1982 or later.
SELECT * from emp where EXTRACT(year from hiredate) > 1982;
-- 38. List all managers (distinct MGR numbers).
SELECT distinct mgr from emp;
-- 39. Find employees who report to 'KING'.
SELECT * from emp where mgr = (select empno from emp where ename  = 'KING');
-- 40. Display employees working in the same department as 'BLAKE'.
select * from emp where deptno = (select deptno from emp where ename = 'BLAKE');
-- 41. Find employees whose salary is same as 'FORD'.
select * from emp where sal = (SELECT sal from emp where ename = 'FORD');
-- 42. List all employees whose salary is greater than 'MILLER'.
select * from emp where sal > (SELECT sal from emp where ename = 'MILLER');
-- 43. Find employees in department 20 earning more than 2000.
select * from emp where deptno = 20 and sal > 2000;
-- 44. Display name, job, and commission of salesmen only.
SELECT ename, job, comm from emp where job  = 'SALESMAN';
-- 45. Show employees with salary between 1500 and 2500 in dept 30.
select * from emp where sal between 1500 and 2500;
-- 46. Find all employees who joined before their manager.
select a.empno, a.ename, a.hiredate emp_hiredate, b.mgr, b.ename mgr_name, b.hiredate mgr_hiredate FROM
emp a 
left JOIN
emp b on a.empno = b.mgr
where a.hiredate < b.hiredate
union
select a.empno, a.ename, a.hiredate emp_hiredate, b.mgr, b.ename mgr_name, b.hiredate mgr_hiredate FROM
emp a 
right JOIN
emp b on a.empno = b.mgr
where a.hiredate < b.hiredate;
-- 47. Show all employees except 'KING' and 'FORD'.
SELECT * from emp where ename not in ('KING', 'FORD');
-- 48. Find all employees whose name starts with ‘S’ and ends with ‘T’.
select * from emp where ename like 'S%' and ename like '%T';
-- 49. List employee names and the length of their names.
select ename, CHAR_LENGTH(ename) name_length from emp; 
-- 50. Display all employees ordered by department and then by salary.
select * from emp order by deptno, sal 