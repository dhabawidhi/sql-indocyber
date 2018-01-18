select so.custid,count(custid) as 'total order',max(so.orderdate),sum(sod.qty*sod.unitprice) as 'total sales amount'
	from Sales.Orders so inner join Sales.OrderDetails sod
		on so.orderid=sod.orderid
			group by so.custid
				having count(custid)>25