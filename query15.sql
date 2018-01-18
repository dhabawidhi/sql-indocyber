
--select avg(unitprice) as avg_price, min(qty) as min_qty, max(discount) as max_discount
--	from sales.OrderDetails

--select empid, YEAR(orderdate) as orderyear, count(custid) as all_custs, count(distinct custid) as unique_custs
--	from Sales.Orders
--		group by empid, YEAR(orderdate)

--selec avg(c2) as avgwithnulls, av

--select empid, count(*) as cnt
--	from Sales.Orders
--		group by empid

--select custid, count(*) as cnt from sales.Orders group by custid

select custid, count(*) as count_orders
	from Sales.Orders group by custid having count(*)>10