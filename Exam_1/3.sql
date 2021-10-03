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
 