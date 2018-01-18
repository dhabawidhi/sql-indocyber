use TSQL2012
--Author Dhaba Widhikari
-- self content
--1. nampilin orderid dan orderdate dari productid yang memiliki kategoriidnya 2
select so.orderid,so.orderdate from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
	where sod.productid in (
		select pp.productid from Production.Products pp inner join Production.Categories pc on pp.categoryid=pc.categoryid 
			where pc.categoryid=2
	)

-- corelated subquery
--2. karyawan mana yang bukan manager, terus barengan sama manager yang nanganin sales. Aneh
select orderid, o1.empid, orderdate
	from sales.orders as o1 inner join HR.Employees e1 on o1.empid=e1.empid
		where o1.orderdate=(select max(o2.orderdate) from sales.orders o2 where o2.empid=e1.mgrid)

--3. Nampilin companyname, dan contact name dari tabel order yang custidnya ada di table customer pada tahun 2008
select sc.companyname,sc.contactname from Sales.Customers  sc
	where sc.custid in (select distinct so.custid from Sales.Orders so where so.custid=sc.custid and so.orderdate between '20080101' and '20081231')