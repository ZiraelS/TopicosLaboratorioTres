/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

Insert into Cliente (Nombre,FechaNacimiento,Sexo) values ('Daniel Lepiz', Cast('7/7/2000' as date),'M');
Insert into Cliente (Nombre,FechaNacimiento,Sexo) values ('Kevin Mora', Cast('14/11/96' as date),'M');
Insert into Cliente (Nombre,FechaNacimiento,Sexo) values ('Jorge Garro', Cast('14/11/96' as date),'M');
Insert into Cliente (Nombre,FechaNacimiento,Sexo) values ('Jose Fallas', Cast('14/11/96' as date),'M');
Insert into Cliente (Nombre,FechaNacimiento,Sexo) values ('Ricardo Gamboa', Cast('14/11/96' as date),'M');
Insert into Cliente (Nombre,FechaNacimiento,Sexo) values ('Esmeralda Ramírez', Cast('14/11/96' as date),'M');