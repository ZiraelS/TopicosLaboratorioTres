CREATE TABLE [dbo].[Ejemplar]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [IdLibro] INT NULL, 
    [FechaDonacion] DATE NULL, 
    [Prestamo] VARCHAR NULL, 
    [Idioma] VARCHAR(50) NULL, 
    CONSTRAINT [FK_Ejemplar_Libro] FOREIGN KEY ([IdLibro]) REFERENCES [Libro]([Id]), 
    CONSTRAINT [CK_Ejemplar_Prestamo] CHECK (Prestamo in ('S','N'))
)
