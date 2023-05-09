------------------- Declaring constants------------------------------------

/**************************************************************************
SYNTAX : constant_name CONSTANT datatype [NOT NULL]  := expression
**************************************************************************/

-------------------- Constant examples-------------------------------------
DECLARE
    co_payment_term   CONSTANT NUMBER   := 45; -- days 
    co_payment_status CONSTANT BOOLEAN  := FALSE; 
BEGIN
    NULL;
END;

DECLARE
    co_payment_term   CONSTANT NUMBER   := 45; -- days 
    co_payment_status CONSTANT BOOLEAN  := FALSE; 
BEGIN
    co_payment_term := 30; -- error ORA-06550: PLS-00363: expression 'CO_PAYMENT_TERM' cannot be used as an assignment target
END;

DECLARE 
    co_pi     CONSTANT REAL := 3.14159;
    co_radius CONSTANT REAL := 10;
    co_area   CONSTANT REAL := (co_pi * co_radius**2); -- constant declared from an expression
BEGIN
    DBMS_OUTPUT.PUT_LINE(co_area);
END;