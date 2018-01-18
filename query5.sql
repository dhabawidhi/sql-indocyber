--select productid,productname,unitprice,
--	case discontinued
--		when 0 then 'active'
--		else 'discontinued' -- when 1 then 'discontinued'
--	end as 'keaktifan'
--	from Production.Products

--select empid,orderdate,
--	case MONTH(orderdate)
--		when 1 then 'Januari'
--		when 2 then 'Februari'
--		when 3 then 'Maret'
--		when 4 then 'April'
--		when 5 then 'Mei'
--		when 6 then 'Juni'
--		when 7 then 'Juli'
--		when 8 then 'Agustus'
--		when 9 then 'September'
--		when 10 then 'Oktober'
--		when 11 then 'Nopember'
--		when 12 then 'Desember'
--	end as 'bulan',YEAR(orderdate) as 'Tahun'
--	from Sales.Orders
	--order by bulan

--select categoryid,productname
--from production.Products

