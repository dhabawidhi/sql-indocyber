alter procedure dbo.GetTopProductSoldByYearCountry

	@year int=null, @country nvarchar(15)=null, @top int=null
	as
	select distinct orderyear,country,x.ProductID,p.ProductName,totalsalesamount from Orders o2 cross apply(
		select top(ISNULL(@top,3)) YEAR(OrderDate) as orderyear,ProductID, ShipCountry as country, sum(od.Quantity*UnitPrice) as totalsalesamount 
			from Orders o inner join [Order Details] od on o.OrderID=od.OrderID 
				where o.ShipCountry=ISNULL(@country,o2.ShipCountry) and YEAR(OrderDate)=ISNULL(@year,YEAR(o2.orderdate))
					group by YEAR(OrderDate),ShipCountry,ProductID 
						order by totalsalesamount desc
		) x inner join Products p on x.ProductID=p.ProductID
		order by orderyear,country

begin try
	exec dbo.GetTopProductSoldByYearCountry
end try
begin catch
	select
		ERROR_NUMBER() as ERROR_NUMBER,
		ERROR_MESSAGE() as ERROR_MESSAGE
end catch
