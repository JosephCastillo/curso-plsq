SET SERVEROUTPUT ON;

/*
Author: Joseph Castillo
Date:   2/2/2024
Purpose: In this script will generate an error due to the apostrophe foudn in
the message.
*/

DECLARE 

    --Declare variables
    nValue  NUMBER(10) := &enter_value;
    vMessage VARCHAR(30);

BEGIN
    
    --Test the value entered by the user.
    
    IF nValue > 60000 THEN
    
        --Set and display the message.
        vMessage := q'!The value isn't valid.!';
                
        DBMS_OUTPUT.PUT_LINE(vMessage);
        
    END IF;    
END;