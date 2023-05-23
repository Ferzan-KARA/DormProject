CREATE TRIGGER Delet_Ogrenci --öðrenci verileri silindiðinde devreye giren trigger.
ON dbo.Ogrenci
FOR DELETE
AS 
BEGIN
	declare @tcNo char(11)
	declare @ad varchar(20)
	declare @soyad varchar(20)
	declare @telNo char(10)
	declare @email varchar(50)
	declare @okuduguBolum varchar(3)
	declare @veliTc char(11)
	declare @vTelNo char(10)
	declare @v_Ad varchar(20)
	declare @v_Soyad varchar(20)
	declare @akrabalikDerece varchar(10)
	declare @o_dogumYil date
	declare @dogumYer varchar(20)
	declare @sifre varchar(20)

	SELECT @tcNo=oTcNo, @ad=ad, @soyad=soyad, @telNo=oTelNo, @email=email, @okuduguBolum=okuduguBolum, @veliTc=veliTc, @vTelNo=vTelNo, @v_Ad=v_Ad, @v_Soyad=v_Soyad, @akrabalikDerece=akrabalikDerece,@o_dogumYil=o_dogumYil,@dogumYer=dogumYer, @sifre=sifre FROM deleted

	INSERT INTO SilinmisOgrenciKayitlari values(@tcNo,@ad,@soyad,@telNo,@email,@okuduguBolum,@veliTc,@vTelNo,@v_Ad,@v_Soyad,@akrabalikDerece,@o_dogumYil,@dogumYer,@sifre)

END;


	










	/*	SELECT @tcNo=oTcNo, @ad=ad, @soyad=soyad, @telNo=oTelNo, @email=email, @okuduguBolum=okuduguBolum, @veliTc=veliTc, @vTelNo=vTelNo, @v_Ad=v_Ad, @v_Soyad=v_Soyad, @akrabalikDerece=akrabalikDerece, @kayitTarih=kayitTarih, @o_dogumTarih=o_dogumTarih, @dogumYer=dogumYer, @sifre=sifre FROM inserted

		SELECT oTcNo, ad, soyad, oTelNo, email, okuduguBolum, veliTc, vTelNo, v_Ad, v_Soyad, akrabalikDerece, kayitTarih, o_dogumTarih, dogumYer, sifre FROM dbo.Ogrenci WHERE @tcNo=oTcNo AS Silinen Ogrenci Tablolari

		/*UPDATE Ogrenci
		SET ad=@ad, soyad=@soyad, oTelNo=@telNo, email=@email, okuduguBolum=@okuduguBolum, veliTc=@veliTc, vTelNo=@vTelNo, v_Ad=@v_Ad, v_Soyad=@v_Soyad, akrabalikDerece=@akrabalikDerece, kayitTarih=@kayitTarih, o_dogumTarih=@o_dogumTarih, dogumYer=@dogumYer, sifre=@sifre
		WHERE oTcNo=@tcNo*/
	
	SELECT @tcNo=oTcNo, @ad=ad, @soyad=soyad, @telNo=oTelNo, @email=email, @okuduguBolum=okuduguBolum, @veliTc=veliTc, @vTelNo=vTelNo, @v_Ad=v_Ad, @v_Soyad=v_Soyad, @akrabalikDerece=akrabalikDerece, @kayitTarih=kayitTarih, @o_dogumTarih=o_dogumTarih, @dogumYer=dogumYer, @sifre=sifre FROM inserted
    SELECT ad FROM Ogrenci 
