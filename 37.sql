use Northwind
--37. Create a report that shows top 3 products (based on total sales amount) that sold for each order year 
--in each country.
select distinct orderyear,country,x.ProductID,p.ProductName,totalsalesamount from Orders o2 
cross apply(

	select top(3) YEAR(OrderDate) as orderyear,ProductID, ShipCountry as country, 
	sum(od.Quantity*UnitPrice) as totalsalesamount 
		from Orders o inner join [Order Details] od on o.OrderID=od.OrderID 
			where o.ShipCountry=o2.ShipCountry
				group by YEAR(OrderDate),ShipCountry,ProductID 
					order by totalsalesamount desc
	) x inner join Products p on x.ProductID=p.ProductID
	order by orderyear,country

--38. With question number 37, the IT Department has some additional requirements:
--•	Encapsulates the previous T-SQL code in a stored procedure named GetTopProductSoldByYearCountry.
--•	The result can be filters by Order Year and Country. The top product rows also can be set dynamically 
--in that stored procedure. 
--•	Create a paging in which the stored procedure caller can define which page to be retrieved and 
--how many rows should be retrieved in a page.
--•	Implements error handling

--use Northwind
--create procedure dbo.GetTopProductSoldByYearCountry

--@year int, @country varchar, @top int
--as
--select distinct orderyear,country,ProductID,totalsalesamount from Orders o2 cross apply(
--	select top(@top) YEAR(OrderDate) as orderyear,ProductID, ShipCountry as country, sum(od.Quantity*UnitPrice) as totalsalesamount 
--		from Orders o inner join [Order Details] od on o.OrderID=od.OrderID 
--			where o.ShipCountry=@country and YEAR(OrderDate)=@year
--				group by YEAR(OrderDate),ShipCountry,ProductID 
--					order by totalsalesamount desc
--	) x 
--	order by orderyear

--exec dbo.GetTopProductSoldByYearCountry @year=1997, @country=N'Austria', @top=3

--create procedure dbo.GetTopProductPriceByCustomer -- buat update procedure
--	@custid int=null,
--	@top int =null
--as
--select sc.custid,pp.productid,pp.productname,totalsalesamount,
--	FIRST_VALUE(totalsalesamount) over(partition by custid order by totalsalesamount desc 
--		range between unbounded preceding and unbounded following) as firstval,
--	LAST_VALUE(totalsalesamount) over(partition by custid order by totalsalesamount desc 
--		range between unbounded preceding and unbounded following) as lastval,
--	sum(totalsalesamount) over(partition by custid order by totalsalesamount desc
--	rows between unbounded preceding and current row) as runsalesamount,
--	LAG(totalsalesamount) over(partition by custid order by totalsalesamount) as lag,
--	LEAD(totalsalesamount) over(partition by custid order by totalsalesamount) as lead
--	from Sales.Customers sc cross apply
--	(	
--	select top(isnull(@top,3)) sod.productid,sum(qty*unitprice) as totalsalesamount 
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--		where so.custid=sc.custid
--			group by sod.productid
--				order by totalsalesamount desc
--	)x inner join Production.Products pp on x.productid=pp.productid
--	where sc.custid=@custid or sc.custid is null
--	order by custid

--exec dbo.GetTopProductPriceByCustomer @custid=1, @top=3
