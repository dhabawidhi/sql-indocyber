
;with emp
as
(
	select p.bulan as bulan, p.val as val,p.val as lv1
	from 
	(
		select MONTH(orderdate) as bulan,sum(val) as val
			from Sales.OrderValues
				where YEAR(orderdate)=2007 
					group by MONTH(orderdate) 
						--order by bulan
	) p 
)

select p.bulan,p.val as val,
	case
		when p.bulan=1 then p.val
		when p.bulan=2 then (p.val+q.val)/2
		else (p.val+q.val+r.val)/3
		end as averagelast3month --,p.val,q.val,r.val
		, x.cum as kumulatif
from 
(
	select MONTH(orderdate) as bulan,sum(val) as val 
		from Sales.OrderValues 
			where YEAR(orderdate)=2007 
				group by MONTH(orderdate) 
					--order by bulan
) p left join 
(
	select MONTH(orderdate) as bulan,sum(val) as val 
		from Sales.OrderValues 
			where YEAR(orderdate)=2007 
				group by MONTH(orderdate)
) q on p.bulan=q.bulan+1 left join
(
	select MONTH(orderdate) as bulan,sum(val) as val 
		from Sales.OrderValues 
			where YEAR(orderdate)=2007 
				group by MONTH(orderdate)
) r on p.bulan=r.bulan+2 inner join
(
	select q.bulan as bulan, q.val as val, sum(e.val) as cum
		from 
		(
			select MONTH(orderdate) as bulan,sum(val) as val 
				from Sales.OrderValues
					where YEAR(orderdate)=2007 
						group by MONTH(orderdate) 
							--order by bulan
		) q inner join emp e on q.bulan>=e.bulan
		group by q.bulan,q.val
) x on x.bulan=p.bulan