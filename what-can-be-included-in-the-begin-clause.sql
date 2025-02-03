--Working whit CHAR and VARCHAR2 variables

SET SERVEROUTPUT ON;

/*
Author:     Joseph Castillo
Date:       2/2/2025
Purpose:    This script shows how to concatente VARCHAR() values.
*/

DECLARE
    
    --Declare variables
    EmpFname    employee.fname%TYPE;
    EmpLname    employee.lname%TYPE;
    EmpFullName VARCHAR(40);
    
    
BEGIN
    
    --Set the variables
    EmpFname := 'Jane';
    EmpLname := 'Smith';
    
    --Compile the name
    EmpFullName :=  EmpLname || ', ' || EmpFname;
    
    --Display the name
    DBMS_OUTPUT.PUT_LINE('Employee name: ' || EmpFullName);
    
END;
/








