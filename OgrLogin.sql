--login: select ile verileri db den al�p kar��la�t�r.

/*SELECT oTcNo,sifre FROM Ogrenci WHERE oTcNo='cookiename' AND  sifre='cookiepass' --buras� izinde de kullan�labilir.

/*SELECT pTcNo,sifre FROM Personel WHERE oTcNo='cookiename' AND  sifre='cookiepass'

if (oTcNo=!'cookiename' OR sifre=!'cookiepass')
return err*/

/*CREATE PROCEDURE ogr_giris 
AS
	declare @kullanici char(11)
	declare @sifre varchar(20)

	SELECT @kullanici=oTcNo,@sifre=sifre FROM Ogrenci WHERE oTcNo='cookiename' AND  sifre='cookiepass'
	IF (@kullanici='cookiename' OR @sifre='cookiepass')
	BEGIN
		RETURN
	END;

	ELSE
	BEGIN
		RETURN
	END;

GO;*/ --EXEC ogr_giris