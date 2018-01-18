use Northwind

-- nomor 1
--select CategoryName,Description from Categories order by CategoryName

--2. Select ContactName, CompanyName, ContactTitle, and Phone from the Customers table sorted by Phone.
--select ContactName,CompanyName,ContactTitle,Phone from Customers order by Phone desc

--3. Create a report showing employees' first and last names and hire dates sorted from newest to oldest employee.
--select FirstName,LastName,HireDate from Employees order by HireDate desc

--4. Create a report showing Northwind's orders sorted by Freight from most expensive to cheapest. 
--Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight.
--select o.OrderID,o.OrderDate,o.ShippedDate,o.CustomerID,o.Freight from Orders o inner join [Order Details] od on o.OrderID=od.OrderID
--	order by od.UnitPrice desc
--5. Select CompanyName, Fax, Phone, HomePage and Country from the Suppliers table sorted by 
--Country in descending order and then by CompanyName in ascending order.
--select CompanyName,Fax,Phone,HomePage,Country from Suppliers
--	order by Country desc, CompanyName

--6. Create a report showing all the company names and contact names of 
--Northwind's customers in Buenos Aires.
--select CompanyName,ContactName from Customers where City='Buenos Aires'

--7. Create a report showing the product name, unit price and quantity 
--per unit of all products that are out of stock.
--select ProductName,UnitPrice,QuantityPerUnit from Products where UnitsInStock=0

--8. Create a report showing the order date, shipped date, customer id, and freight 
--of all orders placed on May 19, 1997.
--select OrderDate,ShippedDate,CustomerID,Freight from Orders where OrderDate='19970519'

--9. Create a report showing the first name, last name, and country of 
--all employees not in the United States.
--select FirstName,LastName,Country from Employees where country != 'USA'

--10. Create a report that shows the employee id, order id, customer id, required date, and shipped date of 
--all orders that were shipped later than they were required.
--select EmployeeID,OrderID,CustomerID,RequiredDate,ShippedDate from Orders
--	where ShippedDate is null

--11. Create a report that shows the city, company name, and contact name of all customers who are in 
--cities that begin with "A" or "B."
--select City,CompanyName,ContactName from Customers where City like 'A%' or City like 'B%'

--12. Create a report that shows all orders that have a freight cost of more than $500.00.
--select OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry 
--	from Orders where Freight > 500

--13. Create a report that shows the product name, units in stock, units on order, and 
--reorder level of all products that are up for reorder 
--select ProductName,UnitsInStock,UnitsOnOrder,ReorderLevel from Products order by ReorderLevel

--14. Create a report that shows the company name, contact name and fax number of all customers 
--that have a fax number.
--select CompanyName,ContactName, Fax from Customers where Fax is not null

--15. Create a report that shows the first and last name of all employees who do not report to anybody
--select FirstName,LastName from Employees where ReportsTo is null

--16. Create a report that shows the company name, contact name and fax number of all customers 
--that have a fax number. Sort by company name.
--select CompanyName,ContactName,Fax from Customers where Fax is not null order by CompanyName

--17. Create a report that shows the city, company name, and contact name of all customers 
--who are in cities that begin with "A" or "B." Sort by contact name in descending order 
--select City,CompanyName,ContactName from Customers 
--where City like 'A%' or City like 'B%' order by ContactName desc

--18. Create a report that shows the first and last names and birth date of 
--all employees born in the 1950s.
--select FirstName,LastName from Employees where BirthDate between '19500101' and '19591231'

--19. Create a report that shows the product name and supplier id for all products supplied 
--by Exotic Liquids, Grandma Kelly's Homestead, and Tokyo Traders.
--Hint: you will need to first do a separate SELECT on the Suppliers table to 
--find the supplier ids of these three companies.
select ProductName,s.SupplierID from Products p inner join Suppliers s on p.SupplierID=s.SupplierID where s.CompanyName='Exotic Liquids' or s.CompanyName='Grandma Kelly'+char(39)+'s Homestead' or s.CompanyName='Tokyo Traders'

--20. Create a report that shows the shipping postal code, order id, and order date 
--for all orders with a ship postal code beginning with "02389".
--select ShipPostalCode,OrderID,OrderDate from Orders where ShipPostalCode like '02389%'

--21. Create a report that shows the contact name and title and the company name 
--for all customers whose contact title does not contain the word "Sales".
--select ContactName,ContactTitle from Customers where ContactTitle not like '%Sales%'

