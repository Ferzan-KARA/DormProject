CREATE TRIGGER log_yemek --yemek tablosuna veri girildi�inde verinin girdi�ini belirten logu d�nd�ren trigger.
ON dbo.yemek_listesi_view
INSTEAD OF INSERT AS
BEGIN
	INSERT INTO Yemek SELECT * FROM inserted
	INSERT INTO YemekKayitlari values('Veri girisi basarili',getdate())
END;

