--cross join
--select c.companyname, o.orderdate
--from sales.Customers c, Sales.Orders o
 
-- join ANSI 92
--select o.orderid, o.orderdate, od.productid,od.discount
--	from Sales.Orders as o join Sales.OrderDetails as od on o.orderid=od.orderid
--	where productid=11
-- inner join syntax

--select c.companyname,o.orderdate
--	from sales.Customers c join Sales.Orders o on c.custid=o.custid

-- join pake where
--select c.companyname, o.orderdate
--	from sales.Customers c , Sales.Orders o where c.custid=o.custid

--select c.companyname, o.orderdate
--from sales.customers as c join
--	(select custid as customerID, orderdate from Sales.Orders) as o
--	on c.custid=o.customerID
--	where c.custid=12


--bisa ditambahin comparison operator (and, or, not) tergantung kebutuhan
--select c.companyname, o.orderdate
--from sales.customers as c join
--	Sales.Orders o
--	--(select custid as customerID, orderdate from Sales.Orders) as o
--	on c.custid=o.custid or c.country<>o.shipcountry
--	where c.custid=12
