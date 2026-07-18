-- Clients table
create table clients(
  client_id int(4) primary key,
  cname varchar(20) not null,
  address varchar(30),
  email varchar(20) unique,
  phone varchar(12),
  business varchar(20) not null
);

-- Employees table
create table employees(
  empno int primary key,
  ename varchar(20) not null,
  job varchar(15),
  salary int check (salary > 0),
  deptno int
);

-- Projects
create table projects(
  project_id int primary key,
  descr varchar(30) not null,
  start_date date,
  planned_end_date date,
  actual_end_date date,
  budget int check (budget > 0),
  client_id int,
  foreign key (client_id) references clients(client_id),
  check (actual_end_date > planned_end_date)
);

-- EmpProjectTasks
create table empProjectTasks(
  project_id int(3),
  empno int(4),
  start_date date,
  end_date date,
  task varchar(25) not null,
  status varchar(15) not null,
  foreign key (project_id) references projects(project_id),
  foreign key (empno) references employees(empno)
);

-- 18.	Display Client name whose project’s ‘Coding’ task is ‘in progress’.
-- cname from client, descr from projects, status from empprojecttasks
select c.cname as 'Client', p.descr as 'Project', t.status as 'Status'
from projects as p
join clients as c 
	on c.client_id = p.client_id
join empprojecttasks t 
	on p.project_id = t.project_id
where t.status = 'In progress';