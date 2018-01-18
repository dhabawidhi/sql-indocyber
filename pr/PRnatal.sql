use TSQL2012

--nomor 1, baru bisa 1 level

--select empid,sum(totalsalesamount) from
--(
--	select e.mgrid as empid,SUM(totalsalesamount) as totalsalesamount from HR.Employees e inner join 
--	(
--		select so.empid,sum(sod.qty*sod.unitprice) as totalsalesamount from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by so.empid
--	) a on e.empid=a.empid
--		group by e.mgrid
--	union all
--	select e.empid as empid, totalsalesamount from HR.Employees e inner join 
--	(
 
--		select so.empid,sum(sod.qty*sod.unitprice) as totalsalesamount from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by so.empid
--	) a on e.empid=a.empid
--) b where empid is not null group by empid
	
---- nomor 2
---- yang ini buat setiap tahun 3 produk

----yang ini buat 2006 2007 3 produk, terus 2008 2 produk
--select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from Sales.Orders so2 cross apply(
--	select top(3) YEAR(so.orderdate) as tahun,sod.productid produksiid,SUM(qty) as kuantiti 
--		from Sales.Orders so  inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--			where YEAR(so.orderdate)=YEAR(so2.orderdate) and YEAR(so2.orderdate)<2008
--				group by YEAR(so.orderdate),sod.productid 
--					order by YEAR(so.orderdate),kuantiti desc
--) a group by tahun,produksiid
--union all
--select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from Sales.Orders so2 cross apply(
--	select top(2) YEAR(so.orderdate) as tahun,sod.productid produksiid,SUM(qty) as kuantiti 
--		from Sales.Orders so  inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--			where YEAR(so.orderdate)=2008 
--				group by YEAR(so.orderdate),sod.productid 
--					order by YEAR(so.orderdate), kuantiti desc
--) a group by tahun,produksiid
--	order by tahun,kuantiti desc

----nomor 3
---- yang ini buat setahun 3 produk
--select b.tahun,b.produkid,pp.productname,isnull(ps.region,'n/a') as region,b.kuantiti from Production.Products pp inner join Production.Suppliers ps on pp.supplierid=ps.supplierid inner join
--(
--	select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from Sales.Orders so2 cross apply(
--		select top(3) YEAR(so.orderdate) as tahun,sod.productid produksiid,SUM(qty) as kuantiti 
--		from Sales.Orders so  inner join Sales.OrderDetails sod on so.orderid=sod.orderid where YEAR(so.orderdate)=YEAR(so2.orderdate) group by YEAR(so.orderdate),sod.productid order by YEAR(so.orderdate),kuantiti desc
--	) a group by tahun,produksiid
--) b on pp.productid=b.produkid

-- yang ini buat 2006 2007 3 produk, 2008 2 produk	


--select b.tahun,b.produkid,pp.productname,city+','+ isnull(ps.region,'n/a')+','+country ,b.kuantiti from production.products pp inner join production.suppliers ps on pp.supplierid=ps.supplierid inner join
--(
--	select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from sales.orders so2 cross apply(
--		select top(3) year(so.orderdate) as tahun,sod.productid produksiid,sum(qty) as kuantiti 
--			from sales.orders so  inner join sales.orderdetails sod on so.orderid=sod.orderid 
--				where year(so.orderdate)=year(so2.orderdate) and year(so2.orderdate)<2008
--					group by year(so.orderdate),sod.productid 
--						order by year(so.orderdate),kuantiti desc
--	) a group by tahun,produksiid
--	union all
--	select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from sales.orders so2 cross apply(
--		select top(2) year(so.orderdate) as tahun,sod.productid produksiid,sum(qty) as kuantiti 
--			from sales.orders so  inner join sales.orderdetails sod on so.orderid=sod.orderid 
--				where year(so.orderdate)=2008 
--					group by year(so.orderdate),sod.productid 
--						order by year(so.orderdate), kuantiti desc
--	) a group by tahun,produksiid
--) b on pp.productid=b.produkid
--order by tahun,kuantiti desc

