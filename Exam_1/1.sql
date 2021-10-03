select s.StoreId, s.StoreName FROM [dbo].[Store] s 
LEFT JOIN [dbo].[Order] o on s.StoreId = o.StoreId
where o.OrderId is null 