--select pp.productname, pc.categoryname
--	from Production.Products pp inner join Production.Categories pc on pp.categoryid=pc.categoryid

--select customers.custid, contactname, orderid
--	from sales.Customers inner join Sales.Orders
--		on Customers.custid=Orders.custid --skemanya harus dipanggil juga jadi Sales.Customers.custid=Sales.Orders.custid