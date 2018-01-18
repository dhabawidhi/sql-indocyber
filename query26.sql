use TSQL2012
--INSERT INTO Production.Categories(categoryname,description) values ('test', 'coba insert data')
--INSERT INTO Production.Categories(categoryid,categoryname,description) values (88,'test', 'coba insert data') -- bakal eror

set identity_insert Production.Categories on
--INSERT INTO Production.Categories(categoryid,categoryname,description) values (88,'test', 'coba insert data') -- baru dah bisa

set identity_insert production.categories off
--INSERT INTO Production.Categories(categoryname,description) values ('89', 'coba insert data')

--insert into Production.Categories(categoryname,description)
--exec nama sp

--insert into Production.Categories(categoryname,description)
--select cast(cate)

--insert into Production.Categories(categoryname,description)
--values ('testx', 'coba insert data'),
--		('testy', 'coba insert data'),
--		('testz', 'coba insert data')
insert into Production.Categories(categoryname,description) select categoryname,description from Production.Categories


select * from Production.Categories