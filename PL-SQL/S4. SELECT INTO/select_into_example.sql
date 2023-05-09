DECLARE
    l_customer_name customers.name%TYPE;
BEGIN
    select name into l_customer_name
    from customers where customer_id =120;
    dbms_output.put_line(l_customer_name);
END;

DECLARE
    r_customer customers%ROWTYPE;
BEGIN
    select * into r_customer
    from customers where customer_id =125;
    dbms_output.put_line(r_customer.name||', website '||r_customer.website);
END;

DECLARE
    l_customer_name customers.name%TYPE;
    l_contact_first_name contacts.first_name%TYPE;
    l_contact_last_name contacts.last_name%TYPE;
BEGIN
    select name,first_name,last_name into l_customer_name,l_contact_first_name,l_contact_last_name
    from customers inner join contacts using (customer_id) where customer_id =120;
    dbms_output.put_line(l_customer_name ||', Contact_person'||l_contact_first_name||', '||l_contact_last_name);
END;