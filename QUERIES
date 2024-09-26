CREATE TABLE EMPLOYEE(
EMPID INT PRIMARY KEY,
FIRSTNAME VARCHAR(30),
LASTNAME VARCHAR(30),
DEPARTMENT VARCHAR(30),
SALARY DECIMAL(10,2));

INSERT INTO EMPLOYEE VALUES (001,'Abhishek','Sadasivan','Admin',20000);
INSERT INTO EMPLOYEE VALUES (002,'Anoya','A','HR',21000.50);
INSERT INTO EMPLOYEE VALUES (003,'Cyril','Mathew','HR',23000.50);

"Select all columns and rows"
SELECT * FROM EMPLOYEE;

"Select specific columns"
SELECT EMPID,CONCAT(FIRSTNAME,' ',LASTNAME) AS NAME 
FROM EMPLOYEE;

"Select with a WHERE clause to filter results"
SELECT EMPID,CONCAT(FIRSTNAME,' ',LASTNAME) AS NAME 
FROM EMPLOYEE
WHERE DEPARTMENT='HR';

"Purpose of the IDENTITY keyword in the CREATE TABLE statement"
Purpose of IDENTITY keyword is to create an auto-incrementing number for a column automatically. Does not enforce uniqueness like primary key.
CREATE TABLE NEWEMPLOYEE (
    EmployeeID INT IDENTITY(10,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO NEWEMPLOYEE VALUES ('Abhishek','Sadasivan','Admin',20000);
INSERT INTO NEWEMPLOYEE VALUES ('Anoya','A','HR',21000.50);
INSERT INTO NEWEMPLOYEE VALUES ('Cyril','Mathew','HR',23000.50);

"SELECT statement to retrieve only the FirstName and Salary of all employees"
SELECT FIRSTNAME,SALARY FROM EMPLOYEE;

"How would you modify the existing UPDATE statement to give all employees in the IT department a 10% raise"
INSERT INTO EMPLOYEE VALUES (004,'Mukhil','P','IT',23000.50);
UPDATE EMPLOYEE
SET SALARY=SALARY+(0.1*SALARY)
WHERE DEPARTMENT='IT';

"Write a SELECT statement to find the highest salary in the Employees table.How would you add a new column named "HireDate" of type DATE to the Employees table?"
select max(salary) from employee;

ALTER TABLE Employee
ADD HireDate DATE;





