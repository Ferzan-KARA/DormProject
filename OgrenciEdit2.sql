CREATE TRIGGER edit_ogrenci --öðrenci verileri düzenlendiðinde devreye giren trigger.
ON dbo.Ogrenci
FOR UPDATE 
AS BEGIN
	IF NOT UPDATE(oTcNo)
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
	declare @o_dogumYil char(4)
	declare @dogumYer varchar(20)
	declare @sifre varchar(20)
	SELECT @tcNo=oTcNo, @ad=ad, @soyad=soyad, @telNo=oTelNo, @email=email, @okuduguBolum=okuduguBolum, @veliTc=veliTc, @vTelNo=vTelNo, @v_Ad=v_Ad, @v_Soyad=v_Soyad, @akrabalikDerece=akrabalikDerece,@o_dogumYil=o_dogumYil,@dogumYer=dogumYer, @sifre=sifre FROM inserted

		SELECT oTcNo, ad, soyad, oTelNo, email, okuduguBolum, veliTc, vTelNo, v_Ad, v_Soyad, akrabalikDerece, o_dogumYil, dogumYer, sifre FROM dbo.Ogrenci WHERE @tcNo=oTcNo

		UPDATE Ogrenci
		SET ad=@ad, soyad=@soyad, oTelNo=@telNo, email=@email, okuduguBolum=@okuduguBolum, veliTc=@veliTc, vTelNo=@vTelNo, v_Ad=@v_Ad, v_Soyad=@v_Soyad, akrabalikDerece=@akrabalikDerece, o_dogumYil=@o_dogumYil, dogumYer=@dogumYer, sifre=@sifre
		WHERE oTcNo=@tcNo
	
	SELECT @tcNo=oTcNo, @ad=ad, @soyad=soyad, @telNo=oTelNo, @email=email, @okuduguBolum=okuduguBolum, @veliTc=veliTc, @vTelNo=vTelNo, @v_Ad=v_Ad, @v_Soyad=v_Soyad, @akrabalikDerece=akrabalikDerece,@o_dogumYil=o_dogumYil, @dogumYer=dogumYer, @sifre=sifre FROM inserted --aradaki farký görmek için koyduk.
	END;
END;

/*Bunun için önerilen kullaným yöntemi: veriyi Insert (varsa Update) komutu ile Ogrenci tablosuna göndersin zaten gönderiliince bu trigger otomatik olarak devreye girip verileri eþleyecek.*/