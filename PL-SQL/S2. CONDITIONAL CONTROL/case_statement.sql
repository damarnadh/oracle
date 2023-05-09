/******************************************************************************
=============================SYNTAX============================================
CASE selector
WHEN selector_value_1 THEN
    statements_1
WHEN selector_value_1 THEN 
    statement_2
...
ELSE
    else_statements
END CASE;
===============================================================================
******************************************************************************/

--------------Simple Case Statement Example------------------------------------
DECLARE
  c_grade CHAR( 1 );
  c_rank  VARCHAR2( 20 );
BEGIN
  c_grade := 'Z';
  CASE c_grade
  WHEN 'A' THEN
    c_rank := 'Excellent' ;
  WHEN 'B' THEN
    c_rank := 'Very Good' ;
  WHEN 'C' THEN
    c_rank := 'Good' ;
  WHEN 'D' THEN
    c_rank := 'Fair' ;
  WHEN 'F' THEN
    c_rank := 'Poor' ;
  ELSE -- mandatory
    c_rank := 'No such grade' ;
   -- raise CASE_NOT_FOUND;
  END CASE;
  DBMS_OUTPUT.PUT_LINE( c_rank );
END;

-----------------Searched Case Statement----------------------------------------
DECLARE
  n_sales      NUMBER;
  n_commission NUMBER;
BEGIN
  n_sales := 150000;
  CASE
  WHEN n_sales    > 200000 THEN
    n_commission := 0.2;
  WHEN n_sales   >= 100000 AND n_sales < 200000 THEN
    n_commission := 0.15;
  WHEN n_sales   >= 50000 AND n_sales < 100000 THEN
    n_commission := 0.1;
  WHEN n_sales    > 30000 THEN
    n_commission := 0.05;
  ELSE
    n_commission := 0;
  END CASE;

  DBMS_OUTPUT.PUT_LINE( 'Commission is ' || n_commission * 100 || '%'
  );
END;
