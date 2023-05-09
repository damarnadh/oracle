-- creating table index_demo
create table index_demo as select * from all_objects;

--Composite index -> adding multiple columns to primary key
alter table index_demo add constraint PK_INDEX_DEMO primary key (owner,object_name,object_type,object_id);

--to check created index in all_indexes table or we can do CTRL + mouseclick on tablename ,on indexes tab
select * from all_indexes where index_name = 'PK_INDEX_DEMO';

--creating unique index on index_demo using object_id column
create unique index idx_object_id on index_demo(object_id);

EXPLAIN PLAN FOR SELECT * FROM index_demo WHERE object_name ='dual' and owner ='sys';

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- creating table scan_demo
create table scan_demo (
id int,
salary int,
dept_no int
);


--inserting 100k random rows
insert into scan_demo
select ROWNUM,trunc(DBMS_RANDOM.value(100,9000)),trunc(DBMS_RANDOM.value(1,10))
from dual
connect by level <= 100000;

create unique index idx_scan_demo on scan_demo(id);

EXPLAIN PLAN FOR SELECT * FROM scan_demo WHERE id =100;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR SELECT count(1) FROM scan_demo; --index not used as unique is not primary key and has null it did table access full

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--dropping table
drop table scan_demo;
-- creating table scan_demo
create table scan_demo (
id int not null,
salary int,
dept_no int
);


--inserting 100k random rows
insert into scan_demo
select ROWNUM,trunc(DBMS_RANDOM.value(100,9000)),trunc(DBMS_RANDOM.value(1,10))
from dual
connect by level <= 100000;

create unique index idx_scan_demo on scan_demo(id);

EXPLAIN PLAN FOR SELECT * FROM scan_demo WHERE id =100;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR SELECT count(1) FROM scan_demo; --index fast full scan or muilti block read used which is very faster
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

