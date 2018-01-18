--select convert(char(8), current_TIMESTAMP,112) as IS_STYLE

--convert()

--select parse('21/12/2012' as datetime2 using 'id-ID') as parse_result

--select parse('12/21/2012' as datetime2 using 'en-US') as parse_result

--select try_parse('SQL Server' as datetime2 using 'en-US') as try_parse_result

--select try_convert(char(9), current_TIMESTAMP,112) as IS_STYLE

--select ISNUMERIC('6.')

--select productid, unitprice, IIF(unitprice > 50, 'high','low') from Production.Products

--select productid, unitprice, 
--	IIF(unitprice > 80, 'A',
--		IIF(unitprice>60,'B', 
--			IIF(unitprice>40,'C',
--				IIF(unitprice>20,'D','E')))) from Production.Products 

--select choose(2, 'Beverages','Condiments','Confections') as choose_result

--select custid, city, isnull(region, 'N/A') as region, country from Sales.Customers

--select custid, country, region, city, country + '.'+ coalesce(region,' ')+'. '+city as location from Sales.Customers
--select custid, country, region from Sales.Customers

--select from dbo.emplo

select avg(unitprice) as avg_price, min(qty) as min_qty
	from sales.OrderDetails