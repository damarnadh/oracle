DECLARE
  -- define a record type
TYPE r_customer_contact_t
IS
  RECORD
  (
    customer_name customers.name%TYPE,
    first_name    contacts.first_name%TYPE,
    last_name     contacts.last_name%TYPE );
  -- declare a record
  r_customer_contacts r_customer_contact_t;
BEGIN
  NULL;
END;
