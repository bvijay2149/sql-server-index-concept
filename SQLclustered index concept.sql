SELECT * FROM movie ;
-- 
create clustered index ci_movid on movie(mov_id asc)

sp_helpindex movie

SELECT * FROM movie
where mov_id= 926;

drop index movie.ci_movid

CREATE TABLE tblOrder
(
    Id INT,
    CustomerId INT,
    ProductId Varchar(100),
    ProductName VARCHAR(50)
)
GO

DECLARE @i int = 0 
while @i < 3000
begin 
set @i = @i+1
if (@i < 500)
begin 
insert into tblOrder values (@i , 1 , 'product - 10120', 'laptop')
end
else if (@i < 1000)
begin 
insert into tblOrder values (@i,3,'product - 1020','mobile')
end 
else if (@i < 1500)
begin 
insert into tblOrder values (@i,2,'product - 101' ,'desktop')
End
    Else if(@i < 2000)
    Begin
        INSERT INTO tblOrder VALUES (@i, 3, 'Product - 707', 'Pendrive')
    End
    Else if(@i < 2500)
    Begin
        INSERT INTO tblOrder VALUES (@i, 2, 'Product - 999', 'HD')
    End
    Else if(@i < 3000)
    Begin
        INSERT INTO tblOrder VALUES (@i, 1, 'Product - 100', 'Tablet')
    End
END

select * from tblOrder where ProductId = 'product - 101' 


create nonclustered index nci_new on tblorder(id )

drop  index tblorder.nci_new

SELECT * FROM tblOrder WHERE ProductId = 'Product – 101'

CREATE NONCLUSTERED INDEX IX_tblOrder_ProductId
ON dbo.tblOrder (ProductId)
INCLUDE ([Id],[CustomerId],[ProductName])
GO

--Example to understand how Index impacts DML Operations in SQL Server:

CREATE UNIQUE NONCLUSTERED INDEX UIX_Employees_FastNamee_LastName On Employees(FastName, LastName)

EXEC sp_helpconstraint actor

EXEC sp_spaceused Employee --to check diskspace

CREATE UNIQUE INDEX IX_Employees_City ON Employees(City) WITH IGNORE_DUP_KEY

-- index in groupby clause with example

-- Create the ProductSales table
CREATE TABLE ProductSales
(
  ProductSalesID INT,
  OrderID INT,
  ProductID INT,
  QunatitSold INT
)
GO

-- Populate the ProductSakes table with some test data
INSERT INTO ProductSales VALUES(1, 1001, 501, 3)
INSERT INTO ProductSales VALUES(2, 1001, 502, 2)
INSERT INTO ProductSales VALUES(3, 1001, 503, 4)
INSERT INTO ProductSales VALUES(4, 1002, 501, 1)
INSERT INTO ProductSales VALUES(5, 1002, 502, 2)
INSERT INTO ProductSales VALUES(6, 1003, 503, 2)
INSERT INTO ProductSales VALUES(7, 1003, 501, 3)
INSERT INTO ProductSales VALUES(8, 1004, 502, 4)
INSERT INTO ProductSales VALUES(9, 1004, 503, 4)
INSERT INTO ProductSales VALUES(10, 1001, 501, 3)
INSERT INTO ProductSales VALUES(11, 1001, 502, 2)
INSERT INTO ProductSales VALUES(12, 1001, 503, 4)
INSERT INTO ProductSales VALUES(13, 1002, 501, 1)
INSERT INTO ProductSales VALUES(14, 1002, 502, 2)
INSERT INTO ProductSales VALUES(15, 1003, 503, 2)
INSERT INTO ProductSales VALUES(16, 1003, 501, 3)
INSERT INTO ProductSales VALUES(17, 1004, 502, 4)
INSERT INTO ProductSales VALUES(18, 1004, 503, 4)

select * from ProductSales

select ps.ProductID, sum(ps.QunatitSold) as totalquantitysold
from ProductSales ps
group by ProductID

print '1 to 10 leda lyt '