--22. Create a report that shows the first and last names and cities of employees 
--from cities other than Seattle in the state of Washington.
--select FirstName,LastName from Employees where City !='Seattle'

--23. Create a report that shows the company name, contact title, city and country 
--of all customers in Mexico or in any city in Spain except Madrid.
--select CompanyName,ContactTitle,Country from Customers where Country='Mexico' or Country='Spain' and City !='Madrid'

--24
--select FirstName+' '+LastName+' can be reach at x'+Extension from Employees

--25. Create a report that shows the units in stock, unit price, the total price value of all units 
--in stock, the total price value of all units in stock rounded down, and the total price value 
--of all units in stock rounded up. Sort by the total price value descending.

--select ProductName,UnitsInStock,UnitPrice,floor(UnitsInStock*UnitPrice) as 'total price value of all units in stock rounded down',CEILING(UnitsInStock*UnitPrice)as 'total price value of all units in stock rounded up'
--	from Products
--		order by [total price value of all units in stock rounded down] desc, [total price value of all units in stock rounded up] desc

--26. Create a report that shows the first and last names and birth month (as a string) 
--for each employee born in the current month.
--select FirstName,LastName,cast(month(BirthDate) as varchar) as month from Employees where MONTH(BirthDate)=MONTH(GETDATE())

--27. Create a report that shows the contact title in all lowercase letters of each customer contact.
--select ContactName,lower(ContactTitle) from Customers

--28 -- clue dari customers, ada hubungan dari 27
--select CompanyName from Customers

--29. Create a report that shows all products by name that are in the Seafood category.
--select ProductName from Products p inner join Categories c on p.CategoryID=c.CategoryID where CategoryName='Seafood'

--30. Create a report that shows all companies by name that sell products in CategoryID 8.
--select distinct CompanyName from Suppliers s inner join Products p on s.SupplierID=p.SupplierID inner join Categories c on p.CategoryID=c.CategoryID where c.CategoryID=8

--31. Create a report that shows all companies by name that sell products in the Seafood category.
--select distinct CompanyName from Suppliers s inner join Products p on s.SupplierID=p.SupplierID inner join Categories c on p.CategoryID=c.CategoryID where c.CategoryName='Seafood'

--32. Create a report that shows the order ids and the associated employee names for orders 
--that shipped after the required date. It should return the following. There should be 37 rows returned.
--select e.FirstName,LastName,o.OrderID from Orders o inner join Employees e on e.EmployeeID=o.EmployeeID  where ShippedDate>RequiredDate order by LastName   

--33. Create a report that shows the total quantity of products (from the Order_Details table) ordered. 
--Only show records for products for which the quantity ordered is fewer than 200. 
--The report should return the following 5 rows.
--select p.ProductName,sum(Quantity) as totalunits from[Order Details] od inner join Products p on p.ProductID=od.ProductID 
--	group by p.ProductName having sum(Quantity)<200

--34. Create a report that shows the total number of orders by Customer since December 31, 1996. 
--The report should only return rows for which the NumOrders is greater than 15. The report 
--should return the following5 rows.
select c.CompanyName,count(*) as 'totalorder' from Orders o inner join Customers c on o.CustomerID=c.CustomerID where o.OrderDate>'19961231'  group by c.CompanyName  having count(*)>15 order by totalorder desc


--35. Create a report that shows the company name, order id, and total price of all products of 
--which Northwind has sold more than $10,000 worth. There is no need for a GROUP BY clause in this report.
--select * from Products p inner join Suppliers s on p.SupplierID=s.SupplierID where p.ProductID=38
--	(select distinct ProductID from [Order Details] where Quantity*UnitPrice>10000)

--select s.CompanyName,od.Quantity*od.UnitPrice from Suppliers s inner join Products p on s.SupplierID=p.ProductID inner join [Order Details] od on p.ProductID=od.ProductID where od.Quantity*od.UnitPrice>10000
--select CompanyName from Customers where CustomerID in(
--	select distinct CustomerID from Orders o inner join [Order Details] od on o.OrderID=od.OrderID  where UnitPrice*Quantity>10000
--	)

--select  c.CompanyName,od.OrderID,od.Quantity*od.UnitPrice-Discount*(od.Quantity*od.UnitPrice) as totalorders 
--	from [Order Details] od inner join Orders o on o.OrderID=od.OrderID inner join Customers c 
--		on c.CustomerID=o.CustomerID where od.Quantity*od.UnitPrice-Discount*(od.Quantity*od.UnitPrice) >10000
--			order by totalorders desc