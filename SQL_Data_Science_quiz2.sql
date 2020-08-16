--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.
--Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT COUNT(Milliseconds) AS result
FROM Tracks
WHERE Milliseconds >= '5000000'

--Run Query: Find all the invoices whose total is between $5 and $15 dollars.
SELECT Total
FROM Invoices
WHERE Total BETWEEN '5.00' and '15.00'

--Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT State
, Company
, FirstName
, LastName
FROM Customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY')

--Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT CustomerId
, Total
, InvoiceDate
, InvoiceId
FROM Invoices
WHERE CustomerID IN (56,58)
AND Total BETWEEN 1.00 and 5.00

--Run Query: Find all the tracks whose name starts with 'All'.
SELECT Name
FROM Tracks
WHERE Name LIKE 'All%'

--Run Query: Find all the customer emails that start with "J" and are from gmail.com.
SELECT CustomerId, Email
FROM Customers
WHERE Email LIKE 'j%@gmail.com'

--Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT BillingCity, InvoiceId, Total
FROM Invoices
WHERE BillingCity IN ('Brasilia','Edmonton','Vancouver') 
ORDER BY InvoiceId desc

--Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
SELECT CustomerId, COUNT(*) AS Orders
FROM Invoices
GROUP BY CustomerId
ORDER BY Orders DESC

--Run Query: Find the albums with 12 or more tracks.
SELECT AlbumId, Count(*) AS RecordsNo
FROM Tracks
GROUP BY AlbumId
HAVING COUNT (*) >= 12
