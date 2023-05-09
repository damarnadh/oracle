DECLARE
    v_counter PLS_INTEGER := 0;
BEGIN
    WHILE v_counter <= 5
    LOOP
        v_counter :=v_counter+1;
        DBMS_OUTPUT.PUT_LINE('v_counter '||v_counter);
        exit when v_counter =3;
    END LOOP;
end;