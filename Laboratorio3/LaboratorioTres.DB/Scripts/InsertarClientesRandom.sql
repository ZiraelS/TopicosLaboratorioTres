DECLARE @i smallint
DECLARE @j smallint
DECLARE @cantidad smallint
DECLARE @string varchar(5)
DECLARE @name varchar (50)
DECLARE @fecha date
DECLARE @sexo varchar(1)
--
SET @cantidad = 10
SET @i = 0
WHILE @i < @cantidad 
	BEGIN
	SET @j = 0
		WHILE @j < 5  
			BEGIN  
				SET @name = CONCAT(@name,(SELECT CHAR(RAND()*(ASCII('A')-ASCII('Z'))+ASCII('Z'))))
				SET @j = @j + 1  
			END
		SET @name = CONCAT('Cliente ',@name)
		SET @fecha = (SELECT DATEFROMPARTS(FLOOR(RAND()*(2000-1970)+1970),FLOOR(RAND()*(12-1)+1),FLOOR(RAND()*(28-1)+1)))

		IF (FLOOR(RAND()*(2)+1) = 1)
			SET @sexo = 'M';
		ELSE 
			SET @sexo = 'F';
		--
		INSERT INTO dbo.Cliente VALUES (@name, @fecha, @sexo)
		SET @i = @i + 1 
		SET @name = ''
	END
GO 