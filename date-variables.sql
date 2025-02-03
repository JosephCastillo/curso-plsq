SET SERVEROUTPUT ON;

/*
Author: Jospeh Castillo
Date:   3/02/1015
Purpose: This script shows how to calculate date values.

*/

DECLARE

	--Declare variables
	EmpReviewDate	employee.Bdate%TYPE;
    EmpNextReview   EmpReviewDate%TYPE;
	
BEGIN

	--Set the variables
	EmpReviewDate := SYSDATE;
	EmpNextReview := EmpReviewDate + 100;
	
	--Display the current review date
	dbms_output.put_line('Current Review Date: ' || SYSDATE);

	--Display the next, calculated review date
	dbms_output.put_line('Next Review Date: ' || EmpNextReview);

END;
/