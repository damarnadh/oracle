select * from members;

select * from suppliers;

select * from supplier_groups;

insert into suppliers VALUES(4,'LG',3);

create table copy_members as SELECT * from members;

select * from copy_members where dob like '%-84%';

select segment_name,blocks,bytes/1024 as kB from user_segments;

SELECT * from user_segments;

SELECT 
    *
FROM 
    all_indexes
WHERE 
    index_name = 'PK_MEMBERS';

    
alter table copy_members  add CONSTRAINT pk_members PRIMARY key(member_id);

ANALYZE INDEX PK_MEMBERS VALIDATE STRUCTURE;

select * from index_stats;

