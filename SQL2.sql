CREATE TABLE ogrenciler
(
	ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date
);
--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS
SELECT isim,soyisim,not_ort FROM ogrenciler;
INSERT INTO ogrenciler VALUES('1234567','NAGEHAN','KAMA',90.5,'2023.01.08'); 
INSERT INTO ogrenciler(isim,soyisim)VALUES('MEVLUT','KAMA');
SELECT * FROM ogrenciler;