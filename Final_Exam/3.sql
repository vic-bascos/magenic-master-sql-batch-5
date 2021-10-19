UPDATE [dbo].[Product_20210913] 
SET ListPrice = CASE 
					WHEN c.CategoryName = 'Children Bicycles' 
						OR c.CategoryName = 'Cyclocross Bicycles' 
						OR c.CategoryName = 'Road Bikes'
					THEN (p.ListPrice * 1.2)
					WHEN c.CategoryName = 'Comfort Bicycles'
						OR c.CategoryName = 'Cruisers Bicycles'
						OR c.CategoryName = 'Electric Bikes'
					THEN (p.ListPrice * 1.7)
					WHEN c.CategoryName = 'Mountain Bikes'
					THEN (p.ListPrice * 1.4)
					ELSE p.ListPrice
				END
FROM [dbo].[Product_20210913] p
INNER JOIN [dbo].[Category] c on p.CategoryId = c.CategoryId