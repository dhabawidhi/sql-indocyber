
use tsql2012
--select orderid, productid, unitprice,qty
--	from sales.OrderDetails
--		where orderid =
--			(select max(orderid) as lastorder from Sales.Orders)

set statistics time on
--select custid, orderid
--	from Sales.Orders
--		where custid in(
--			select custid
--				from Sales.Customers
--					where country=N'Mexico')

--select custid,orderid from
--	Sales.order

--select orderid, empid, orderdate
--	from Sales.Orders as o1
--		where orderdate = 
--			( select max(orderdate)
--				from sales.Orders as o2
--				where o2.empid=o1.empid)
--			order by empid, orderdate

--select empid, max(orderdate)
--	from Sales.Orders as o1
--		where orderdate=
--			( select max(orderdate)
--				from Sales.Orders
--			) order by empid

--select o1.orderid,o1.empid,o1.orderdate
--	from Sales.Orders o1 inner join Sales.Orders o2 on o1.empid=o2.empid
--		where o1.empid=o2.empid
--			group by o1.empid
--				having MAX(o1.orderdate)

--select o1.empid,o1.orderdate,o1.orderid
--	from Sales.Orders o1 inner join
--	(
--		select empid, max(orderdate) as maxorderdate
--			from Sales.Orders
--			group by empid
--	) as o2 on o1.empid=o2.empid
--		and o1.orderdate = o2.maxorderdate
--		order by o1.empid, o1.orderdate
		
--select custid, orderid, orderdate
--	from Sales.Orders as outerorders
--		where orderdate=
--		( select max(orderdate
--		)

--select custid, companyname
--	from Sales.Customers c
--		where exists(
--			select * 
--			from Sales.Orders o
--			where c.custid=o.custid)

--select custid, companyname from sales.customers as c
--	where not exists(
--		select * from Sales.orders as o
--		where c.custid=o.custid)

--select empid, lastname
--	from hr.Employees e
--		where exists(select * from Sales.Orders o
--			where o.empid=e.empid)

--select empid, lastname
--from hr.Employees as e
--where (
--	)

--select distinct e.empid, e.lastname
--from hr.Employees as e left join  Sales.Orders o
--	on e.empid =o.empid

--select distinct orderid, empid, orderdate,
--	(select max(orderdate) from sales.orders o2 where o1.empid=o2.empid) as maxorderdate
--	from sales.orders as o1

--select * into hr.employees_sal from HR.Employees
--alter table hr.employees_sal
--add salary money null

--begin tran
--update hr.employees_sal 
--	set salary = abs(checksum(lastname))
--commit tran

--select * from HR.employees_sal

select * from from hr.employees_sal
	where salary > any
	(
		select salary
		from hr.employees_sal
		where city ='london'
	)

set statistics time off


--set stati