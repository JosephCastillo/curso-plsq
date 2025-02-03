SET SERVEROUTPUT ON;

/*
Author: Joseph Castillo
Date: 3/02/2025
Purpose: 
*/


DECLARE

	--Declare variables
	EmpSalary	employee.Salary%TYPE;
	HighPaid	BOOLEAN := FALSE;
	
BEGIN

	--Set the variables
	EmpSalary := &enter_salary_amount;
	HighPaid := (EmpSalary > 65000);
	
	--Test the HighPaid result
	IF HighPaid THEN
	
		--Display the message to the user
		dbms_output.put_line('Yes, this salary is high');

	ELSE
	
		--Display the message to the user
		dbms_output.put_line('No, this salary is fine.');

	END IF;
	
END;
/