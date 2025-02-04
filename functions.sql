SET SERVEROUTPUT ON;

/*
Author: Joseph Castillo
Date:   3/02/2025
Purpose: This script shows how to use SQL Functions.
*/

DECLARE

    --Declate dthe type
    TYPE EmpRecord
        IS RECORD(
                    ssn             employee.ssn%TYPE,
                    LName           employee.lname%TYPE,
                    DName           department.DName%TYPE,
                    BonusPayment    NUMBER(6)
        );

    --Declare variables
    BestEmp     EmpRecord;
    
BEGIN

    --Fill the type
    SELECT essn, LName, DName, 5000
        INTO BestEmp
    FROM employee, department, works_on
    WHERE employee.dno = department.dnumber
    AND employee.ssn = works_on.essn
    AND hours = (SELECT MAX(hours) FROM works_on)
    AND ROWNUM <= 1;
    
    --Display the message to the user
    DBMS_OUTPUT.PUT_LINE('Best employee name: ' || UPPER(BestEmp.LName));
    
    --Display the message to the user
    DBMS_OUTPUT.PUT_LINE('Best employee bonus: ' || ROUND(BestEmp.BonusPayment * 1.15, - 3));


END;
/

SELECT
    "A1"."ESSN"  "ESSN",
    "A1"."PNO"   "PNO",
    "A1"."HOURS" "HOURS"
FROM
    "SYSTEM"."WORKS_ON" "A1";