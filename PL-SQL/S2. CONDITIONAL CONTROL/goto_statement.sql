--SET SERVEROUTPUT ON;
BEGIN
    GOTO label2;
    <<label1>>
    DBMS_OUTPUT.PUT_LINE('LABEL ONE MESSAGE');
    GOTO end_label;-- IF no end_glabel print infinite and raise error;
    <<label2>>
    DBMS_OUTPUT.PUT_LINE('LABEL TWO MESSAGE');
    GOTO label1;
    <<end_label>>
    NULL;
END;