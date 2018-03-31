CREATE TABLE [dbo].[Libro]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [NombreOriginal] VARCHAR(100) NULL, 
    [NombreTraducido] VARCHAR(100) NULL, 
    [AnioEdicion] NUMERIC(4) NULL, 
    [NumeroEdicion] NUMERIC(4) NULL
)
