SELECT
CustomerId
, COUNT(*) OrderCount
FROM [dbo].[Order]
WHERE YEAR(OrderDate) BETWEEN 2017 and 2018
GROUP BY CustomerId
HAVING COUNT(*) >= 2