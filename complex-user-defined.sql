/*
El código proporcionado es un ejemplo de cómo trabajar con tipos de datos definidos por el usuario en PL/SQL, específicamente utilizando tipos RECORD para almacenar información estructurada sobre empleados y gerentes, como su número de seguro social, apellido, departamento y compensaciones como el bono, coche de empresa y semanas de vacaciones.

A través de este código, se declara un tipo BonusCompensation para almacenar detalles sobre los bonos de los empleados y un tipo EmpRecord para almacenar los datos completos de un empleado, que incluye su información personal y el bono. Luego, el código usa estos tipos para realizar consultas a la base de datos, seleccionar a los empleados con más horas trabajadas y asignarles una compensación.

El propósito principal del código es mostrar cómo organizar y manejar datos complejos de manera eficiente mediante el uso de tipos personalizados en PL/SQL, lo cual mejora la legibilidad del código y facilita su mantenimiento. Además, se accede y modifica fácilmente a los datos dentro de estos tipos definidos por el usuario para realizar cálculos o mostrar resultados específicos.

En resumen, el código ejemplifica cómo usar tipos definidos por el usuario para manejar de manera estructurada y clara la información relacionada con empleados y sus compensaciones en una base de datos.
*/
SET SERVEROUTPUT ON;

DECLARE

    --Simple type declaration
    TYPE BonusCompensation IS RECORD (
        CashPayment     NUMBER(6),
        CompanyCar      BOOLEAN,
        VacationWeeks   NUMBER(2)
    );

    --Extended type declaration
    TYPE EmpRecord IS RECORD (
        ssn             employee.ssn%TYPE,
        LName           employee.LName%TYPE,
        DName           department.DName%TYPE,
        BonusPayment    BonusCompensation
    );

    --Another extended type declaration along with the instance declaration
    TYPE ManagerRecord IS RECORD (
        ssn               employee.ssn%TYPE,
        BonusPayment      BonusCompensation
    );

    --Instance declaration
    BestEmp EmpRecord;
    BestManager ManagerRecord;

BEGIN

    /*
    Less than meaningful logic to determine the employee who should receive
    a bonus.  The main focus in this example is the ability to store database
    values within the record instance.
    */
    SELECT essn, LName, DName
    INTO    BestEmp.ssn,
            BestEmp.LName,
            BestEmp.DName
    FROM employee, department, works_on
    WHERE employee.dno = department.dnumber
    AND employee.ssn = works_on.essn
    AND hours = (SELECT MAX(hours) FROM works_on)
    AND ROWNUM <= 1;

    --The next segment of code accesses the values within the record instance
    BestEmp.BonusPayment.CashPayment := 5000;
    BestEmp.BonusPayment.CompanyCar := TRUE;
    BestEmp.BonusPayment.VacationWeeks := 1;

    --Output the results
    dbms_output.put_line('Best employee name: ' || BestEmp.LName);
    dbms_output.put_line('Best employee department: ' || BestEmp.DName);
    dbms_output.put_line('Best employee bonus payment: $' || BestEmp.BonusPayment.CashPayment);

    --Test for company car
    IF BestEmp.BonusPayment.CompanyCar = TRUE THEN
        dbms_output.put_line('Company car also provided');
    END IF;

    --Test for vacation weeks
    IF BestEmp.BonusPayment.VacationWeeks > 0 THEN
        dbms_output.put_line('Extra vacation weeks granted: ' || BestEmp.BonusPayment.VacationWeeks);
    END IF;

    /*
    A similar set of instructions uses the other record instance. This is used to 
    perform similar logic for a manager who is selected for bonus compensation.
    */
    SELECT ssn
    INTO BestManager.ssn
    FROM employee, department
    WHERE employee.ssn = department.MgrSSN
    AND ROWNUM <= 1;

    --The next segment of code accesses the values within the record instance
    BestManager.BonusPayment.CashPayment := 10000;
    BestManager.BonusPayment.CompanyCar := TRUE;
    BestManager.BonusPayment.VacationWeeks := 2;

    --Output the results
    dbms_output.put_line('');
    dbms_output.put_line('Best manager SSN: ' || BestManager.ssn);
    dbms_output.put_line('Best manager bonus payment: $' || BestManager.BonusPayment.CashPayment);

    --Test for company car
    IF BestManager.BonusPayment.CompanyCar = TRUE THEN
        dbms_output.put_line('Company car also provided');
    END IF;

    --Test for vacation weeks
    IF BestManager.BonusPayment.VacationWeeks > 0 THEN
        dbms_output.put_line('Extra vacation weeks granted: ' || BestManager.BonusPayment.VacationWeeks);
    END IF;

END;

