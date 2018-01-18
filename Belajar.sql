--select substring('0123456789',1,3)
--select LEFT('123456789',5)
--select LEN('123456798')
--select DATALENGTH(123456798432546)
--select CHARINDEX('12345 6798', '12345 6789')
--SELECT REPLACE('This is a Test',  'Test', 'desk' );  
--DECLARE @document varchar(64);  
--SELECT @document = 'Reflectors are vital safety' +  
--                   ' components of your bicycle.';  
--SELECT CHARINDEX('a', @document);  
--GO
--select  GETDATE()
--select (CURRENT_TIMESTAMP)  
--select datename(month,getdate()), datename(week, getdate()), datename(dw,getdate()),datename(quarter,getdate()),datename(dy,getdate())
--select DATEADD(MONTH,2,GETDATE())
--select DATEDIFF(MONTH,getdate(),'19950101')

--select * from Employees order by EmployeeID
--	offset 4 rows fetch next 3 rows only

--select convert(char(8), current_TIMESTAMP,112) as IS_STYLE

--select try_parse('SQL Server' as datetime2 using 'en-US') as try_parse_resut
--select parse('21/12/2012' as datetime2 using 'id-ID') as parse_result

use TSQL2012
--select custid,total,sum(custid) over(order by custid) from (
--select x.custid, sum(totalpercust) as total from (
--select custid as custid,ordermonth,qty,SUM(qty) over(partition by custid) as totalpercust from Sales.CustOrders
--) x group by x.custid --select parse('12/21/2012' as datetime2 using 'en-US') as parse_result
--)y

--select productid,unitprice, dense_rank() over(order by unitprice desc) as price_dense_rank, rank() over(order by unitprice desc) as price_rank 
--from Production.Products order by price_dense_rank

--select CatID, CatName, ProdName, UnitPrice,
--	NTILE(5) Over(PARTITION By CatID Order by UnitPrice DESC) as NT 
--		from Production.CategorizedProducts
--			order by CatID, NT


--select ROW_NUMBER() over(order by Empid desc), empid from HR.Employees

--select * from Sales.CategorySales

--select category,qty,orderyear
--from(
--	select category, qty, orderyear
--		from Sales.CategoryQtyYear
--	) as d
--	pivot(sum(qty) for orderyear
--		in([2006],[2007],[2008])) as pvt
--	UNPIVOT
--   (qty FOR orderyear IN 
--      ([2006],[2007],[2008])
--	)AS unpvt;

select category, [2006],[2007],[2008]
from(
	select category, qty, orderyear
		from Sales.CategoryQtyYear
	) as d
	pivot(sum(qty) for orderyear
		in([2006],[2007],[2008])) as pvt
	order by Category


--select * from Sales.CategoryQtyYear

--select REPLICATE('ad',5)

--select getdate()
--select SYSDATETIME() -- bisa sampe nanosecond
--select GETUTCDATE()
select nullif(5,5) as same

select * from HR.Employees,Sales.Customers