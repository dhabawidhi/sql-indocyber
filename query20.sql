--select country, region, city from hr.Employees
--union
--select country, region, city from Sales.Customers

--select country, region, city from hr.Employees
--except
--select country, region, city from Sales.Customers

--select * from Production.Products as s
--	cross apply dbo.

-- contoh cross apply

--select * from Production.Products pp cross apply
--(
--	select * from Production.Suppliers ps
--	where pp.supplierid=ps.supplierid
--) a

--select * from Production.Products pp inner join production.Suppliers ps on pp.supplierid=ps.supplierid

--select top(3) productid
--	from Production.Products
--		where supplierid=1
--			order by unitprice desc

select s.supplierid, s.companyname from Production.Suppliers s cross apply
(
	select top(3) productid,productname,unitprice
	from Production.Products
		where supplierid=s.supplierid
			order by unitprice desc

) a