DECLARE
    v_step pls_integer := 2; -- SIMULATING VARIABLE --for simulating iteraters i.e.,incrementing or decrementing
BEGIN
    for v_iter in 1..6 loop
        dbms_output.put_line(v_iter);
        
        dbms_output.put_line('simulated output '||(v_iter + v_step));
    end loop;
    
    for v_iter in REVERSE 1..6 loop
        dbms_output.put_line(v_iter);
        
        dbms_output.put_line('simulated output '||(v_iter + v_step));
    end loop;
END;