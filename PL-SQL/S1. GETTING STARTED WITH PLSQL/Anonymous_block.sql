set serveroutput on;
DECLARE
    test_msg VARCHAR(255) := 'Hi Damar, It was me';
    v_result NUMBER;
BEGIN
    DBMS_OUTPUT.put_line('Hi Damar');
    DBMS_OUTPUT.put_line(test_msg);
    v_result := (1/0);
    DBMS_OUTPUT.put_line(v_result);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        dbms_output.put_line('Got Error!'||SQLERRM);
END;