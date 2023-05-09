DECLARE
    l_name customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    select name into l_name from customers where customer_id<=l_customer_id;
    DBMS_OUTPUT.PUT_LINE('customer name , '||l_name);
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('customer ID , '||l_customer_id||' not found');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('The database returns more than one rows');
END;