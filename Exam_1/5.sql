DECLARE db_cursor CURSOR FOR 
SELECT 
s.StoreName
, YEAR(o.OrderDate) [Year]
, COUNT(o.OrderId) [OrderCount]
FROM [dbo].[Order] o
INNER JOIN [dbo].[Store] s on o.StoreId = s.StoreID
GROUP BY s.StoreName
, YEAR(o.OrderDate) 
ORDER BY s.StoreName
, YEAR(o.OrderDate) DESC
 
 DECLARE @StoreName as nvarchar(100)
 DECLARE @Year as  INT
 DECLARE @OrderCount as  INT

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @StoreName, @Year, @OrderCount

WHILE @@FETCH_STATUS = 0  
BEGIN  
      PRINT CONCAT(@StoreName, ' ', @Year, ' ', @OrderCount)
	  
      FETCH NEXT FROM db_cursor INTO @StoreName, @Year, @OrderCount 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 