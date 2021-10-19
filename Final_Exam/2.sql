
CREATE PROCEDURE ListOfProduct
	@ProductName varchar(255),
	@BrandId INT,
	@CategoryId INT,
	@ModelYear INT,
	@PageSize INT = 10
AS
BEGIN
WITH CTE AS(
	SELECT 
	ROW_NUMBER() OVER(ORDER BY ModelYear DESC, ListPrice DESC, ProductName) [Row],
	* 
	FROM [dbo].[Product] 
	WHERE ProductName LIKE '%' + @ProductName +'%'
	AND BrandId =@BrandId
	AND CategoryId =@CategoryId
	AND ModelYear =@ModelYear)

	SELECT p.* FROM [dbo].[Product] p
	INNER JOIN CTE on p.ProductId = CTE.ProductId 
	WHERE CTE.[Row]<= @PageSize
END
GO