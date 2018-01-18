--select categoryname from Production.Categories 
--	where categoryname like 'be%'

--pake keylookup

--select categoryname,description from Production.Categories with (index(NC_categoryname))
--	where categoryname like 'be%'

--duplicate table
--select * into Sales.OrderDetails2
--	from Sales.OrderDetails

--select * from Sales.OrderDetails2

--update Sales.OrderDetails
--	set chksum=CHECKSUM(orderid,productid,unitprice,qty,discount)

--select * from Sales.OrderDetails

--update Sales.OrderDetails2
--	set chksum=CHECKSUM(orderid,productid,unitprice,qty,discount)

--select sod.orderid from Sales.OrderDetails sod inner join Sales.OrderDetails2 sod2 on sod.chksum=sod2.chksum
--	where sod.orderid=10248

--DBCC freeProCache

--select GETDATE()
--select empid,lastname,birthdate from HR.Employees where (YEAR(GETDATE())-YEAR(birthdate))>45

--select empid,lastname,birthdate from HR.Employees where birthdate < DATEADD(YEAR,-45,GETDATE())

--select orderid, orderdate, empid,sc.custid 
--	from Sales.Customers sc inner join Sales.Orders so on sc.custid=so.custid where sc.contactname like 'i%'

--select orderid,orderdate, empid, custid from (
--	select custid as idcust from Sales.Customers where contactname like 'i%'
--) x inner join Sales.Orders so on so.custid=x.idcust


--orderid,orderdate, empid,custid from sales.order, namun dari tanggal order terakhir

--select orderid, orderdate, empid,custid
--	from Sales.Orders where orderdate=(select max(orderdate) from Sales.Orders)

--select YEAR(so.orderdate),productid,sum(qty*unitprice)/x.total from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--	inner join
--	(select YEAR(orderdate) as tahun,sum(qty*unitprice) as total from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--	where so.orderdate between '20080101' and '20081231'
--		group by YEAR(orderdate)
--	) x on YEAR(x.tahun)=YEAR(so.orderdate)
--	where so.orderdate between '20080101' and '20081231' group by sod.productid

--select sum(qty*unitprice) as total from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--	where so.orderdate between '20080101' and '20081231'
--		group by YEAR(orderdate)

--select so.orderid,sum(qty*unitprice) as totalsalesamount,sum(qty*unitprice) / (select sum(qty*unitprice) as total from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--	where so.orderdate between '20080101' and '20081231'
--		group by YEAR(orderdate)) * 100 as persen
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid
--	where so.orderdate between '20080101' and '20081231' group by so.orderid

--select a.tahun from 
--(
--	select YEAR(so.orderdate) as tahun,SUM(sod.qty*sod.unitprice) as totalsales 
--		from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--			group by YEAR(so.orderdate)
--) a left join
--(
--	select YEAR(so.orderdate) as tahun,SUM(sod.qty*sod.unitprice) as totalsales 
--		from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--			group by YEAR(so.orderdate)
--) b on a.tahun=b.tahun+1
--order by a.tahun

select a.tahun, a.totalsales,lag(a.totalsales) over(order by a.tahun) as previoustotalsales, (totalsales+lag(a.totalsales) over(order by a.tahun))/totalsales*100 as benefitpercentage from
(
	select YEAR(so.orderdate) as tahun,SUM(sod.qty*sod.unitprice) as totalsales 
		from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
			group by YEAR(so.orderdate)
) a 