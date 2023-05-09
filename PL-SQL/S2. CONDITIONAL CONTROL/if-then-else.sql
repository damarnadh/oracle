/******************************************************************************
================================SYNTEX=========================================
IF condition THEN
    statements;
ELSE
    else_statements;
END IF;
===============================================================================
******************************************************************************/

--- IF THEN ELSE EXAMPLE =--
DECLARE
  n_sales NUMBER := 300000;
  n_commission NUMBER( 10, 2 ) := 0;
BEGIN
  IF n_sales > 200000 THEN -- if sales revenue greater than 200000 then
    n_commission := n_sales * 0.1; --- set commission is 10%
  ELSE -- else
    n_commission := n_sales * 0.05; --- set commission is 5%
  END IF;
END;
