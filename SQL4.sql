-- TRUNCATE BIR TABLODAKI TUM VERILERI SILER
-- 


CREATE TABLE TALEBELER1(
ID CHAR(3) PRIMARY KEY,
ISIM VARCHAR(50),
VELI_ISIM VARCHAR(50),
YAZILI_NOTU INT
);
CREATE TABLE NOTLAR1
(
TALEBE_ID CHAR(3),
DERS_ADI VARCHAR(30),
YAZILI_NOTU INT,
CONSTRAINT NOTLAR1_FK FOREIGN KEY (TALEBE_ID) REFERENCES TALEBELER1(ID)
ON DELETE CASCADE
);
INSERT INTO TALEBELER1 VALUES(123,'NAGEHAN OZTURK KAMA','HALIL',98);
INSERT INTO TALEBELER1 VALUES(124,'MEVLUT KAMA','MUHITTIN',88);
INSERT INTO TALEBELER1 VALUES(125,'MELIKE KAMAGUCLU','MUHITTIN',88);
INSERT INTO TALEBELER1 VALUES(126,'MELTEM DENIZ','RUKIYE',78);

INSERT INTO NOTLAR1 VALUES('123','MATEMATIK',98);
INSERT INTO NOTLAR1 VALUES('124','FIZIK',88);
INSERT INTO NOTLAR1 VALUES('125','KIMYA',78);
INSERT INTO NOTLAR1 VALUES('126','BIYOLOJI',68);
SELECT * FROM TALEBELER1
SELECT * FROM NOTLAR1
--ON DELETE CASCADE KULLANIRSAK PARENT TABLE DAN VE CHILD TABLEDAN AYNI ANDA VERI SILEBIRIZ.
--KULLANMAZSAK ONCE CHILD TABLEDAN SONRA PARENT TABLEDEN VERIYI SILEBIRIZ.
-- IN CONDITION KULLANIMI SELECT * FROM TBLO ADI WHERE KATEGORISI IN ()ICINDE ISTENILEN KRITERLER OLACAK
-- NOT IN DE ICERMEYENLERI GETIRIR
 
--IN CONDITION: Instead of multiple OR we use IN
--8) Select records whose product name is Orange or Apple or Palm
--1.Way: Not recommended because of the repetition
select *
from customers_products
where product_name = 'Orange' or product_name = 'Apple' or product_name = 'Palm';

--2.Way:
select *
from customers_products
where product_name in ('Orange','Apple','Palm');

--NOT IN CONDITION
--9) Select recoords whose product name is not Orange or Apple or Palm
select *
from customers_products
where product_name not in ('Orange', 'Apple', 'Palm');

--BETWEEN CONDITION
--10) Select records whose product id is less than or equal to 30 and 
--   greater than or equal to 20
--1.Way: Not recommended because of the repetition
select *
from customers_products
where product_id <= 30 and product_id >= 20;

--2.Way: 
select *
from customers_products
where product_id between 20 and 30;--20 and 30 are inclusive

--11) Select records whose product id is less than 20 or greater than 25
--1.Way:
select *
from customers_products
where product_id < 20 or product_id > 25;

--2.Way:
select *
from customers_products
where product_id not between 20 and 25;--In Not between 20 and 25 are exclusive

--EXISTS CONDITION: EXISTS condition is used with Subquery.
--					If the Subquery returns any records outer query will be executed
--					If the Subquery does not return any record outer query will not be executed.
--					EXISTS can be used in SELECT, INSERT, UPDATE and DELETE commands
create table customers_likes
(
	product_id numeric(10),
	customer_name varchar(50),
	liked_product varchar(50)
);
insert into customers_likes values(10, 'Mark', 'Orange');
insert into customers_likes values(50, 'Mark', 'Pineapple');
insert into customers_likes values(60, 'John', 'Avocado');
insert into customers_likes values(30, 'Lary', 'Cherries');
insert into customers_likes values(20, 'Mark', 'Apple');
insert into customers_likes values(10, 'Adem', 'Orange');
insert into customers_likes values(40, 'John', 'Apricot');
insert into customers_likes values(20, 'Eddie', 'Apple');

--12) Update names to "No name" if there is Lary among names in customers_likes table
update customers_likes
set customer_name = 'No name'
where exists (select customer_name from customers_likes where customer_name = 'Lary');

--13) Delete records if there is 'Orange' as product_name in customers_likes table
delete from customers_likes
where exists (select liked_product from customers_likes where liked_product = 'Orange');

--14) Select customer names if the product id's are same in customers_products and customers_likes
select product_id, customer_name
from customers_products
where exists (select product_id from customers_likes where customers_products.product_id = customers_likes.product_id);
 
select * from customers_likes;

--SUBQUERY
create table employees
(
	id numeric(9),
	name varchar(50),
	state varchar(50),
	salary numeric(20),
	company varchar(20)
);
insert into employees values(123456789, 'John Walker', 'Florida', 2500, 'IBM');
insert into employees values(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
insert into employees values(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
insert into employees values(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
insert into employees values(123456789, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
insert into employees values(123456789, 'Brad Pitt', 'Texas', 2500, 'GOOGLE');
insert into employees values(123456789, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

create table companies
(
	company_id numeric(9),
	company varchar(20),
	number_of_employees numeric(20)
);
insert into companies values(100, 'IBM', 12000);
insert into companies values(101, 'GOOGLE', 18000);
insert into companies values(102, 'MICROSOFT', 10000);
insert into companies values(103, 'APPLE', 21000);

















