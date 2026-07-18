-- 1. Select all records with all columns.
select * from student;

-- 2. Select all records with rollno, name and branch columns.
select rollno, name, branch 
from student;

-- 3. Select all records with all columns having branch ‘IT’.
select *
from student
where branch = 'IT';

-- 4. Select record of student having rollno 1003.
select * 
from student 
where rollno = 1003;

-- 5. Select all records of students with fee greater than 12000.
select *
from student 
where fee > 12000;

-- 6. Select record with column rollno, name, fee having rollno 1004.
select rollno, name, fee 
from student 
where rollno = 1004;

-- 7. Delete record of student having rollno 1004.
delete 
from student 
where rollno = 1004.