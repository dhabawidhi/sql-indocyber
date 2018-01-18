use tsql2012
--nomor 1
--select companyname,contactname,city,region,country from sales.Customers where 
--	country=(select country from sales.customers where custid=10)

-- nomor 2
--select orderid,custid,orderdate,empid from Sales.Orders 
--	where shipcountry=(
--	select country from Sales.Customers where custid=11)

--nomor 3

select top(1) a.productid,pp.productname
	from 
	(
		select sod.productid,sum(sod.qty) as maksimum from Sales.Orders so inner join Sales.OrderDetails sod
			on so.orderid=sod.orderid
				where so.orderdate between '20070101' and '20071231'
					group by sod.productid
	) as a inner join Production.Products pp on a.productid=pp.productid order by maksimum desc 
