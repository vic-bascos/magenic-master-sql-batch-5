SELECT * 
INTO Product_20210912
FROM dbo.Product 
WHERE ModelYear <> 2016


UPDATE Product_20210912
SET ListPrice = ListPrice * 1.2
From Product_20210912 Product
INNER JOIN Brand ON Product.BrandID = Brand.BrandID
WHERE Brand.BrandName = 'Heller' OR Brand.BrandName = 'Sun Bicycles'


UPDATE Product_20210912
SET ListPrice = ListPrice * 1.1
FROM Product_20210912 Product
INNER JOIN Brand ON Product.BrandID = Brand.BrandID
WHERE Brand.BrandName <> 'Heller' AND Brand.BrandName <> 'Sun Bicycles'
