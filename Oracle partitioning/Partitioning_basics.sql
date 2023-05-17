create table transaction_demo
(
transaction_id int,
transaction_type varchar2(10),
amount int,
transaction_date date
);

create unique index idx_trans_id on transaction_demo(transaction_id);

select * from transaction_demo;

insert into transaction_demo
select rownum,'CREDIT',FLOOR(DBMS_RANDOM.value(90,9000)),trunc(sysdate) - FLOOR(DBMS_RANDOM.value(90,9000)) from dual
connect by level <= 1000000;

commit;

select segment_name,blocks,bytes/1024/1024 as MB from user_segments
where segment_name = 'TRANSACTION_DEMO';

analyze index idx_trans_id validate structure;

select * from index_stats;

--single block I/O or multiple block I/O