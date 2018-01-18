--select e1.firstname, e2.lastname
--	from hr.Employees as e1
--	cross join hr.Employees as e2

--select e.empid, e.lastname, e.title, e.mgrid, m.lastname
--	from hr.Employees as e
--	left outer join hr.employees as m on e.mgrid =m.empid

--select e.empid, e.lastname, e.title, m.mgrid
--	from hr.employees as e left outer join hr.employees as m on e.mgrid=m.mgrid

--select * from HR.Employees
use TSQL2012

select DATEFROMPARTS(YEAR(SYSDATETIME()),12,31)

create table HR.Calendar(
	--id int not null,
	calendardate date CONSTRAINT PK_Calendar Primary key,
	monthdate int,
	yeardate int,
	--primary key(id)
);

declare @startdate DATE =  DATEFROMPARTS(YEAR(SYSDATETIME()),1,1),
	@enddate DATE = DATEFROMPARTS(YEAR(SYSDATETIME()),12,31)

Declare @MonthName varchar(12)

while @startdate <= @enddate
begin
	insert into HR.Calendar(calendardate, monthdate, yeardate)
	values(@startdate, MONTH(@startdate), YEAR(@startdate))
	--@startdate =DATEFROMPARTS(YEAR(SYSDATETIME()),MONTH(@startdate),GETDATE(@startdate))
	select @startdate
	--@startdate =  DATEFROMPARTS(YEAR(SYSDATETIME()),GETDATE(@startdate)+1,)
end