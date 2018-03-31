CREATE TABLE [dbo].[Cliente]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Nombre] VARCHAR(50) NULL, 
    [FechaNacimiento] DATE NULL, 
    [Sexo] VARCHAR NULL, 
    CONSTRAINT [CK_Cliente_Sexo] CHECK (Sexo in ('F','M','D'))
)
