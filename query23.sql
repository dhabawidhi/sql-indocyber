use TSQL2012
--select Category, Qty, Orderyear

--	from Sales.CategoryQtyYear

--select custid, ordermonth,qty,
--	sum(qty) over(partition by custid)
--	as totalbycust
--from Sales.CustOrders

----select * from sales.CustOrders where custid=1

--select so.custid, so.orderdate, sod2.qty, jumlah from Sales.Orders so inner join (
--	select so.custid as customerid,sum(sod.qty) as jumlah from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by so.custid
--	)a on a.customerid=so.custid inner join Sales.OrderDetails sod2 on so.orderid=sod2.orderid
--	order by so.custid

--select * from Productio.

--select productid,unitprice, dense_rank() over(order by unitprice desc) as price_dense_rank, rank() over(order by unitprice desc) as price_rank 
--	from Production.Products order by price_dense_rank

--select CatID, CatName, ProdName, UnitPrice,
--	NTILE(7) Over(PARTITION By CatID Order by UnitPrice DESC) as NT 
--		from Production.CategorizedProducts
--			order by CatID, NT

--select * from 
--	(
--		select CatID, CatName, ProdName, UnitPrice,
--			NTILE(7) Over(PARTITION BY CatID order by Unitprice desc) as NT
--		from Production.CategorizedProducts
--	)a
--	where NT=1

select employee, orderyear, totalsales as currentsales, 
	LAG(totalsales, 1,0)
	--LEAD(totalsales, 1, 0)
	--FIRST_VALUE(totalsales)
	--LAST_VALUE(totalsales)
	over (partition by employee
		order by orderyear)
			as previousyearssales
	from Sales.OrdersByEmployeeYear
	order by employee, orderyear


-- soal nomor 1
--select orderid, orderdate, val, ROW_NUMBER() over(order by orderdate desc) as rowno from Sales.OrderValues

-- soal nomor 2
--select orderid, orderdate, custid, val, rank() over(order by val) as orderrank from
--	Sales.OrderValues

--nomor 3
--select custid, val, year(orderdate) as orderyear, 
--	rank() over(order by custid,year(orderdate), val desc) as orderrankno  
--	from Sales.OrderValues


-- buat orderrankno < 3


--select * from
--(
--	select custid, val, year(orderdate) as orderyear, 
--		rank() over(partition by custid, year(orderdate) order by val desc) as orderrankno  
--			from Sales.OrderValues
--) a where a.orderrankno <=2