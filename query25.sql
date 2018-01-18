use TSQL2012
--select p.bulan,
--	case when p.bulan>1 then AVG(val)
--		over (partition by floor((p.bulan-1)/3))
--			else null end avg
--	 from 
--(
--	select MONTH(orderdate) as bulan,sum(val) as val 
--		from Sales.OrderValues 
--			where YEAR(orderdate)=2007 
--				group by MONTH(orderdate) 
--					--order by bulan
--) p

declare @sum money=0.00

-- buat kumulativ


--select t1.id, t1.SomeNumt, SUM(t2.SomeNumt) as sum
--from @t t1
--inner join @t t2 on t1.id >= t2.id
--group by t1.id, t1.SomeNumt
--order by t1.id






--print @sum
--select @sum

--;with emp
--as
--(
--	select p.bulan as bulan, p.val as val,p.val as lv1
--	from 
--	(
--		select MONTH(orderdate) as bulan,sum(val) as val
--			from Sales.OrderValues
--				where YEAR(orderdate)=2007 
--					group by MONTH(orderdate) 
--						--order by bulan
--	) p 
--)

--select p.bulan,p.val as val,
--	case
--		when p.bulan=1 then p.val
--		when p.bulan=2 then (p.val+q.val)/2
--		else (p.val+q.val+r.val)/3
--		end as averagelast3month --,p.val,q.val,r.val
--		, x.cum as kumulatif
--from 
--(
--	select MONTH(orderdate) as bulan,sum(val) as val 
--		from Sales.OrderValues 
--			where YEAR(orderdate)=2007 
--				group by MONTH(orderdate) 
--					--order by bulan
--) p left join 
--(
--	select MONTH(orderdate) as bulan,sum(val) as val 
--		from Sales.OrderValues 
--			where YEAR(orderdate)=2007 
--				group by MONTH(orderdate)
--) q on p.bulan=q.bulan+1 left join
--(
--	select MONTH(orderdate) as bulan,sum(val) as val 
--		from Sales.OrderValues 
--			where YEAR(orderdate)=2007 
--				group by MONTH(orderdate)
--) r on p.bulan=r.bulan+2 inner join
--(
--	select q.bulan as bulan, q.val as val, sum(e.val) as cum
--		from 
--		(
--			select MONTH(orderdate) as bulan,sum(val) as val 
--				from Sales.OrderValues
--					where YEAR(orderdate)=2007 
--						group by MONTH(orderdate) 
--							--order by bulan
--		) q inner join emp e on q.bulan>=e.bulan
--		group by q.bulan,q.val
--) x on x.bulan=p.bulan
--use tempdb;
--go
--create synonym dbo.Product for
--	TSQL2012.Production.Products;
--go
--exec dbo.Product

--select * from Production.Products

--declare @categoryID int =88,
--		@SalesCategoryName nvarchar(15) =N'cobamerge';

--Merge into Production.Categories as tgt
--	using
--		(SELECT @categoryID as categoryid,
--		@SalesCategoryName as salescategoryname
--		) as src
--		on tgt.categoryid=src.categoryid
--		when matched
--			then update
--				set tgt.categoryname=src.salescategoryname
--		when not matched
--			then insert(
--				categoryname
--			)
--			values (src.salescategoryname);

--select * from Production.Categories

--update Production.Categories
--set chksum=CHECKSUM(categoryname,description)