--unchanged0000000000000000
--updated
--new
--deleted

select *
	--case
	--	when core.CIFNO is null and userentry.CIFNO is not null then 'new'
	--	when core.CIFNO is not null and userentry.CIFNO is null then 'deleted'0
	--	when core.CIFNO=userentry.CIFNO and core.test=userentry.test then 'unchanged'
	--	when core.CIFNO=userentry.CIFNO and core.test!=userentry.test then 'updated'
	--end
 from 
(
	select 'C1' as CIFNO, 'Test1' test
	union all
	select 'C2' as CIFNO, 'Test2' test
	union all
	select 'C3' as CIFNO, 'Test3' test
) core
full join
(
	select 'C4' as CIFNO, 'Test4' test
	union all
	select 'C2' as CIFNO, 'Test2 rev' test
	union all
	select 'C3' as CIFNO, 'Test3' test
) userentry on core.CIFNO=userentry.CIFNO

	