CREATE TRIGGER ekle_personel --personele yetki veren trigger.
ON dbo.Personel
FOR INSERT
AS 
BEGIN
	declare @p_ID char(11)
--	declare @telNo char(10)
	declare @unvan varchar(15)
	declare @sifre varchar(20)
	
	INSERT INTO Personel SELECT * FROM inserted
	SELECT pTcNo=@p_ID FROM inserted
	SELECT /*pTelNo=@telNo*/ sifre=@sifre FROM inserted
	EXEC sp_addlogin @loginame=@p_ID, /*@passwd=@telNo*/ @passwd=@sifre
	EXEC sp_adduser @p_ID
	SELECT gorev=@unvan FROM Personel

	IF (@unvan='MEMUR' OR @unvan='memur')
	BEGIN
		GRANT SELECT on Personel to pTcNo
		GRANT SELECT,INSERT,DELETE on Ogrenci to pTcNo
		GRANT SELECT,INSERT,DELETE on SilinmisOgrenciKayitlari to pTcNo
		GRANT SELECT on Izin to pTcNo
		GRANT SELECT on Yemekhane to pTcNo
		GRANT SELECT on Yemek to pTcNo
	END;
	IF (@unvan='ASCI' OR @unvan='asci')
	BEGIN
		GRANT SELECT on Personel to pTcNo
		GRANT SELECT on Ogrenci to pTcNo
		GRANT SELECT,INSERT,DELETE on Yemekhane to pTcNo
		GRANT SELECT,INSERT,DELETE on Yemek to pTcNo
	END;
	IF (@unvan='GUVENLIK' OR @unvan='guvenlik')
	BEGIN
		GRANT SELECT on Personel to pTcNo
		GRANT SELECT on Ogrenci to pTcNo
		GRANT SELECT on Izin to pTcNo
	END;

END;
