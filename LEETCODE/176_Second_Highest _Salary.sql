Create table Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');
commit;

--select rownum  'rowid' from (select * from employee) where rowid =1;
select DENSE_RANK() over (salary) from employee order by salary desc fetch first 1 rows only;