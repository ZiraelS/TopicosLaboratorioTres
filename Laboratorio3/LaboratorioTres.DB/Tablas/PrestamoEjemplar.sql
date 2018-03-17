CREATE TABLE [dbo].[PrestamoEjemplar]
(
	[IdEjemplar] INT NOT NULL , 
    [IdCliente] INT NOT NULL, 
    [FechaPrestamo] DATETIME NULL, 
    [FechaDevolucion] DATETIME NULL, 
    [FechaDevuelto] DATETIME NULL, 
    [EjemplarPerdido] VARCHAR NULL, 
    PRIMARY KEY ([IdEjemplar],[IdCliente]), 
    CONSTRAINT [FK_PrestamoEjemplar_ToEjemplar] FOREIGN KEY ([IdEjemplar]) REFERENCES [Ejemplar]([Id]), 
    CONSTRAINT [FK_PrestamoEjemplar_ToCliente] FOREIGN KEY ([IdCliente]) REFERENCES [Cliente]([Id]), 
    CONSTRAINT [CK_PrestamoEjemplar_EjemplarPerdido] CHECK (EjemplarPerdido in ('S','N'))
)
