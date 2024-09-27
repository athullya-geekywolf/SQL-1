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
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 50000 AND 75000;

--List all employees whose last name begins with the letter 'S'.
SELECT * FROM EMPLOYEES 
WHERE LASTNAME 
LIKE 'S%';

--Display all employees with exactly five letters in their first name
SELECT * FROM EMPLOYEES 
WHERE FIRSTNAME 
LIKE '_____';

--Find employees whose last name starts with either 'B', 'R', or 'S'.
SELECT *
FROM Employees
WHERE LastName LIKE 'B%'
   OR LastName LIKE 'R%'
   OR LastName LIKE 'S%';

--Retrieve all employees whose first name begins with any letter from 'A' through 'M'.
SELECT *
FROM Employees
WHERE FirstName LIKE '[A-M]%';

--List employees whose last name doesn't start with a vowel (A, E, I, O, U).

SELECT * FROM EMPLOYEES
WHERE LASTNAME LIKE '[^AEIOU]%';

--Identify employees earning more than $80,000 annually.
SELECT * FROM EMPLOYEES
WHERE SALARY > 80000;

--Find employees who joined the company before 2020.

SELECT * FROM EMPLOYEES
WHERE year(HireDate) < 2020;

--List all employees not named 'John' (first name).

SELECT * FROM EMPLOYEES
WHERE FirstName NOT LIKE 'JOHN';

--Identify Marketing department employees earning $60,000 or less who were hired after June 30, 2019.
SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT='MARKETING' 
AND SALARY < 60000
AND HIREDATE > '2019-06-30';

--Find employees whose first name contains the letters 'an' anywhere and ends with 'e'.
SELECT * 
FROM EMPLOYEES
WHERE FIRSTNAME 
LIKE '%AN%E' ;


----------------------------------------------------------------------------------------
CREATE TABLE Products (
    ProductID INT IDENTITY(10,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Customers (
    CustomerID INT IDENTITY(101,1) PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2)
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
	FOREIGN KEY(PRODUCTID) REFERENCES PRODUCTS(PRODUCTID),
	FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);

--Calculate the total sales amount for each product. Display the ProductID and total sales amount.
SELECT P.PRODUCTID, SUM(S.QUANTITY*S.UNITPRICE) AS SALES_AMOUNT
FROM PRODUCTS P
LEFT JOIN SALES S
ON P.PRODUCTID = S.PRODUCTID
GROUP BY P.PRODUCTID;

--Find the average quantity sold per sale for each product category.
SELECT P.CATEGORY, AVG(S.QUANTITY) AS AVG_SOLD_QUANTITY
FROM PRODUCTS P
LEFT JOIN SALES S
ON P.PRODUCTID = S.PRODUCTID
GROUP BY P.CATEGORY;

--List the top 5 customers by their total purchase amount. Include the CustomerID and total purchase amount.
SELECT TOP 5 C.CUSTOMERID, SUM(S.QUANTITY*S.UNITPRICE)AS PURCHASE_AMOUNT
FROM CUSTOMERS C
JOIN SALES S
ON C.CUSTOMERID=S.CUSTOMERID
GROUP BY C.CUSTOMERID
ORDER BY PURCHASE_AMOUNT DESC;

--Determine the number of sales made each month in the year 2023. Display the month and the count of sales.
SELECT MONTH(SALEDATE) AS SALE_MONTH,COUNT(SALEID)
FROM SALES 
WHERE YEAR(SALEDATE)='2023'
GROUP BY SALEDATE;

--Calculate the total revenue for each state, but only for states with more than $10,000 in total sales.








