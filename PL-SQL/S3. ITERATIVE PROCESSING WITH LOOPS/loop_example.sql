declare
v_counter number(20):=0;
BEGIN
    <<my_first_loop>> LOOP -- loop with label
        v_counter := v_counter +1;
        DBMS_OUTPUT.PUT_LINE('inside my_first_loop loop '||v_counter);
        if v_counter > 3 then
            exit;
        end if;
    end LOOP my_first_loop;
    DBMS_OUTPUT.PUT_LINE('outside my_first_loop loop '||v_counter);
    v_counter := 0;
    LOOP --loop without label
        v_counter := v_counter +1;
        DBMS_OUTPUT.PUT_LINE('inside loop '||v_counter);
        exit WHEN v_counter > 2;
    end LOOP;
    DBMS_OUTPUT.PUT_LINE('outside loop '||v_counter);
    
    -- NESTED LOOPS
    v_counter := 0;
    <<outer_loop>> LOOP -- loop with label
        v_counter := v_counter +1;
        DBMS_OUTPUT.PUT_LINE('inside outer_loop '||v_counter);
        if v_counter > 5 then
            exit;
        end if;
        <<inner_loop>> LOOP -- loop with label
            v_counter := v_counter +1;
            DBMS_OUTPUT.PUT_LINE('inside inner_loop '||v_counter);
            exit when v_counter > 2;
        end LOOP inner_loop;
    end LOOP outer_loop;
    
END;
