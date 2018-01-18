--create view HR.EmpPhoneList
--as
--select * from HR.Employees



--create function Sales.fn_LineTotal (@orderid INT)
--Returns table
--as
--return
--	 select orderid,
--		cast((qty*unitprice*(1-discount)) as
--			decimal(8,2)) as line_total
--		from Sales.OrderDetails
--		where orderid = @orderid

--select orderid,productid, unitprice, qty, discount, line_total from Sales.f

--select orderyear, count(distinct custid) as cust_count
--	from(
--		select year(orderdate) as orderyear, custid
--			from Sales.Orders
--	) as derived_year
--	group by orderyear

--select orderyear, count(distinct custid) as cust_count
--	from(
--		select year(orderdate)	
--	)

--declare @emp_id int=9
--select orderyear, count(distinct custid) as cust_count
--from (
--	select year(orderdate) as orderyear, custid
--	from Sales.Orders
--	where empid

--select orderyear, cust_count
--from(
--	select orderyear,count(distinct custid) as cust_count
--	from(select year(orderdate) as orderyear, custid)
--		from sales
--)
--)
--select orderyear, count(distinct cus
--(select year(orderdate) as orderyear from Sales.Orders) as derived_table_1

--with CTE_year as
-- (
--	select year(orderdate) as orderyear, custid from Sales.Orders
--	)
--select orderyear, count(distinct custid) as cust_count
--	from CTE_year
--	group by orderyear

--select * from CTE_YEAR -- CTE cuman bisa dipake sekali aja

with emp
as
(	
	
	select empid, firstname, lastname, title, mgrid, 0 as lv1 
		from HR.Employees e1 where e1.mgrid is null
	union all
	select e1.empid, e1.firstname, e1.lastname, e1.title, e1.mgrid, e2.lv1+1 
		from hr.Employees e1 inner join EMP e2 on e1.mgrid= e2.empid
)
select * from emp