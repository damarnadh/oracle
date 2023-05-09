set SERVEROUTPUT ON;
BEGIN
    FOR n_index IN 1..10
    LOOP
        --skip odd numbers
        if mod(n_index , 2)=1 then
            CONTINUE;
        end if;
        dbms_output.put_line(n_index);
    end loop;
    FOR n_index IN 100..110
    LOOP
        --skip odd numbers
        CONTINUE WHEN mod(n_index , 2)=1 ;
        dbms_output.put_line(n_index);
    end loop;
END;