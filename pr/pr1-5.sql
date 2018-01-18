use TSQL2012
--nomor1
select top(10) so.custid,qty*unitprice as 'totalsalesamount'
	from Sales.OrderDetails sod inner join Sales.Orders so on sod.orderid=so.orderid
		where qty*unitprice > 10000

--nomor2
--select so.empid, sum(sod.qty*sod.unitprice) as 'total sales amount 2008'
--	from  Sales.Orders so inner join Sales.OrderDetails sod
--		on so.orderid=sod.orderid
--			where so.orderdate between '20080101' and '20081231'
--				group by empid

--nomor3a
--select so.empid, sum(sod.qty*sod.unitprice)
--	from  Sales.Orders so inner join Sales.OrderDetails sod
--		on so.orderid=sod.orderid
--			where (so.orderdate between '20080101' and '20081231')
--				group by empid
--				 having sum(sod.qty*sod.unitprice) > 10000

--nomor3b
--select so.empid, sum(sod.qty*sod.unitprice)
--	from  Sales.Orders so inner join Sales.OrderDetails sod
--		on so.orderid=sod.orderid
--			where (so.orderdate between '20080101' and '20081231')
--				group by empid
--				 having empid = 3

--nomor4
--select so.custid,count(custid) as 'total order',max(so.orderdate) as 'last date',sum(sod.qty*sod.unitprice) as 'total sales amount'
--	from Sales.Orders so inner join Sales.OrderDetails sod
--		on so.orderid=sod.orderid
--			group by so.custid
--				having count(custid)>25