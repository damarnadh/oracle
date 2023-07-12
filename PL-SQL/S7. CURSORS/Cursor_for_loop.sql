DECLARE
    CURSOR c_product
    IS
        SELECT product_name,list_price from products order by list_price desc;
BEGIN
  --  FOR r_product in c_product 
  --  LOOP
  --      dbms_output.put_line(r_product.product_name || ':$' ||r_product.list_price);
  --  END LOOP;
    FOR r_product in (SELECT product_name,list_price from products order by list_price desc) -- equivalent to above cursor
    LOOP
        dbms_output.put_line(r_product.product_name || ':$' ||r_product.list_price);
    END LOOP;
END;

SET SERVEROUTPUT ON;