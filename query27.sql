set statistics time on
--select unitprice,discontinued from Production.Products
--with(index(NC_Unitprice))

--select unitprice,discontinued from Production.Products
--where unitprice >1
--with(index(NC_Unitprice))


select * from Production.Categories

begin tran
update Production.Categories set chksum=2
rollback tran
set statistics time off