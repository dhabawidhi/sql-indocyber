-- Tulis query dan productid dan product name, dari tabel production dan product, tapi hanya produk yang terjual > 100
use TSQL2012
--select * from Production.Products
--select pp.productid,sum(qty) from Sales.OrderDetails sod inner join Production.Products pp on sod.productid=pp.productid where  group by pp.productid having sum(qty)>100
--select * from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.productid group by so.orderid
--select sod.productid,sum(qty) from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--	where YEAR(orderdate)=2008	
--		group by sod.productid having sum(qty)>100

--select distinct pp.productid,productname from Production.Products pp inner join(
--	select sod.productid,sum(sod.qty) as kuantiti from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--		group by sod.orderid,sod.productid
--			having sum(sod.qty)>100
--		) x on x.productid=pp.productid

-- query select untuk mengambil custid dan contact name dari tabel sales.customer, filter hasilnya hanya mengambil customer yang tidak memiliki order apa2

--select custid, contactname from Sales.Customers where custid not in(
--select distinct so.custid from Sales.Orders so)

-- tuliskan query untuk mengambil customerid dan contact name, terus lastorderdate yang merupakan hasil kalkulasi, dimana kalkuklasi adalah tanggal order terakhir dari customer

--select sc.custid,sc.contactname, lastorderdate from Sales.Customers sc left join(
--select custid,max(orderdate) as lastorderdate from Sales.Orders so group by custid
--)x on x.custid = sc.custid

--select sc.custid,sc.contactname, lastorderdate from Sales.Customers sc left join(
--select custid,max(orderdate) as lastorderdate from Sales.Orders so group by custid
--)x on x.custid = sc.custid

--select * from Sales.Customers sc inner join Sales.Orders sod on sc.custid=sod.custid
--	where 
-- select custid, dan contactname dari tabel customer, filter hasilnya yang hanya mengambil data customer yang mana ada order diatas 1 april 2008, dan harga produk lebih dari 100$

--select sc.custid,sc.contactname from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid inner join Sales.Customers sc on sc.custid=so.custid where sod.unitprice>=100 and so.orderdate>='20080401'

--select YEAR(so.orderdate) as year,sum(sod.qty*sod.unitprice) as totalsales, 
	--case 
	--	when YEAR(so.orderdate)%2006=0 then sum(sod.qty*sod.unitprice)
	--	when YEAR(so.orderdate)%2007=0 then lag(sum(sod.qty*sod.unitprice),1,0)over(order by YEAR(orderdate))+sum(sod.qty*sod.unitprice)
	--	when YEAR(so.orderdate)%2008=0 then lag(sum(sod.qty*sod.unitprice),2,0)over(order by YEAR(orderdate))+lag(sum(sod.qty*sod.unitprice),1,0)over(order by YEAR(orderdate))+sum(sod.qty*sod.unitprice)


	--end as runsales

--from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by YEAR(so.orderdate) order by year


--select q.tahun,q.totalsales,runsales from
--(
--select YEAR(so.orderdate) as tahun,sum(sod.qty*sod.unitprice) as totalsales
--from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by YEAR(so.orderdate)-- order by year
--) q inner join (
--	select x.tahun,sum(y.totalsales) as runsales from
--	(
--	select YEAR(so.orderdate) as tahun,sum(sod.qty*sod.unitprice) as totalsales
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by YEAR(so.orderdate)-- order by year
--	) x inner join
--	(
--	select YEAR(so.orderdate) as tahun,sum(sod.qty*sod.unitprice) as totalsales
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by YEAR(so.orderdate)-- order by year
--	) y on y.tahun<=x.tahun 
--	group by x.tahun 
--) p on q.tahun=p.tahun
--	order by tahun

--tulis query untuk mengembalikan kolom productid, productname, supplierid, unitprice, discontinued dari production.product. Filter hanya mengembalikan produk yang  kategorinya beverages

--;create view Production.ProductBeverages
--as
--select productid, productname, supplierid, unitprice, discontinued from Production.Products 
--where categoryid in(
--	select categoryid from Production.Categories where categoryname='Beverages')

--select * from Production.ProductBeverages where supplierid=1 order 
--select * from Production.ProductBeverages order by productname

--alter view Production.ProductBeverages as -- buat ngupdate view
--select productid, productname, supplierid,unitprice, discontinued,
--	case 
--		when unitprice>100 then 'high'
--		else 'low'
--	end as pricetype
-- from Production.Products 
--where categoryid in(
--	select categoryid from Production.Categories where categoryname='Beverages'
--	)

