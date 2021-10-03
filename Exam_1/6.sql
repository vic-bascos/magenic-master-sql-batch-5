 DECLARE @len AS INT = 1
DECLARE @height AS INT = 1


WHILE @len <= 10 
BEGIN
	SET @height = 1
	
	WHILE @height <= 10 
	BEGIN
		PRINT CONCAT(@len, ' * ', @height, ' = ', @len*@height)
		SET @height = @height + 1;
	END
	
	SET @len = @len + 1; 
END