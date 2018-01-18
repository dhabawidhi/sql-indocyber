use TSQL2012
select top(10) so.custid,qty*unitprice as 'totalsalesamount'
	from Sales.OrderDetails sod inner join Sales.Orders so on sod.orderid=so.orderid
		where qty*unitprice > 10000