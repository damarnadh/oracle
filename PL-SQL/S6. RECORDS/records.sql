DECLARE
  -- define a record type (programmer based)
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

DECLARE
    -- declare record type (table based)
  -- record_name table_name%ROWTYPE;
  r_contact contacts%ROWTYPE;
BEGIN
  NULL;
END;

DECLARE
    -- declare record type (cursor based)
  -- record_name cursor_name%ROWTYPE;
   CURSOR c_contacts IS
        SELECT first_name, last_name, phone
        FROM contacts;
    r_contact c_contacts%ROWTYPE;
BEGIN
  NULL;
END;


--referencing a record's field record_name.field_name -->r_contact.first_name

--Assigning records-->r_contact1 := r_contact2

--Note: we cannot compare records if r_contact1 = r_contact2 then will throw error
--So, we need to compare individual fields -->r_contact1.first_name = r_contact2.first_name
--Assigning individual fields.
--r_contact1.first_name := 'damarnadh'
--or SELECT INTO for whole or individual records.
SELECT
  first_name, last_name, phone
INTO
  r_contact
FROM
  contacts
WHERE
  contact_id = 100;
  
--simillarly FETCH INTO for whole or individual records.
-- fetch a whole record
FETCH cur_contacts INTO r_contact;

-- fetch individual fields
FETCH
  cur_contacts
INTO
  r_contact.first_name, 
  r_contact.last_name, 
  r_contact.phone;

--Records insert and update statements
CREATE TABLE persons  (
    person_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    first_name VARCHAR2( 50 ) NOT NULL, 
    last_name VARCHAR2( 50 ) NOT NULL,
    primary key (person_id)
);

--Inserting a row
DECLARE
  r_person persons%ROWTYPE;

BEGIN
  -- assign values to person record
  r_person.person_id  := 1;
  r_person.first_name := 'John';
  r_person.last_name  := 'Doe';

  -- insert a new person
  INSERT INTO persons VALUES r_person;
END;

select * from persons;
commit;

--Update using SET_ROW
DECLARE
  r_person persons%ROWTYPE;

BEGIN
  -- get person data of person id 1
  SELECT * INTO r_person 
  FROM persons 
  WHERE person_id = 1;

  -- change the person's last name
  r_person.last_name  := 'Smith';

  -- update the person
  UPDATE persons
  SET ROW = r_person
  WHERE person_id = r_person.person_id;
END;


--Nested Record
DECLARE
  TYPE address IS RECORD (
    street_name VARCHAR2(255),
    city VARCHAR2(100),
    state VARCHAR2(100),
    postal_code VARCHAR(10),
    country VARCHAR2(100)
  );
  TYPE customer IS RECORD(
      customer_name VARCHAR2(100),
      ship_to address,
      bill_to address
  );
  r_one_time_customer customer;
BEGIN

  r_one_time_customer.customer_name := 'John Doe';
  -- assign address
  r_one_time_customer.ship_to.street_name := '4000 North 1st street';
  r_one_time_customer.ship_to.city := 'San Jose';
  r_one_time_customer.ship_to.state := 'CA';
  r_one_time_customer.ship_to.postal_code := '95134';
  r_one_time_customer.ship_to.country := 'USA';
  -- bill-to address is same as ship-to address
  r_one_time_customer.bill_to := r_one_time_customer.ship_to;
END;
