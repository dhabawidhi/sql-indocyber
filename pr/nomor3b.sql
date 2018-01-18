select so.empid, sum(sod.qty*sod.unitprice)
	from  Sales.Orders so inner join Sales.OrderDetails sod
		on so.orderid=sod.orderid
			where (so.orderdate between '20080101' and '20081231')
				group by empid
				 having empid = 3