--nomor 3 bener

--select b.tahun,b.produkid,pp.productname,city+','+ isnull(ps.region,'n/a')+','+country ,b.kuantiti from production.products pp inner join production.suppliers ps on pp.supplierid=ps.supplierid inner join
--(
--	Select distinct YEAR(so2.orderdate), 
--		substring(
--			(
--				Select ','+so1.shipcountry  AS [text()]
--				From Sales.Orders so1 inner join Sales.OrderDetails sod on so1.orderid=sod.orderid
--				inner join
--				(
--					select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from sales.orders so2 cross apply(
--						select top(3) year(so.orderdate) as tahun,sod.productid produksiid,sum(qty) as kuantiti 
--							from sales.orders so  inner join sales.orderdetails sod on so.orderid=sod.orderid 
--								where year(so.orderdate)=year(so2.orderdate) and year(so2.orderdate)<2008
--									group by year(so.orderdate),sod.productid 
--										order by year(so.orderdate),kuantiti desc
--					) a group by tahun,produksiid
--				) x on x.produkid=sod.productid				
--				ORDER BY so1.orderdate
--				For XML PATH ('')
--			),1,100) [Students]
--		From Sales.Orders so2
	
--	union all
--	select tahun as tahun,produksiid as produkid,avg(kuantiti) as kuantiti from sales.orders so2 cross apply(
--		select top(2) year(so.orderdate) as tahun,sod.productid produksiid,sum(qty) as kuantiti 
--			from sales.orders so  inner join sales.orderdetails sod on so.orderid=sod.orderid 
--				where year(so.orderdate)=2008 
--					group by year(so.orderdate),sod.productid 
--						order by year(so.orderdate), kuantiti desc
--	) a group by tahun,produksiid
--) b on pp.productid=b.produkid
--order by tahun,kuantiti desc


-- bagi region
--declare @Test as varchar(max)

--	select @Test= CONCAT(@Test, IIF(region is null,'',region +','))
--	from
--	(
--		select distinct region
--		from Sales
--	)

--select left(@Text, len(@text)-1)
declare @Text as varchar(max)
	select @Text=CONCAT(@Text, region = ', ')
	from
	(
		select distinct region
		from Sales.Customers c inner join Sales.Orders o
			on c.custid=o.custid
		where
	)


--select tahun, cs.s from
--(
--	select YEAR(orderdate) as tahun, so.shipcountry as shipcountry from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--	union
--	select YEAR(orderdate) as tahun, so.shipcountry as shipcountry from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--) a 
--cross apply STRING_SPLIT(shipcountry,',') cs 
--declare @negara nvarchar(200)=select tahun,shipcountry from
--(
--	select YEAR(orderdate) as tahun, so.shipcountry as shipcountry from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--	union
--	select YEAR(orderdate) as tahun, so.shipcountry as shipcountry from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--) a 

--SELECT YEAR(orderdate), shipcountry + ', ' AS 'data()' 
--FROM Sales.Orders
--	group by YEAR(orderdate), shipcountry
--FOR XML PATH('')

--Select distinct YEAR(so2.orderdate), 
--    substring(
--        (
--            Select ','+so1.shipcountry  AS [text()]
--            From Sales.Orders so1 inner join Sales.OrderDetails sod on so1.orderid=sod.orderid
--            Where YEAR(so1.orderdate) = YEAR(so2.orderdate) and sod.productid=produksiid
--            ORDER BY so1.orderdate
--            For XML PATH ('')
--        ), 2, 1000) [Students]
--From Sales.Orders so2






--SELECT   shipcountry, [2006], [2007],[2008]
--FROM   
--(
--	select tahun,shipcountry from
--	(
--		select YEAR(orderdate) as tahun, so.shipcountry as shipcountry from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--		union
--		select YEAR(orderdate) as tahun, so.shipcountry as shipcountry from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--	) a
--)
--PIVOT
--(
--       a.shipcountry
--       FOR YEAR(orderdate) IN ( [2006], [2007], [2008])
--) AS P


