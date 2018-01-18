select empid,YEAR(orderdate) AS orderyear
	from Sales.Orders
	where custid=71 
	group by empid,YEAR(orderdate)
	--having count(empid) > 1
	order by empid

--select empid, count(empid) from Sales.Orders
--	group by empid