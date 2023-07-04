DECLARE
    credit_limit_exceed EXCEPTION;
    PRAGMA exception_init(credit_limit_exceed, -20111);

    l_customer_id     customers.customer_id%TYPE := &customer_id;
    l_credit_limit    customers.credit_limit%TYPE := &credit_limit;

    l_customer_credit customers.credit_limit%TYPE;
    
BEGIN
    -- get customer credit limit
    SELECT credit_limit INTO l_customer_credit
    FROM customers
    WHERE customer_id = l_customer_id;
    
    -- raise an exception if the credit limit is exceeded
    IF l_customer_credit > l_credit_limit THEN
        raise_application_error(-20111,'Credit Limit Exceeded');
    END IF;
    
    dbms_output.put_line('Credit Limit is checked and passed');
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer with id ' || l_customer_id || ' does not exist.');
END;
