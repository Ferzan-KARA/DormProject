--CREATE DATABASE db_KaliteliYurt --ilk basta veritabanini kurmak icin kullandik

USE db_KaliteliYurt --veritabanini sectik

CREATE TABLE Ogrenci (
oTcNo char(11) not null CONSTRAINT pk_ogrenci PRIMARY KEY,--pk
ad varchar(20) not null,
soyad varchar(20) not null,
oTelNo char(10) not null CONSTRAINT ck_ogrTel UNIQUE,--unique
email varchar(50) not null CONSTRAINT ck_email UNIQUE CHECK (email like '@ogr.duzce.edu.tr%'), --unique
okuduguBolum varchar(3) not null CONSTRAINT ck_okuBolum CHECK (okuduguBolum='bm' OR okuduguBolum='eem' OR okuduguBolum='mm' OR okuduguBolum='im' OR okuduguBolum='tde' OR okuduguBolum='tip' OR okuduguBolum='fiz'),
veliTc char(11) not null,
vTelNo char(10) not null CONSTRAINT pk_velTel UNIQUE,--unique
v_Ad varchar(20) not null,
v_Soyad varchar(20) not null,
akrabalikDerece varchar(10) not null,
o_dogumYil char(4) not null CONSTRAINT ck_oDogyil CHECK (o_dogumYil between '1985' and '2010'),
dogumYer varchar(20) not null,
sifre varchar(20) not null,
--kayitTarih date CONSTRAINT df_kT DEFAULT (getdate()) CHECK (kayitTarih <= getdate()),
)

CREATE TABLE Personel (
pTcNo char(11) not null CONSTRAINT pk_Personel PRIMARY KEY,--pk
pTelNo char(10) not null CONSTRAINT uk_PerTel UNIQUE,--unique
ad varchar(20) not null,
soyad varchar(20) not null,
p_dogumYil char(4) not null CONSTRAINT ck_Pdogtar CHECK (p_dogumYil between '1950' and '2000'),
gorev varchar(15) not null,
gorevBaslangicYil char(4) not null, 
gorevBitisYil char(4) not null, 
mesaiSaat tinyint CONSTRAINT df_MSaat CHECK (mesaiSaat between 3 and 9) DEFAULT 8, --default sabah8-akþam5
sifre varchar(20) not null,
)

CREATE TABLE Yurt (
yTelNo char(10) not null CONSTRAINT pk_Yurt PRIMARY KEY,--pk
yurtAdres varchar(200) not null CONSTRAINT uk_Adres UNIQUE,--unique
yurtAd varchar(20) not null,
yurtKurulus date CONSTRAINT df_Yurt DEFAULT ('1971-06-06'),
tur char(1) not null CONSTRAINT ck_Yurt CHECK (Tur IN ('D','O')),
toplamYatakSayi smallint not null,
kalanYatakSayi smallint not null,
personelSayi smallint not null,
)

CREATE TABLE Izin (
izin_ID int not null CONSTRAINT pk_izin PRIMARY KEY identity(1,1), --pk
telNo char(10) /*CONSTRAINT df_iTel DEFAULT (SELECT oTelNo FROM Ogrenci WHERE oTcNo = (SELECT oTcNo FROM Izin))*/,
i_email varchar(50) /*CONSTRAINT df_iEmail DEFAULT (SELECT email FROM Ogrenci WHERE oTcNo = (SELECT oTcNo FROM Izin))*/,
izinBasla varchar(11) not null,
izinBitir varchar(11) not null,
lokasyon varchar(15) not null,
aciklama varchar(200),
oTcNo char(11) not null, CONSTRAINT fk_ogrenci FOREIGN KEY (oTcNo) --fk
    REFERENCES Ogrenci(oTcNo)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

CREATE TABLE Yemekhane (
sabahOgun varchar(20) not null, --pk
aksamOgun varchar(20) not null,--pk
CONSTRAINT pk_sAOgun PRIMARY KEY (sabahOgun, aksamOgun), --composite primary key 
cikacakYemekSayi tinyint not null,
ogun1BaslamaSaat time not null,
ogun1BitisSaat time not null,
ogun2BaslamaSaat time not null,
ogun2BitisSaat time not null,
)

CREATE TABLE Yemek (
gun date CONSTRAINT pk_Gun PRIMARY KEY not null, --pk
sabahOgun varchar(20) not null, --fk
aksamOgun varchar(20) not null, --fk 
icecek varchar(20) not null,
baslangic time not null,
anaYemek varchar(25) not null,
tarih date not null,
CONSTRAINT fk_sAOgun 
	FOREIGN KEY (sabahOgun,aksamOgun)
		REFERENCES Yemekhane(sabahOgun,aksamOgun)
			ON UPDATE CASCADE
			ON DELETE CASCADE
)

CREATE TABLE YemekKayitlari (
KayitID int not null CONSTRAINT pk_kID PRIMARY KEY identity(1,1),
Kayit varchar(50),
Tarih date,
)


CREATE TABLE SilinmisOgrenciKayitlari (
so_KayitID int not null CONSTRAINT pk_okID PRIMARY KEY identity(1,2),
so_ID char(11),
so_Ad varchar(20),
so_Soyad varchar(20),
so_Tel char(10),
so_Email varchar(50),
so_OkuBol varchar(3),
so_VeliID char(11),
so_VeliTel char(10),
so_VeliAd varchar(20),
so_VeliSoyad varchar(20),
so_AkDer varchar(10),
so_DogYil char(4),
so_DogYer varchar(20),
so_sifre varchar(20),
)

CREATE TABLE SilinmisPersonelKayitlari (
sp_KayitID int CONSTRAINT pk_pkID PRIMARY KEY identity(2,2),
sp_ID char(11),
sp_Tel char(10),
sp_ad varchar(20),
sp_soyad varchar(20),
sp_dogyil char(4),
sp_gorev varchar(15),
sp_gorBas char(4),
sp_gorBit char(4),
sp_mesai tinyint,
)