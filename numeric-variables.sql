SET SERVEROUTPUT ON;


/*
Author: Joseph Castillo
Date:   3/2/2025
Purpose: This scrpit shows how to calculate numeric values.
*/
DECLARE
    --Declare variables
    EmpSalary       employee.salary%TYPE;
    EmpRaisePct     NUMBER(2);

BEGIN
    --Set the variables
    EmpSalary := &enter_salary;
    EmpRaisePct := &enter_raise_pct;

    --Display the statin salary
    DBMS_OUTPUT.PUT_LINE('Current salary: ' || EmpSalary);
    
    --Calculate the new salary
    EmpSalary := EmpSalary + (EmpSalary * (EmpRaisePct/100));
    
    --Display the results
    DBMS_OUTPUT.PUT_LINE('New Salary ' || EmpSalary);

END;
/