/*USE [master]
GO
CREATE LOGIN [Admin] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Admin]
GO
use [db_KaliteliYurt];
GO
use [master];
GO
use [db_KaliteliYurt];
GO
use [master];
GO
USE [db_KaliteliYurt]
GO
CREATE USER [Admin] FOR LOGIN [Admin]
GO
USE [db_KaliteliYurt]
GO
ALTER ROLE [db_owner] ADD MEMBER [Admin]
GO
use [master];
GO
use [db_KaliteliYurt];
GO
USE [master]
GO
CREATE USER [Admin] FOR LOGIN [Admin]
GO*/
