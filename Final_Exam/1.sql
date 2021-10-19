
CREATE PROCEDURE CreateNewBrandAndMoveProducts
	@NewBrand varchar(255),
	@BrandId int
AS
BEGIN
	DECLARE @NewBrandId as int
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [dbo].[Brand] VALUES(@NewBrand)

			SELECT @NewBrandId = SCOPE_IDENTITY()

			UPDATE [dbo].[Product] SET BrandId =@NewBrandId  where BrandId= @BrandId
			DELETE [dbo].[Brand] WHERE BrandId = @BrandId
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
END
GO
