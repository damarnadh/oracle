/******************************************************************************
================================SYNTEX=========================================
IF condition THEN
    statements;
END IF;
===============================================================================
******************************************************************************/
SET SERVEROUTPUT ON;
DECLARE n_sales NUMBER := 2000000; 
BEGIN 
   IF n_sales > 100000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Sales revenue is greater than 100K ' ); 
   END IF; 
END;

DECLARE
  b_profitable BOOLEAN;
  n_sales      NUMBER;
  n_costs      NUMBER;
BEGIN
 /*--- Avoid this type of clumpsy if satament---
  b_profitable := false;   
  IF n_sales > n_costs THEN
    b_profitable := true;
  END IF;
 */
 --- use following statement instead of above statement---
 b_profitable := n_sales > n_costs;
 
 /* --- avoid this type of evaluating boolean variables---
 IF b_profitable = TRUE THEN
   DBMS_OUTPUT.PUT_LINE( 'This sales deal is profitable' );
 END IF;
 */
 
 --- use following statement instead of above statement---
 IF b_profitable THEN
   DBMS_OUTPUT.PUT_LINE( 'This sales deal is profitable' );
 END IF;

END;


