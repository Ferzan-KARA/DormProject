CREATE PROCEDURE veritabani_cekme --yedekten çekme iþlemi için kullanýlan stored procedure.
AS
RESTORE DATABASE [db_KaliteliYurt] FROM  DISK = N'D:\MSSQL--Backups\KaliteliYurtBackup.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO


--EXEC veritabani_cekme; --çalýþtýrma komutu