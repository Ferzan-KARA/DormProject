CREATE TRIGGER edit_personel --PERSONEL verileri düzenlendiðinde devreye giren trigger.
ON dbo.Personel
FOR UPDATE 
AS BEGIN
	IF NOT UPDATE(pTcNo)
BEGIN
	declare @p_ID char(11)
	declare @telNo char(10)
	declare @ad varchar(20)
	declare @soyad varchar(20)
	declare @p_dogumYil date
	declare @dogumYer varchar(20)
	declare @unvan varchar(15)
	declare @basYil char(4)
	declare @bitYil char(4)
	declare @mesai tinyint
	/*declare @sifre varchar(20)*/
	SELECT @p_ID=pTcNo, @telNo=pTelNo, @ad=ad, @soyad=soyad, @p_dogumYil=p_dogumYil,@dogumYer=dogumYer,@unvan=gorev,@basYil=gorevBaslangicTarih,@bitYil=gorevBitisTarih,@mesai=mesaiSaat/*,@sifre=sifre*/ FROM inserted

		UPDATE Personel
		SET pTcNo=@p_ID,pTelNo=@telNo,ad=@ad,soyad=@soyad,p_dogumYil=@p_dogumYil,dogumYer=@dogumYer,gorev=@unvan,gorevBaslangicTarih=@basYil,gorevBitisTarih=@bitYil,mesaiSaat=@mesai/*,sifre=@sifre*/
		WHERE pTcNo=@p_ID
	
	END;
END;
