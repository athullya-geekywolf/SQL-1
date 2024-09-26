--Create a table students and insert names in malayalam
CREATE TABLE STUDENTS(
STUD_ID INT,
NAME NVARCHAR(30)
);

INSERT INTO STUDENTS VALUES(02,N'റാം');

--Retrieve all employees who work in Sales, Marketing, or IT departments.
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT IN ('SALES','MARKETING','IT');

--Find all employees with salaries ranging from $50,000 to $75,000 (inclusive).

