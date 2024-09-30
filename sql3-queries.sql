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






