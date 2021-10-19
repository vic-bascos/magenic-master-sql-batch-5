CREATE VIEW [dbo].[vwCustomerOrders]
AS
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(ISNULL(oi.Quantity * oi.ListPrice, 0)) AS TotalOrderAmount, c.RankId AS CustomerRanking
FROM     dbo.Customer AS c LEFT OUTER JOIN
                  dbo.[Order] AS o ON c.CustomerId = o.CustomerId LEFT OUTER JOIN
                  dbo.OrderItem AS oi ON o.OrderId = oi.OrderId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.RankId
GO