--select CAST(15 as binary (4)) as result -- jadinya hexa

--select cast(0xF as int) as jadi

----untuk hexa formatnya 0x000, gak usah pake petik ('0x000')

--select cast(-10 as tinyint) as errorgak -- hasilnya bakalan error, tidak bisa dipaksakan. Bilangan bertanda dikonvert jadi bertanda bakal error

--declare @myTinyint as tinyint =25
--declare @myint as int = 999
--select DATALENGTH(@mytinyint + @myint)

--declare @somechar char(5)='6'
--declare @someint int =1
--select @somechar +@someint

--declare @somechar2 char(3)='abs'

--select empid, lastname
--	from hr.Employees where lastname collate latin1_general_cs_as = N'Funk' -- untuk case sensitif

--select empid, lastname, firstname, firstname +N' '+lastname as fullname from hr.Employees

--select custid, city, region, country, concat(city, ', '+region, ', '+country) as location from sales.Customers

--select top(3) orderid, format(orderdate,'d','en-us') as us,

--select * from Sales.Customers where country like 'G-y' 

--select shipaddress from sales.Orders where shipaddress like '%du%'
--select shipaddress from sales.Orders where shipaddress like '__d%'
--select shipaddress from sales.Orders where shipaddress like '[afg]%'
--select shipaddress from sales.Orders where shipaddress like '[A-G]%' order by shipaddress
--select shipaddress from sales.Orders where shipaddress like N'[^A-G]%' order by shipaddress -- hruuf apa aja selain a-g


--select * from 
--(
--	select replace(shipaddress,'.','_') as shipaddress
--	from sales.Orders
--) a
--where shipaddress like '%str\_%' escape '\' order by shipaddress

--select distinct shipaddress from sales.orders where shipaddress like '%str\.%' escape '\'
--	order by shipaddress

--declare @dateonly datetime='20120212 12:30:15.123' --YYYYMMDD
--select @dateonly

--select orderid, custid, empid,orderdate from Sales.Orders where orderdate='20070825'

--select orderid, custid, empid, orderdate from sales.Orders where orderdate >= '20070825'

--select CURRENT_TIMESTAMP
--select SYSUTCDATETIME()

--select datepart(m,getdate()), CURRENT_TIMESTAMP

--select datediff(minute,getdate(),dateadd(minute,15,getdate())) -- penggunaan dateadd misalnya dibikin report 6 bulan lalu, cara gampangnya dengan spesifikasikan datenya

--select dateadd(month, 6 getdate()) as startdate, getdate() enddate

--select DATEFROMPARTS(
--	year(getdate()),
--	month(
--		dateadd(month,-6,getdate()))
--	1) as startdate, getdate() enddate

--select dateadd(day, -1, datefromparts (
--		year(getdate()),month(getdate())
--	) as startdate,getdate() enddate

--select dateadd(day,-1,DATEFROMPARTS(
--	year(getdate()),
--	month(
--		dateadd(month,-6,getdate())),
--	1) as startdate,getdate() enddate

--select datename(month,getdate()), datename(week, getdate()), datename(dw,getdate()),datename(quarter,getdate()),datename(dy,getdate()),
--	case when datename(quarter, getdate()) in (1,2) then '1'
--		else '2'
--	end as semester


--select cast(

select datename(month,getdate()), datename(week, getdate()), datename(dw,getdate()),datename(quarter,getdate()),datename(dy,getdate())

declare @JulianDate as varchar(7)='2017001'

DECLARE @input_date DATETIME

SELECT @input_date = getdate()

SELECT datepart(year, @input_date) * 1000 + datepart(dy, @input_date)

--select SUBSTRING(@JulianDate,1,4)*10000+SUBSTRING(@JulianDate,5,3)

--select datename(SUBSTRING(@JulianDate,5,3))
set @JulianDate='2017355'
select cast(right(@JulianDate,3) as int),
		DATEFROMPARTS(left(@JulianDate,4),1,1),
		DATEADD(d,
			cast(right(@JulianDate,3) as int) -1,
			DATEFROMPARTS(left(@JulianDate,4),1,1))