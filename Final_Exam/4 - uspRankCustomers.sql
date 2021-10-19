
CREATE PROCEDURE uspRankCustomers
AS
BEGIN

	WITH CTE AS(SELECT c.CustomerId, SUM(ISNULL(oi.Quantity * oi.ListPrice,0)) TotalOrderAmount FROM [dbo].[Customer] c
	LEFT JOIN [dbo].[Order] o on c.CustomerId = o.CustomerId
	LEFT JOIN [dbo].[OrderItem] oi on o.OrderId = oi.OrderId
	GROUP BY c.CustomerId)


	UPDATE [dbo].[Customer]
	SET RankId =CASE 
			WHEN TotalOrderAmount = 0 THEN 1
			WHEN TotalOrderAmount < 1000 THEN 2
			WHEN TotalOrderAmount < 2000 THEN 3
			WHEN TotalOrderAmount < 3000 THEN 4
			WHEN TotalOrderAmount >= 3000 THEN 5
		END
	FROM [dbo].[Customer] c
	INNER JOIN CTE on c.CustomerId = CTE.CustomerId

END