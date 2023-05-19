-- 新增資料庫
create database CarParking default character set utf8;

-- 新增資料表
create table carparking.carstay 
(sl_id int primary key NOT NULL, 
cs_name varchar(50), 
cs_type varchar(50) , 
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
member_money int DEFAULT 0);

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
tr_read int DEFAULT 0,
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
py_read int DEFAULT 0,
FOREIGN KEY (license) REFERENCES license(license)
);

create table carparking.traffic
(parkingLot_id varchar(50) primary key,
parkingLot_name varchar(50),
monday JSON,
tuesday JSON,
wednesday JSON,
thursday JSON,
friday JSON,
saturday JSON,
sunday JSON);




-- 新增測試用資料
INSERT INTO `member`( `member_name`, `member_ac`, `member_pass`, `member_phone`, `member_email`, `member_money`) VALUES ('Andy','ANDY1234','pass1234','0912345678','andy12345@gmail.cin','0');
INSERT INTO `license`(`license`, `member_id`) VALUES ('ASD-1234','1');
INSERT INTO `license`(`license`, `member_id`) VALUES ('QWE-1234','1');
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 80, "[公有停車場] 台中公園", "2023/04/02", "19:00:01", "2023/04/02", "22:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 80, "[公有停車場] 台中公園", "2023/04/02", "19:00:01", "2023/04/02", "22:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 250, "[公有停車場] 廟東停車場", "2023/06/28", "10:00:01", "2023/06/28", "16:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 220, "[私人停車場]" "Car Parking", "2023/09/14", "08:40:01", "2023/09/14", "12:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 220, "[私人停車場]" "Car Parking", "2023/09/14", "08:40:01", "2023/09/14", "12:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 20, "[路邊停車] 黎民路公益路口", "2023/10/01", "15:00:01", "2023/10/01", "16:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("ASD-1234", 200, "[公有停車場] 南屯公園", "2023/09/01", "09:00:01", "2023/09/01", "16:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("QWE-1234", 40, "[公有停車場] 公益公園", "2023/08/08", "19:00:01", "2023/08/08", "21:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("QWE-1234", 140, "[公有停車場] 學府停車場", "2023/04/02", "12:00:01", "2023/04/02", "16:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("QWE-1234", 30, "[公有停車場] 南屯公園", "2023/04/01", "09:00:01", "2023/04/01", "16:13:30");
INSERT INTO `payment`(`license`, `py_amount`, `py_location`, `py_ps_d`, `py_ps_t`, `py_pe_d`, `py_pe_t`) VALUES ("QWE-1234", 90, "[私人停車場] Car Parking", "2023/04/21", "09:00:01", "2023/04/21", "12:13:30");