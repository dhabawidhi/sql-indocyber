use Northwind
--35. Create a report that shows these columns:
--•	Calculated column with the alias groupid (use the GROUPING_ID function with the order year and 
--order month as the input parameters)
--•	Year of the orderdate column as orderyear
--•	Month of the orderdate column as ordermonth
--•	Total sales amount using quantity multiply unitprice
--•	Since year and month form a hierarchy, return all interesting grouping sets based on the orderyear 
--and ordermonth columns and sort the result by groupid, orderyear, and ordermonth.
--•	The report should return the following 27 rows 
--select GROUPING_ID(YEAR(OrderDate),MONTH(OrderDate)) as groupid,YEAR(OrderDate) as orderyear, MONTH(OrderDate) as ordermonth, cast(ceiling((SUM(Quantity*UnitPrice)-SUM(Quantity*UnitPrice*Discount))*100)/100 as money) as salesvalue
--	from Orders o inner join [Order Details] od on o.OrderID=od.OrderID 
--		group by rollup(
--			YEAR(OrderDate),MONTH(OrderDate))
--				order by groupid,orderyear,ordermonth

--36. Create a report that shows for each customer the total sales amount for each product
--category. Display each product category as a separate column. Here is how to accomplish this task:
--•	Create a CTE named SalesByCategory to retrieve the customerid column from the Orders table as a 
--calculated column based on the quantity and unitprice columns and the categoryname column 
--from the table Categories. Filter the result to include only orders in the year 1998.
--•	You will need to JOIN tables Orders, [Order Details], Products, and Categories.
--•	Write a SELECT statement against the CTE that returns a row for each customer (customerid) 
--and a column for each product category, with the total sales amount for the current customer 
--and product category.
--•	Display the following product categories: Beverages, Condiments, Confections, [Dairy Products], 
--[Grains/Cereals], [Meat/Poultry], Produce, and Seafood.
--•	The report should return the following 81 rows
;with SalesByCategory
as
(
select o.CustomerID,c.CategoryName as categoryname,sum(od.Quantity*od.UnitPrice) as totalamounts
	from Orders o inner join [Order Details] od on o.OrderID=od.OrderID
	inner join Products p on od.ProductID=p.ProductID
	inner join Categories c on p.CategoryID=c.CategoryID
	where o.OrderDate between '19980101' and '19981231' 
		group by o.CustomerID,c.CategoryName
)

select CustomerID,Beverages, Condiments, Confections, [Dairy Products], [Grains/Cereals], [Meat/Poultry], Produce, Seafood
	from SalesByCategory
	pivot(sum(totalamounts) for categoryname
	in (Beverages, Condiments, Confections, [Dairy Products], [Grains/Cereals], [Meat/Poultry], Produce, Seafood)) as pvt


--Create a report that shows top 3 products (based on total sales amount) that sold for each order year 
--in each country.

--select distinct ProductID, orderyear,shipcountry, total from
--(
--select distinct orderyear, ProductID,o2.ShipCountry,total from Orders o2 cross apply
--	(
--	select top(3) YEAR(o.OrderDate) as orderyear,od.ProductID,o.ShipCountry,sum(Quantity) as total 
--		from Orders o inner join [Order Details] od on o.OrderID=od.OrderID
--			where o.ShipCountry=o2.ShipCountry 
--				group  by  YEAR(o.orderdate),od.ProductID,o.ShipCountry
--					order by total desc
--	) x 
--)y
--order by ShipCountry,orderyear

-- 36 v2
--;with SalesByCategory
--as
--(
--select o.CustomerID,c.CategoryName as categoryname,sum(od.Quantity*od.UnitPrice) as totalamounts
--	from Orders o inner join [Order Details] od on o.OrderID=od.OrderID
--	inner join Products p on od.ProductID=p.ProductID
--	inner join Categories c on p.CategoryID=c.CategoryID
--	where o.OrderDate between '19980101' and '19981231' 
--		group by o.CustomerID,c.CategoryName
--)

--select CustomerID,category,qty from
--(
--select CustomerID,Beverages, Condiments, Confections, [Dairy Products], [Grains/Cereals], [Meat/Poultry], Produce, Seafood
--	from SalesByCategory
--	pivot(sum(totalamounts) for categoryname
--	in (Beverages, Condiments, Confections, [Dairy Products], [Grains/Cereals], [Meat/Poultry], Produce, Seafood)) as pvt
--) x
--	UNPIVOT
--   (qty FOR category IN 
--      (Beverages, Condiments, Confections, [Dairy Products], [Grains/Cereals], [Meat/Poultry], Produce, Seafood)
--	)AS unpvt order by category


--Select top(20)percent employeeid from Employees order by EmployeeID

--select count([bad seller]) ,count([good seller]),COUNT([best seller]),count([star seller]) from(
--select null as temp,case 
--	when kategori<50 then count(*) end as 'bad seller',
--	case 
--	when kategori<100 and kategori>50 then count(*) end as 'good seller',
--	case 
--	when kategori<200 and kategori >100 then count(*) end as 'best seller',
--	case 
--	when kategori>200 then count(*) end as 'star seller'
--	from(

--select EmployeeID,COUNT(*) as kategori from Orders o group by EmployeeID
--) x group by kategori
--)y group by temp