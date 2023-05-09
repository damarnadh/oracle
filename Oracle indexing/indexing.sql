-- creating table sales
create table sales(
id int,
order_id int,
product_code VARCHAR2(3),
amount int,
Date_of_sale date
);

commit;

-- inserting a million records
Insert into sales
select 
rownum, FLOOR(DBMS_RANDOM.VALUE(90,9000)),
DBMS_RANDOM.string('U',3),FLOOR(DBMS_RANDOM.VALUE(90,9000)),
trunc(sysdate)-FLOOR(DBMS_RANDOM.VALUE(10,9000)) 
from dual
connect by rownum <= 100000;

EXPLAIN PLAN FOR SELECT * FROM SALES WHERE ID =1;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--creating unique index
CREATE UNIQUE INDEX IDX_SALES_ID ON SALES(ID);

-- to analyze index
ANALYZE INDEX IDX_SALES_ID VALIDATE STRUCTURE;

-- to check that index exists physically memory
SELECT * FROM USER_SEGMENTS WHERE SEGMENT_NAME = 'IDX_SALES_ID';

-- to make index unusable and physically removed from disk -> this will help to load data faster
ALTER INDEX IDX_SALES_ID UNUSABLE;

-- to rebuild index on disk again after data load
ALTER INDEX IDX_SALES_ID REBUILD;

-- to make index invisible-> this will make oracle optimizer ignore index even though it physically exists and table will not use index 
-- this will be helpful to check performance of index on table and need for index cleanup
ALTER INDEX IDX_SALES_ID INVISIBLE;

-- to make index visible-> this will make oracle optimizer picks up again index and table will use index
ALTER INDEX IDX_SALES_ID VISIBLE;