-- 1.   Display customer details with business as ‘Consultant’ from table client
select * 
from clients
where business = 'Consultant';

-- 2.   Display employee details who are not ‘developers’ from table employees
select *
from employees
where job <> 'Developer';

-- 3.   Display employee names beginning with ‘M’ from table employees.
select ename 
from employees 
where ename like 'M%';

-- 4.	Display employee names ending with 'a’ from table employees
select ename
from employees 
where ename like '%a';

-- 5.	Display first 3 characters of each client name from table employees.
-- For this we will use a function called substring.
-- Syntax : select substring(column_name, starting_pos, len) from tablename;
select substring(ename, 1, 3)
from employees;

-- 6.	Display count of employees and sum of their salaries from table employees
-- For this we use COUNT() aggregate function.
-- (Aggregate function processes with multiple rows and return one row based on operation.)
select count(ename) as 'Total Employees', sum(salary) as 'Total Salary'
from employees;

-- 7.	Display max salary per department from employees.
-- For this we will use MAX() with GROUP BY.
select deptno as 'Job', max(salary) as 'Salary'
from employees 
group by deptno;

-- 8.	Display the project id with highest budget from table projects.
select project_id as 'Project ID', budget as 'Budget'
from projects
where budget = (select max(budget) from projects);

-- 9.	Display employee names who have same job from table employees (use self join).
select t1.ename, t2.ename
from employees as t1
join employees as t2
on t1.job = t2.job;

-- 10.	Display job wise count from table employees.
select count(job) as 'Jobs'
from employees;

-- 11.	Update client address from Mumbai to kochi from table clients
update clients
set address = 'Kochi'
where address = 'Mumbai';

-- 12.	Rename column Ename to empname of table employees.
alter table employees
rename column ename to empname;

-- 13.	Display first 3 employees details from table employees.
select * 
from employees
limit 3;

-- 14.	Assign row number to Employees table.{as a new column (empno,empname,row_number)}
-- We have to use window function.
select empno, empname, row_number() over (order by empno asc) as 'row_number'
from employees;

-- 15.	Display employee names, salary and bonus calculated as 25% of salary.
select empname as 'Name', salary as 'Salary', round(salary*(25/100)) as 'Bonus'
from employees;

-- 16.	Display names of the employees doing  ‘system analysis’ along with their project name.
-- empProjectTasks (Project ID & Employee ID as FK) -> Projects (Project name) & Employees (Employee name) as PK

/* Basic idea - 
We need employee name from employees table and descr from projects table.
They both are not directly linked but have a common table called empProjectTasks.
Now 
	1. From empprojecttasks we Join employees on empno to get empname.
    2. From empprojecttasks we Join projects on project_id to get descr.
*/
select  e.empname as 'Employee Name', p.descr as 'Project Name'
from empprojecttasks as t
join employees as e
	on e.empno = t.empno
join projects as p 
	on p.project_id = t.project_id
where t.task = 'System Analysis';

-- 17.	Increase salary of employees by 15% who have performed task of testing on projects.
-- Salary is in employees table and tasks is in empProjectTasks. (Linked with empno).
-- Update -> Join -> On -> Set -> Where
update employees e
join empprojecttasks t 
on e.empno = t.empno
set salary = salary * 1.15
where t.task = 'Testing';

-- For online compilers
UPDATE employees
SET salary = salary * 1.15
WHERE empno IN (
    SELECT empno
    FROM empprojecttasks
    WHERE task = 'Testing'
);
