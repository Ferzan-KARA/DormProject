CREATE TRIGGER log_yemek --yemek tablosuna veri girildiðinde verinin girdiðini belirten logu döndüren trigger.
ON dbo.yemek_listesi_view
INSTEAD OF INSERT AS
BEGIN
	INSERT INTO Yemek SELECT * FROM inserted
	INSERT INTO YemekKayitlari values('Veri girisi basarili',getdate())
END;

