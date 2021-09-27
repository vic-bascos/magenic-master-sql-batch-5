SELECT 
REPLACE(CategoryName, 'Bikes', 'Bicycles') CategoryName, 
SUM(Quantity) TotalQuantity 
FROM [dbo].[Order] o
INNER JOIN [dbo].[OrderItem] oi ON o.ORderId = oi.OrderId
INNER JOIN [dbo].[Product] p on oi.ProductId = p.ProductId
INNER JOIN [dbo].[Category] c on p.CategoryId = c.CategoryId
GROUP BY CategoryName
ORDER BY SUM(Quantity) DESC