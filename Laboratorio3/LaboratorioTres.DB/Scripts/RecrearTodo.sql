DROP TABLE IF EXISTS PrestamoEjemplar
DROP TABLE IF EXISTS Ejemplar
DROP TABLE IF EXISTS Libro
DROP TABLE IF EXISTS Cliente

CREATE TABLE [dbo].[Cliente]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(10001,1), 
    [Nombre] VARCHAR(50) NULL, 
    [FechaNacimiento] DATE NULL, 
    [Sexo] VARCHAR NULL, 
    CONSTRAINT [CK_Cliente_Sexo] CHECK (Sexo in ('F','M','D'))
)

CREATE TABLE [dbo].[Libro]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [NombreOriginal] VARCHAR(100) NULL, 
    [NombreTraducido] VARCHAR(100) NULL, 
    [AnioEdicion] NUMERIC(4) NULL, 
    [NumeroEdicion] NUMERIC(4) NULL
)

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

INSERT INTO Cliente (Nombre,FechaNacimiento,Sexo) VALUES ('Daniel Lepiz', DATEFROMPARTS(2000,1,21),'M')
INSERT INTO Cliente (Nombre,FechaNacimiento,Sexo) VALUES ('Kevin Mora', DATEFROMPARTS(1995,2,22),'M')
INSERT INTO Cliente (Nombre,FechaNacimiento,Sexo) VALUES ('Jorge Garro', DATEFROMPARTS(1999,3,23),'M')
INSERT INTO Cliente (Nombre,FechaNacimiento,Sexo) VALUES ('Jose Fallas', DATEFROMPARTS(1994,4,24),'M')
INSERT INTO Cliente (Nombre,FechaNacimiento,Sexo) VALUES ('Ricardo Gamboa', DATEFROMPARTS(1998,5,25),'M')
INSERT INTO Cliente (Nombre,FechaNacimiento,Sexo) VALUES ('Esmeralda Ramírez', DATEFROMPARTS(1993,6,26),'F')

INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Fellowship of the Ring','La comunidad del anillo',1954,1)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Two Towers','Las dos torres',1954,1)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Return of the King','El retorno del rey',1955,1)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Philosopher''s Stone','La piedra filosofal',1997,2)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Secret Chamber','La camara secreta',1998,2)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Prisoner of Azkaban','El prisionero de Azkaban',1999,2) 
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Goblet of Fire','El caliz de fuego',2000,2)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Order of the Phoenix','La orden del fenix',2003,2)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Half-Blood Prince','El principe mestizo',2005,2)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('The Deathly Hallows','Las Reliquias de la Muerte',2007,2)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('A Game of Thrones','Juego de tronos',1996,3)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('A Clash of Kings','Choque de reyes',1998,3)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('A Storm of Swords','Tormenta de espadas',2000,3)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('A Feast for Crows','Festin de cuervos',2005,3)
INSERT INTO Libro (NombreOriginal, NombreTraducido, AnioEdicion, NumeroEdicion) VALUES ('A Dance with Dragons','Danza de dragones',2011,3)

INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (101,1,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (102,1,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (103,1,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (104,1,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (105,1,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (201,2,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (202,2,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (203,2,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (204,2,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (205,2,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (301,3,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (302,3,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (303,3,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (304,3,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (305,3,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (401,4,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (402,4,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (403,4,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (404,4,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (405,4,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (501,5,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (502,5,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (503,5,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (504,5,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (505,5,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (601,6,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (602,6,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (603,6,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (604,6,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (605,6,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (701,7,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (702,7,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (703,7,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (704,7,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (705,7,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (801,8,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (802,8,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (803,8,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (804,8,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (805,8,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (901,9,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (902,9,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (903,9,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (904,9,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (905,9,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1001,10,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1002,10,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1003,10,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1004,10,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1005,10,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1101,11,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1102,11,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1103,11,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1104,11,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1105,11,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1201,12,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1202,12,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1203,12,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1204,12,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1205,12,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1301,13,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1302,13,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1303,13,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1304,13,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1305,13,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1401,14,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1402,14,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1403,14,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1404,14,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1405,14,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1501,15,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1502,15,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1503,15,DATEFROMPARTS(2018,3,30),'N','ESP')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1504,15,DATEFROMPARTS(2018,3,30),'N','ING')
INSERT INTO Ejemplar (Id, IdLibro, FechaDonacion, Prestamo, Idioma) VALUES (1505,15,DATEFROMPARTS(2018,3,30),'N','ING')

INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (101, 10001, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (104, 10002, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (201, 10003, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (204, 10004, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (301, 10005, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (304, 10006, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (401, 10001, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (404, 10003, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (501, 10002, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (504, 10004, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (601, 10003, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (604, 10006, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (701, 10006, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (704, 10005, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (801, 10004, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (804, 10003, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (901, 10002, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (904, 10001, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1001, 10001, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1004, 10002, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1101, 10003, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1104, 10004, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1201, 10005, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1204, 10006, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1301, 10001, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1304, 10002, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1401, 10003, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1404, 10004, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1501, 10005, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')
INSERT INTO PrestamoEjemplar (IdEjemplar, IdCliente, FechaPrestamo, FechaDevolucion, FechaDevuelto, EjemplarPerdido) VALUES (1504, 10006, DATEFROMPARTS(2018,4,2), DATEFROMPARTS(2018,4,16), DATEFROMPARTS(2018,4,9), 'N')