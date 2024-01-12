CREATE TABLE ogrenciler
(
	ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date
);
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler;
SELECT * FROM NOTLAR;
INSERT INTO NOTLAR VALUES('AYSE',86);
INSERT INTO NOTLAR VALUES('FATMA',76);
CREATE TABLE ogrenciler6
(
ogrenci_no char(7) UNIQUE,
isim varchar(20) NOT NULL,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
SELECT * FROM ogrenciler6;
insert into ogrenciler6 values('1234567','nagehan','kama',90.5,now());
insert into ogrenciler6 values('1234568','yavuz selim','kama',90.5,now());

CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
-- FOREIGN KEY OLUSTURMA
CREATE TABLE TEDARIKCILER3
(
TEDARIKCI_ID CHAR(5) PRIMARY KEY,
TEDARIKCI_ISMI VARCHAR(20),
ILETISIM_ISMI VARCHAR(20)
);
CREATE TABLE URUNLER(
TEDARIKCI_ID CHAR(5),
URUN_ID CHAR(5),
FOREIGN KEY (TEDARIKCI_ID) REFERENCES TEDARIKCILER3(TEDARIKCI_ID)
);
-- CHECK CONSTRINT
CREATE TABLE CALISANLAR
(
ID VARCHAR(15) PRIMARY KEY,
ISIM VARCHAR(30) UNIQUE,
MAAS INT CHECK (MAAS>10000),
ISE_BASLAMA DATE
);
INSERT INTO CALISANLAR VALUES('10002','NAGEHAN KAMA',40000,'2024-02-12');
SELECT * FROM CALISANLAR;
--DQL-- WHERE KULLANIMI
SELECT ISIM FROM CALISANLAR;
 SELECT ISIM,MAAS FROM CALISANLAR WHERE MAAS>5000;























































