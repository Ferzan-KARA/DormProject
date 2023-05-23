USE db_KaliteliYurt
GO

CREATE PROCEDURE ad_filtre @isim nvarchar(11)
AS
SELECT *
FROM Ogrenci WHERE ad LIKE '%'+@isim+'%'
GO;

--EXEC ad_filtre @isim = [yapýlan_isim_input]