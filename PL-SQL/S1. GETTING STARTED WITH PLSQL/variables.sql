---------------------Declaring variables-----------------------------

/****************************************************
===================SYNTAX============================
variable_name datatype [NOT NULL] [:= initial_value];
=====================================================
****************************************************/

DECLARE
    l_total_sales NUMBER(15,2);
    l_credit_limit NUMBER (10,0);    
    l_contact_name VARCHAR2(255);
BEGIN
    NULL;
END;

---------------------Default values----------------------------------
DECLARE
  l_product_name VARCHAR2( 100 ) := 'Laptop';
BEGIN
  NULL;
END;
--Both are identical
DECLARE 
   l_product_name VARCHAR2(100) DEFAULT 'Laptop';
BEGIN 
   NULL; 
END;

---------------------Not null constraint-------------------------------
DECLARE
  l_shipping_status VARCHAR2( 25 ) NOT NULL := 'Shipped';
BEGIN
  l_shipping_status := ''; --ORA-06502: PL/SQL: numeric or value error
END;

---------------------Variable Assignments------------------------------
DECLARE
    l_customer_group VARCHAR2(100) := 'Silver'; -- (:=) variable assignment
BEGIN
    l_customer_group := 'Gold';
    DBMS_OUTPUT.PUT_LINE(l_customer_group);
END;

DECLARE
    l_business_parter VARCHAR2(100) := 'Distributor';
    l_lead_for VARCHAR2(100);
BEGIN
    l_lead_for := l_business_parter; -- Assigning one variable  to another
    DBMS_OUTPUT.PUT_LINE(l_lead_for);
END;

--------------------Anchored declarations----------------------------------
DECLARE
  l_customer_name customers.name%TYPE;
  l_credit_limit customers.credit_limit%TYPE;
BEGIN
  SELECT
    name, credit_limit
  INTO
    l_customer_name, l_credit_limit
  FROM
    customers
  WHERE
    customer_id = 38;

  DBMS_OUTPUT.PUT_LINE(l_customer_name || ':' || l_credit_limit );
END;

DECLARE
    l_credit_limit   customers.credit_limit%TYPE;
    l_average_credit l_credit_limit%TYPE; -- anchor to variable l_credit_limit 
    l_max_credit     l_credit_limit%TYPE;
    l_min_credit     l_credit_limit%TYPE;
BEGIN
    -- get credit limits
    SELECT 
        MIN(credit_limit), 
        MAX(credit_limit), 
        AVG(credit_limit)
    INTO 
        l_min_credit,
        l_max_credit, 
        l_average_credit
    FROM customers;
    
    
    SELECT 
        credit_limit
    INTO 
        l_credit_limit
    FROM 
        customers
    WHERE 
        customer_id = 100;

    -- show the credits     
    dbms_output.put_line('Min Credit: ' || l_min_credit);
    dbms_output.put_line('Max Credit: ' || l_max_credit);
    dbms_output.put_line('Avg Credit: ' || l_average_credit);

    -- show customer credit    
    dbms_output.put_line('Customer Credit: ' || l_credit_limit);
END;