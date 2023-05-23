CREATE TRIGGER Delet_Personel --personel verileri silindiðinde devreye giren trigger. verileri siler ve loglar.
ON dbo.Personel
FOR DELETE
AS 
BEGIN
	declare @p_ID char(11)
	declare @telNo char(10)
	declare @ad varchar(20)
	declare @soyad varchar(20)
	declare @p_dogumYil char(4)
	--declare @dogumYer varchar(20)
	declare @unvan varchar(15)
	declare @gorBas char(4)
	declare @gorBit char(4)
	declare @mesai tinyint
	declare @sifre varchar(20)

	--SELECT pTcNo, pTelNo, ad, soyad, p_dogumYil, gorevBaslangicYil, gorevBitisYil, mesaiSaat, sifre FROM deleted
	SELECT @p_ID=pTcNo, @telNo=pTelNo, @ad=ad, @soyad=soyad, @p_dogumYil=p_dogumYil,@unvan=gorev,@gorBas=gorevBaslangicYil,@gorBit=gorevBitisYil,@mesai=mesaiSaat,@sifre=sifre FROM deleted
	--SET pTcNo=@p_ID,pTelNo=@telNo,ad=@ad,soyad=@soyad,p_dogumYil=@p_dogumYil,gorevBaslangicYil=@gorBas,gorevBitisYil=@gorBit,mesaiSaat=@mesai,sifre=@sifre

	INSERT INTO SilinmisPersonelKayitlari values(@p_ID,@telNo,@ad,@soyad,@p_dogumYil,@unvan,@gorBas,@gorBit,@mesai)

END;
