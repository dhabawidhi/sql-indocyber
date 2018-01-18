--select GROUPING_ID(Category) as grpCategory,
--		GROUPING_ID(Cust) as grpCust,
--		Category, Cust, SUM(Qty) As totalqty
-- from Sales.CategorySales
--	group by rollup(Category, Cust)
--	order by Category, Cust

--declare @pageNo as int,
--			@rowsPerPage int

--	set @pageNo=2
--	set @RowsPerPage=3

--	select orderid, custid, orderdate
--		from Sales.Orders
--			order by orderdate, orderid desc
--				offset (@pageNo-1)*@rowsPerPage rows fetch next 3 rows only
--select category, [2006],[2007],[2008] into  Sales.Pivotcategorysales
	
--	from(
--		select category, qty, orderyear
--			from Sales.CategoryQtyYear
--		) as d
--		pivot(sum(qty) for orderyear
--			in([2006],[2007],[2008])) as pvt
--		order by Category
--select category,orderyear,quantity from
--(select category,[2006],[2007],[2008] from Sales.Pivotcategorysales) x
--unpivot(quantity for orderyear in
--		([2006],[2007],[2008])) as unpvot