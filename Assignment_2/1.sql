SELECT p.ProductName
, SUM(Quantity) TotalQuantity 
FROM [dbo].[Order] o
INNER JOIN [dbo].[OrderItem] oi ON o.ORderId = oi.OrderId
INNER JOIN [dbo].[Product] p on oi.ProductId = p.ProductId
INNER JOIN [dbo].[Store] s on o.StoreId = s.StoreId
WHERE s.[State] = 'TX'
GROUP BY p.ProductName
HAVING SUM(Quantity) > 10 
ORDER BY SUM(Quantity) DESC