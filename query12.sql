use TSQL2012
-- offset fetch

--select orderid, custid, orderdate
--	from Sales.Orders
--		order by orderdate, orderid desc
--			offset 10 rows fetch next 10 rows only -- ngambil urutan 10 dulu (skip 10 pertama), terus ngelanjutin ngambil 10 lagi

--select top (10) orderid, custid, orderdate
--	from Sales.Orders
--		order by orderdate, orderid desc

--create procedure SalesOrder_Paging  @pageNo as int, @rowsPerPage int

--as
--begin
--	--declare @pageNo as int,
--	--		@rowsPerPage int

--	set @pageNo=2
--	set @RowsPerPage=25

--	select orderid, custid, orderdate
--		from Sales.Orders
--			order by orderdate, orderid desc
--				offset (@pageNo-1)*@rowsPerPage rows fetch next 10 rows only
--end


--exec SalesOrder_Paging -- @pageNo =2, @rowsPerPage =25

--select top(5) with ties orderid, custid, orderdate -- ties itu seri, jadi misalnya yang ini tanggalnya deketan atau sama, ties diliat secara keseluruhan. diliat juga orderid, custid, orderdate
--	from Sales.Orders
--		order by orderdate

--declare @pageNo as int,
--			@rowsPerPage int

--	set @pageNo=2
--	set @RowsPerPage=3

--	select orderid, custid, orderdate
--		from Sales.Orders
--			order by orderdate, orderid desc
--				offset (@pageNo-1)*@rowsPerPage rows fetch first 3 rows only

--select row_number() over -- jaman lama

--select custid, city, region, country from Sales.Customers where region = null 
-- gak ada operator sama dengan null hasilnya true, karena sama dengan true itu false

----create procedure coba
----as
----begin
----	select 'asdf'

----end

--exec coba


--declare @orderid int, @custid int
--select * from Sales.Orders where orderid=@orderid and custid=@custid

--if @orderid=@custid
--	select 'null'
--else select 'ada tuh'


--select * from sales.Orders
--	where orderid =
--		case
--			when @orderid!='' then '' 
--			else @orderid
--		end

--set @orderid=10248
--select @orderid

--if @orderid is null
--	begin
--		select 'null'
--	end
--else select 'ada nilai'



--select * from Sales.Orders where
--	if @orderid is null
--		begin
--			orderid is null
--		end
--	else
--		begin
--		orderid=@orderid
--		end


--select * from Sales.Orders where orderid=@orderid and custid=@custid
--select * from Sales.Orders where orderid = is not null
--case
--	when @orderid > 0 then select 'sukses'
--end

--dynamic query
declare @orderid int, @custid int
set @orderid=null
set @custid = null
select * from sales.Orders
where 
--(orderid = @orderid or @orderid is null) and (custid = @custid or @custid is null)