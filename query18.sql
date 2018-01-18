use TSQL2012
--select * from INFORMATION_SCHEMA.TABLES
--	where TABLE_TYPE='view'

--select table_type, count(*) from INFORMATION_SCHEMA.TABLES
--group by TABLE_TYPE

--sp_helptext [CustOrders]

create view HR.EmpPhoneList
as
select *
	from HR.Employees