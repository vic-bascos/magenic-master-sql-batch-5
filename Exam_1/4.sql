WITH result as(SELECT 
b.BrandName
, p.ProductId
, p.ProductName
, p.ListPrice
, RANK() OVER (PARTITION BY b.BrandName Order by p.ListPrice DESC) 'Rank' 
FROM [dbo].[Product] p 
INNER JOIN [dbo].[Brand] b on p.BrandId = b.BrandId
)

SELECT 
BrandName
,ProductId
,ProductName,
ListPrice
FROM result
WHERE [Rank] <= 5
ORDER BY BrandName, ListPrice DESC