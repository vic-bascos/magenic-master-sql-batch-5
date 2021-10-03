
WITH Result as (
SELECT 
YEAR(OrderDate) [SalesYear],
LEFT(DATENAME(MONTH,OrderDate),3) [SalesMonth],
SUM(Quantity* (ListPrice - (ListPrice*Discount))) [Sales]
FROM [dbo].[Order] o
INNER JOIN [dbo].[OrderItem] oi ON o.OrderId = oi.OrderId
GROUP BY YEAR(OrderDate),
LEFT(DATENAME(MONTH,OrderDate),3)) 


select * From Result
PIVOT(
	SUM([Sales]) 
			FOR [SalesMonth] IN (
				[Jan], 
				[Feb], 
				[Mar], 
				[Apr], 
				[May], 
				[Jun], 
				[Jul],
				[Aug],
				[Sep],
				[Oct],
				[Nov],
				[Dec])
		) AS PivotTable