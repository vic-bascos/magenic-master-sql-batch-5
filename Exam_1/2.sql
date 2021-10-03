SELECT 
p.ProductId
,p.ProductName
,b.BrandName
,c.CategoryName
,SUM(oi.Quantity) Quantity
FROM [dbo].[Product] p
INNER JOIN [dbo].[OrderItem] oi on p.productId = oi.productId
INNER JOIN [dbo].[Order] o on oi.OrderId = o.OrderId
INNER JOIN [dbo].[Brand] b on p.BrandId = b.BrandId
INNER JOIN [dbo].[Category] c on p.CategoryId = c.CategoryId
INNER JOIN [dbo].[Store] s on o.StoreId = s.StoreId
where p.ModelYear IN (2017,2018) and s.StoreName = 'Baldwin Bikes'
GROUP BY p.ProductId
,p.ProductName
,b.BrandName
,c.CategoryName
order by SUM(oi.Quantity)  DESC