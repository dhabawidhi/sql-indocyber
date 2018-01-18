--select companyname,country
--	from Sales.Customers

--select unitprice,qty,(unitprice*qty) from Sales.OrderDetails
--select empid, lastname, hiredate,year(hiredate) from HR.Employees

--select distinct(country) from Sales.Customers

--select distinct companyname, country from Sales.Customers

--select distinct custid,shipcity,shipcountry from Sales.Orders -- hasilnya sama karena order id itu primary key
--select orderid, quantity = unitprice
--	from Sales.OrderDetails

--select orderid, unitprice, qty as quantity from Sales.OrderDetails order by quantity

--select orderid, unitprice, qty as quantity from Sales.OrderDetails where quantity >1 -- bakal error

--select productid, unitprice as price, price ( qty as total from sales.OrderDetails -- error karena aliasnya di select

--select productid, productname, categoryid,
--	case categoryid
--		when 1 then 'beverages'
--		when 2 then 'candiments'
--		when 3 then 'confections'
--	end as categoryname
--	from production.Products

select productnumber, name, "price range"= 
	case
		when listprice=0 then 'mfg item - not for resale'
		else 'over $1000'
	end
	from Production.Products
	order by productname;