use tsql2012
select so.empid, sum(sod.qty*sod.unitprice) as 'total sales amount 2008'
	from  Sales.Orders so inner join Sales.OrderDetails sod
		on so.orderid=sod.orderid
			where so.orderdate between '20080101' and '20081231'
				group by empid