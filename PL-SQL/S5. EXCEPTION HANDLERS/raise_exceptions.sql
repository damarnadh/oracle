DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init(e_credit_too_high,-20001);
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
    l_update_credit customers.credit_limit%TYPE := &credit_limit;
BEGIN
    BEGIN
    select max(credit_limit) into l_max_credit from customers;
    -- raising internal exception
    if l_customer_id < 0 THEN
        raise invalid_number;
    end if;
    -- raising userdefined exception
    if l_update_credit>l_max_credit then
        raise e_credit_too_high;
        --raising application error
       --raise_application_error(-20001,'credit too high');
    end if;
    
    EXCEPTION 
        WHEN e_credit_too_high THEN
            DBMS_OUTPUT.PUT_LINE('credit limit is too high');
            --reraising current exception
            RAISE;
    END;
EXCEPTION 
        WHEN e_credit_too_high THEN
            select avg(credit_limit) into l_update_credit from customers;
            DBMS_OUTPUT.PUT_LINE('ADJUSTED CREDIT LIMIT FOR CUSTOMER '||l_customer_id||'WITH CREDIT '||l_update_credit);
END;