select * from 
(
	select 1 as col
	union all
	select 2
	union all
	select 3
	union all
	select 4
	union all
	select 5
) t1
full outer join
(
	select 3 as col
	union all
	select 4 
	union all
	select 5
	union all
	select 6
) t2 on t1.col=t2.col

--select 1 
--union all
--select 2
--select * from t1 cross join t2