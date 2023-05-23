CREATE PROCEDURE veritabani_yedekleme --yedekleme iþlemi için kullanýlan stored procedure.
AS
	BACKUP DATABASE [db_KaliteliYurt] TO  DISK = N'D:\MSSQL--Backups\KaliteliYurtBackup.bak' WITH NOFORMAT, NOINIT,  NAME = N'db_KaliteliYurt-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	GO
GO; 

--EXEC veritabani_yedekleme; --execute için kullanýlacak olan komut