--select * from Production.ProductBeverages where pricetype='high'


--select y.custid,y.totalsalesamount,y.totalsalesamount/totalorder as avgsalesamount from (
--select so.custid as custid,sum(qty*unitprice) as totalsalesamount, count(*) as totalorder from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by custid
--) y order by custid

--select s,count(*)from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by custid

--select y.custid,y.totalsalesamount,y.totalsalesamount/totalorder as avgsalesamount from 
--(
--	select so.custid as custid,sum(qty*unitprice) as totalsalesamount 
--		from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid group by custid
--) y inner join
--(
--	select so.custid as custid, count(*) as totalorder from Sales.Orders so group by so.custid
--)z on y.custid=z.custid order by custid

--select tahun, totalsales, lag(totalsales,1) over(order by tahun) from
--(select YEAR(so.orderdate) as tahun,sum(sod.qty*sod.unitprice) as totalsales
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--		group by YEAR(so.orderdate)
--) as x

-- pake cross apply

--penjualan produk 3 paling atas berdasarkan total sales value, untuk customer id=1

--create procedure dbo.GetTopProductPriceByCustomer
--	@custid int
--as
--select sc.custid,pp.productid,pp.productname,totalsalesamount,
--	FIRST_VALUE(totalsalesamount) over(partition by custid order by totalsalesamount desc 
--		range between unbounded preceding and unbounded following) as firstval,
--	LAST_VALUE(totalsalesamount) over(partition by custid order by totalsalesamount desc 
--		range between unbounded preceding and unbounded following) as lastval,
--	sum(totalsalesamount) over(partition by custid order by totalsalesamount desc
--	rows between unbounded preceding and current row) as runsalesamount,
--	LAG(totalsalesamount) over(partition by custid order by totalsalesamount) as lag,
--	LEAD(totalsalesamount) over(partition by custid order by totalsalesamount) as lead
--	from Sales.Customers sc cross apply
--	(	
--	select top(3) sod.productid,sum(qty*unitprice) as totalsalesamount 
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--		where so.custid=sc.custid
--			group by sod.productid
--				order by totalsalesamount desc
--	)x inner join Production.Products pp on x.productid=pp.productid
--	where sc.custid=@custid or sc.custid is null
--	order by custid

-- store procedure

--alter procedure dbo.GetTopProductPriceByCustomer -- buat update procedure
--	@custid int=null,
--	@top int =null
--as
--select sc.custid,pp.productid,pp.productname,totalsalesamount,
--	FIRST_VALUE(totalsalesamount) over(partition by custid order by totalsalesamount desc 
--		range between unbounded preceding and unbounded following) as firstval,
--	LAST_VALUE(totalsalesamount) over(partition by custid order by totalsalesamount desc 
--		range between unbounded preceding and unbounded following) as lastval,
--	sum(totalsalesamount) over(partition by custid order by totalsalesamount desc
--	rows between unbounded preceding and current row) as runsalesamount,
--	LAG(totalsalesamount) over(partition by custid order by totalsalesamount) as lag,
--	LEAD(totalsalesamount) over(partition by custid order by totalsalesamount) as lead
--	from Sales.Customers sc cross apply
--	(	
--	select top(isnull(@top,3)) sod.productid,sum(qty*unitprice) as totalsalesamount 
--	from Sales.Orders so inner join Sales.OrderDetails sod on so.orderid=sod.orderid 
--		where so.custid=sc.custid
--			group by sod.productid
--				order by totalsalesamount desc
--	)x inner join Production.Products pp on x.productid=pp.productid
--	where sc.custid=@custid or sc.custid is null
--	order by custid



--exec dbo.GetTopProductPriceByCustomer @custid=0

--create procedure dbo.MaxOrderDate
--as
--select 'test'

--exec dbo.MaxOrderDate

create procedure Sales.GetTopCustomers
@customerpos int =1,
@customername nvarchar(30) output
as
set @customername=(
	select sc.contactname
		from Sales.OrderValues as o
			inner join Sales.Customers sc on sc.custid=o.custid
				group by sc.custid, sc.contactname
					order by sum(o.val) desc
						offset @customerpos -1 ROWS FETCH NEXT 1 ROW ONLY
	);

	declare @customername nvarchar(30)
	exec Sales.GetTopCustomers 3, @customername output

	select @customername