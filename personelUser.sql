/*USE [master]
GO
CREATE LOGIN [Personel] WITH PASSWORD=N'personel', DEFAULT_DATABASE=[db_KaliteliYurt], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
use [db_KaliteliYurt];
GO
use [master];
GO
USE [db_KaliteliYurt]
GO
CREATE USER [Personel] FOR LOGIN [Personel]
GO*/

