-- Extract the middle 3 characters from the string 'ABCDEFG'.
DECLARE @STR VARCHAR(20) = 'ABCDEFG';
DECLARE @START INT= LEN(@STR);
SELECT SUBSTRING(@STR,(@START-2)/2 +1,3)
AS MIDDLE_LETTERS;

-- From a table 'Employees' with a column 'FullName', write a query to extract the first name (assuming it's always the first word before a space).
SELECT SUBSTRING(FULLNAME,1,CHARINDEX(' ',FULLNAME) -1)
AS FIRST_NAME_SECTION
FROM EMPLOYEES

-- Extract the first 5 characters from the string 'SQL Server 2022'.
DECLARE @STR VARCHAR(20) ='SQL Server 2022';
SELECT SUBSTRING(@STR,1,5);

-- From a 'Products' table with a 'ProductCode' column, write a query to get the first 3 characters of each product code.
SELECT SUBSTRING(PRODUCTCODE,1,3) 
FROM PRODUCTDETAILS
AS PRODUCT_CODE;

--Extract the last 4 characters from the string 'ABCDEFGHIJKL'.
DECLARE @STR VARCHAR(20) = 'ABCDEFGHIJKL';
SELECT RIGHT(@STR,4)
AS LAST_FOUR;

--From an 'Orders' table with an 'OrderID' column (format: ORD-YYYY-NNNN), write a query to extract just the numeric portion at the end.
SELECT RIGHT(ORDERID,LEN(ORDERID)-CHARINDEX('-',ORDERID,CHARINDEX('-',ORDERID)+1)) FROM ORDERS;

-- Write a query to find the length of the string 'SQL Server Functions'.
DECLARE @STR VARCHAR(30)= 'SQL Server Functions';
SELECT LEN(@STR) AS LENGTH ;

-- From a 'Customers' table, find customers whose names are longer than 20 characters.
SELECT * FROM CUSTOMERS
WHERE LEN(CUSTOMERNAME) >20;

--Compare the results of character count and byte count for the string 'SQL Server' with a trailing space.
DECLARE @STR VARCHAR(20)='SQL Server   ';
SELECT LEN(@STR) AS CHARACTER_COUNT,
DATALENGTH(@STR) AS BYTE_COUNT;

'LEN returns the number of characters in the string, excluding trailing spaces.
DATALENGTH returns the number of bytes used to store the string'

-- Write a query to find the byte count of an empty string and explain the result
DECLARE @STR VARCHAR(20)='';
SELECT LEN(@STR) AS CHARACTER_COUNT,
DATALENGTH(@STR) AS BYTE_COUNT;

'DATALENGTH measures the amount of space used in bytes for the string, and since there are no characters, there are no bytes allocated.'

-- Find the position of 'Server' in the string 'Microsoft SQL Server'.
DECLARE @STR VARCHAR(30) ='Microsoft SQL Server';
SELECT CHARINDEX('SERVER',@STR) AS POSITION;

--From an 'Emails' table, write a query to extract the domain name from email addresses.
SELECT RIGHT(MAILID,LEN(MAILID)-CHARINDEX('@',MAILID)) FROM EMAILS;

-- Find the position of the first number in the string 'ABC123DEF456'.
DECLARE @STR VARCHAR(20)='ABC123DEF456'
SELECT PATINDEX('%[0-9]%',@STR) AS POSITION;

-- Write a query to find all product names from a 'Products' table that contain a number.
SELECT * FROM PRODUCTS;
SELECT * FROM PRODUCTS 
WHERE ProductName 
LIKE '%[0-9]%'

-- Join the strings 'SQL', 'Server', and '2022' with spaces between them.
 SELECT CONCAT('SQL',' ','SERVER',' ','2022') AS JOINED_STRING;

-- From 'Employees' table with 'FirstName' and 'LastName' columns, create a 'FullName' column.
ALTER TABLE EMPLOYEE
ADD FULLNAME VARCHAR(30);

UPDATE EMPLOYEE
SET FULLNAME=CONCAT(FIRSTNAME,' ',LASTNAME) 

--  Join the array ('SQL', 'Server', '2022') with a hyphen as the separator.
SELECT CONCAT_WS('-','SQL','SERVER','2022') AS JOINED_STRING;

--  From an 'Addresses' table, combine 'Street', 'City', 'State', and 'ZIP' columns into a single address string.
SELECT CONCAT__WS(',',Street, City, STATES, ZIP) AS FullAddress
FROM Addresses;

-- Change all occurrences of 'a' to 'e' in the string 'database management'.
SELECT REPLACE('database management', 'a', 'e') AS UpdatedString;

-- From a 'Products' table, write a query to replace all spaces in product names with underscores.
SELECT REPLACE(PRODSS, ' ', '_') AS UpdatedString FROM PRODUCTS;

-- Create a string of 10 asterisks (*).
SELECT REPLICATE('*',10) AS REPLICATEDSTRING

-- Write a query to pad all product codes in a 'Products' table to a length of 10 characters with leading zeros.
UPDATE PRODUCTS 
SET PRODCODE=REPLICATE('0',10-LEN(PRODCODE))+PRODCODE;

--Insert the string 'New ' at the beginning of 'York City'
DECLARE @S VARCHAR(20)='YORK CITY';
SELECT CONCAT('NEW',' ',@S) AS FullString;

-- From an 'Emails' table, mask the username part of email addresses, showing only the first and last characters.
SELECT * FROM EMAILS;
SELECT CONCAT(
LEFT(MAILID,1),
REPLICATE('*',LEN(MAILID)-CHARINDEX('@',MAILID)),
RIGHT(MAILID,(LEN(MAILID)-CHARINDEX('@',MAILID))+2))
FROM EMAILS

--Convert the string 'sql server' to uppercase.
DECLARE @S VARCHAR(10)='sql server';
SELECT UPPER(@s) AS capitalized;

--Write a query to convert all customer names in a 'Customers' table to uppercase.
update customers
set customername=upper(customername)

-- Convert the string 'SQL SERVER' to lowercase.
DECLARE @S VARCHAR(10)='SQL SERVER';
SELECT lower(@s) AS capitalized;

--From a 'Products' table, write a query to convert all product descriptions to lowercase.
UPDATE PRODUCTS
SET PRODDESC=LOWER(PRODDESC);

--Remove trailing spaces from the string 'SQL Server    '.
--Remove leading spaces from the string '   SQL Server'.

DECLARE @S VARCHAR(50) = '          SQL SERVER       ';
SELECT '[' + TRIM(@S) + ']' AS Trimmed;
SELECT '[' + RTRIM(@S) + ']' AS RightTrimmed;
SELECT '[' + LTRIM(@S) + ']' AS LeftTrimmed;

-- Write a query to remove trailing spaces from all email addresses in an 'Employees' table.
UPDATE EMPLOYEE
SET EMAIL=RTRIM(EMAIL)

-- From a 'Comments' table, write a query to remove leading spaces from all comment texts.
UPDATE COMMENTS
SET COMMENT=LTRIM(COMMENT)

-- Display the current date in the format 'dd-MM-yyyy'.
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy') AS FormattedDate;

-- From an 'Orders' table with an 'OrderTotal' column, display the total as a currency with 2 decimal places.
SELECT FORMAT(OrderTotal, 'C2', 'en-US') AS Total
FROM Orders;

-- Separate the string 'apple,banana,cherry' into individual fruits.
DECLARE @Fruits VARCHAR(100) = 'apple,banana,cherry';

SELECT value AS Fruit
FROM STRING_SPLIT(@Fruits, ',');

-- From a 'Skills' table with a 'SkillList' column containing comma-separated skills, write a query to create a row for each individual skill.
select * from skills
cross apply string_split(skilllist,',');














