--Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
SELECT CustomerId, FirstName, LastName, Address, City, Country, UPPER(City || " " || Country)
FROM Customers

--Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT FirstName,LastName, LOWER(SUBSTR(FirstName,1,4)) AS A, LOWER(SUBSTR(LastName,1,2)) AS B, LOWER(SUBSTR(FirstName,1,4)) || LOWER(SUBSTR(LastName,1,2)) AS userId
FROM Employees

--Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT LastName, HireDate,(STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate))- (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate)) AS WorkDuration
FROM Employees
WHERE WorkDuration >= 15
ORDER BY LastName ASC

--Profiling the Customers table, answer the following question.
SELECT COUNT(*)
FROM Customers
WHERE[options] IS NULL
--options:Phone, Address, FirstName, Company, Fax, PostalCode

--Find the cities with the most customers and rank in descending order.
SELECT City, COUNT(*) AS numbers
FROM Customers
GROUP BY City
ORDER BY numbers desc

--Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT c.FirstName, c.LastName, i.InvoiceId, c.FirstName || c.LastName|| i.InvoiceId AS NewCustomerId
FROM Customers c INNER JOIN Invoices i
ON c.CustomerId = i.Customerid
WHERE NewCustomerId LIKE 'AstridGruber%'
