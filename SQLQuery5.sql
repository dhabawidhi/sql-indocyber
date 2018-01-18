--select orderid, custid, orderdate
--	from Sales.Orders order by orderdate

--select orderid, custid, YEAR(orderdate) as orderyear
--	from Sales.Orders
--	Order by orderyear

select orderid, custid, orderdate 
	from Sales.Orders order by orderdate desc