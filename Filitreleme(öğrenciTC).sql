USE db_KaliteliYurt
GO

CREATE PROCEDURE tcFiltre @Tc nvarchar(11)
AS
SELECT *
FROM Ogrenci WHERE oTcNo LIKE '%'+@Tc+'%'
GO

--EXEC tcFiltre @Tc = [yap�lan_tc_input]