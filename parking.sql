-- 新增資料庫
create database CarParking default character set utf8;

-- 新增資料表
create table carparking.carstay 
(sl_id int primary key NOT NULL, 
cs_name varchar(50), 
cs_type varchar(10) , 
cs_water varchar(5), 
cs_toilet varchar(5),
cs_lng varchar(12) ,
cs_lat varchar(12));

create table carparking.member
(member_id int primary key NOT NULL AUTO_INCREMENT, 
member_name  varchar(20),
member_ac  varchar(50), 
member_pass varchar(50) , 
member_phone varchar(50), 
member_email varchar(50),
member_money int DEFAULT 0,
member_image varchar(100));
create table carparking.license 
(license varchar(10) primary key NOT NULL , 
member_id int, 
FOREIGN KEY (member_id) REFERENCES member(member_id));

create table carparking.traderecord 
(tr_id int primary key NOT NULL AUTO_INCREMENT, 
member_id int, 
tr_amount varchar(10) , 
tr_date date, 
tr_time time,
tr_location varchar(50) ,
tr_counterparty varchar(50),
tr_type int,
tr_ps varchar(50),
tr_pe varchar(50),
FOREIGN KEY (member_id) REFERENCES member(member_id));

create table carparking.payment
(
py_id int primary key NOT NULL AUTO_INCREMENT, 
license varchar(10)  NOT NULL , 
py_amount varchar(10),
py_location varchar(50),
py_ps_d varchar(50),
py_ps_t varchar(50),
py_pe_d varchar(50),
py_pe_t varchar(50),
FOREIGN KEY (license) REFERENCES license(license)
);

create table carparking.traffic
(parkingLot_id int,
parkingLot_name varchar(50),
monday JSON,
tuesday JSON,
wednesday JSON,
thursday JSON,
ftiday JSON,
saturday JSON,
sunday JSON);




-- 新增測試用資料
INSERT INTO traderecord VALUES (1,1,'100000','2023/4/17','00:06:53',"taiwan","counterparty",1)
INSERT INTO traffic(parkingLot_id,parkingLot_name,monday) VALUES (1,'台中停車場','{"h1":20,"h2":20,"h3":30,"h4":30}')