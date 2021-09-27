WITH Result AS (
SELECT 
YEAR(OrderDate) OrderYear
,MONTH(OrderDate) OrderMonth
,p.ProductName
,SUM(Quantity) TotalQuantity
, RANK() OVER (PARTITION BY YEAR(OrderDate),MONTH(OrderDate) Order by SUM(Quantity)  DESC) 'Rank' 
FROM [dbo].[Order] o
INNER JOIN [dbo].[OrderItem] oi ON o.ORderId = oi.OrderId
INNER JOIN [dbo].[Product] p on oi.ProductId = p.ProductId
INNER JOIN [dbo].[Store] s on o.StoreId = s.StoreId
WHERE s.[State] = 'TX'
GROUP BY 
YEAR(OrderDate)
,MONTH(OrderDate)
,p.ProductName
)

select 
OrderYear
,OrderMonth
,ProductName
,TotalQuantity
FROM Result 
WHERE [Rank] = 1
order by 
OrderYear
,OrderMonth
,ProductName