use TSQL2012

--create view Sales.CustGroups as
--select custid,choose(custid%3+1,N'A',N'B',N'C') as custgroup,country 
--	from Sales.Customers

--create view Sales.CategorySales
--as
--select category, [2006],[2007],[2008]
--from(
--	select category, qty, orderyear
--		from Sales.CategoryQtyYear
--	) as d
--	pivot(sum(qty) for orderyear
--		in([2006],[2007],[2008])) as pvt
--	order by Category

--select * from Sales.CategorySales

--select * from Sales.CategoryQtyYear

--select category,qty,orderyear
--	from Sales.CategorySales
--	unpivot(qty for orderyear in([2006],[2007],[2008]) as unpvt

--SELECT category,qty,orderyear
--FROM 
--   (SELECT * From Sales.CategorySales) p
--UNPIVOT
--   (qty FOR orderyear IN 
--      ([2006],[2007],[2008])
--)AS unpvt;

--select category,qty,orderyear
--from(
--	select category, qty, orderyear
--		from Sales.CategoryQtyYear
--	) as d
--	pivot(sum(qty) for orderyear
--		in([2006],[2007],[2008])) as pvt
--	UNPIVOT
--   (qty FOR orderyear IN 
--      ([2006],[2007],[2008])
--	)AS unpvt;

---- kalo gak pake pivot
--select category, [2006],2006 orderyear  from Sales.CategorySales
--union all
--select category, [2007],2007 orderyear  from Sales.CategorySales
--union all
--select category, [2008],2008 orderyear  from Sales.CategorySales

--create table [Sales].[pivotcategorysales]
--(
--	[category][nvarchar](15) not null,
--	[2006][int] null,
--	[2007][int] null,
--	[2008][int] null
--)
--go
--insert into  Sales.Pivotcategorysales
--	(category,[2006],[2007],[2008])
--	select category, [2006],[2007],[2008]
--	from(
--		select category, qty, orderyear
--			from Sales.CategoryQtyYear
--		) as d
--		pivot(sum(qty) for orderyear
--			in([2006],[2007],[2008])) as pvt
--		order by Category

--select category, qty, orderyear
--	from Sales.pivotcategorysales
--	unpivot(qty for orderyear in([2006],[2007],[2008])) as unpvt

--select category, cust, sum(qty) as totalqty -- grouping berdasarkan atribut category, custemer, terus totalnya
--from Sales.CategorySales
--group by
--grouping sets((category),(cust),())

--select category, cust, sum(qty) as totalqty
--	from Sales.CategorySales
--		group by rollup(category,cust)
--		order by category,cust

--select category, cust, sum(qty) as totalqty
--	from Sales.CategorySales
--		group by cube(category,cust)
--		order by category,cust

--select * from Sales.CategorySales

--select 
--grouping_id(category) as grpCat,
--GROUPING_ID(cust) as grpCust,
--Category, Cust, SUM(Qty) as TotalQty
--from Sales.CategorySales
--group by cube(category,Cust)

--create view Sales.CustGroups as
--select custid,choose(custid%3+1,N'A',N'B',N'C') as custgroup,country 
--	from Sales.Customers
--tulis statement select cust id, custgroup, country dari view tadi

--select custid,custgroup, country from Sales.CustGroups
;
--with cte
--as
--(
--	select custid, custgroup, country
--		from sales.custgroups
--)
--select country,a,b,c 
--		from cte as d
--		pivot(count(custid) for custgroup
--			in(a,b,c)) as pvt
--			--order by country

--select country, city,count(*) as count
--	from Sales.Customers
--		group by
--			grouping sets((country),(city),())
--select country, city,count(*) as count
--	from Sales.Customers
--		where city is not null
--			group by rollup(country,city)
--				order by count desc
--select top(3) country, count(*) as count
--	from Sales.Customers
--		group by country
--			order by count desc

--select top(3) city, count(*) as count
--	from Sales.Customers
--		group by city
--			order by count desc
--select negara,kota,count
--from
--(
--	select distinct country from Sales.Customers
--) a cross apply
--(
--	select top(3) country as negara,city as kota ,count(*) as count
--		from Sales.Customers sc
--			where sc.country=a.country
--				group by country,city
--					order by count desc
--) p

--select sys.parameters.name

select year(orderdate),month(orderdate),sum(qty*unitprice)
	from Sales.Orders o inner join sales.OrderDetails od on o.orderid=od.orderid
		group by rollup(year(orderdate),month(orderdate))