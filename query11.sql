--select orderid, custid, orderdate
--	from Sales.Orders order by orderdate

--select orderid, custid, YEAR(orderdate) as orderyear
--	from Sales.Orders
--	Order by orderyear

--select orderid, custid, orderdate 
--	from Sales.Orders order by orderdate desc

--SELECT contactname, country from sales.Customers where country = N'Spain'

--select orderid, orderdate from Sales.Orders where orderdate > '20070101'

--select orderid, custid, orderdate from Sales.Orders where orderdate >='20070101' and orderdate < '20080101';

--SELECT custid,contactname, country from sales.Customers where country in ('UK', 'Spain')

--SELECT custid,contactname, country from sales.Customers where not( country in ('UK', 'Spain'))
--SELECT custid,contactname, country from sales.Customers where  country between 'A' and 'F'

-- logic bisa digabung-gabungkan

--select distinct month(orderdate) from sales.orders
--	where (orderdate between '20070101' and '20071231' and not (orderdate between '20070801' and '20070831'))

--select * from Sales.Orders where YEAR(orderdate)=2008 -- jangan pake indexscan, tapi mendingan pake between

-- jangan pake function di where

--select * from Sales.Orders where orderdate between '20080101' and '20081231'

select substring(contactname,3,3), * from sales.customers where substring(contactname,3,1)=N's'
