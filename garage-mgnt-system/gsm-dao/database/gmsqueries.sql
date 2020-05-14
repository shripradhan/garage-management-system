/*use gmsdb;

CREATE TABLE customer_tbl (
    cust_id int NOT NULL AUTO_INCREMENT,
    full_name varchar(255) NOT NULL,
    mob_no bigint,
    address varchar(300),
    email varchar(255),
    vehicle_no varchar(30),
    vehicle_model varchar(30),
    engine_no varchar(30),
    chesis_no varchar(30),
    job_card_no varchar(30),
    PRIMARY KEY (cust_id)
);*/  

use gmsdb;
CREATE TABLE vehicle_service_tbl (
    service_id int NOT NULL AUTO_INCREMENT,
    service_type varchar(255) NOT NULL,
    service_date  varchar(255),
    km_driven int,
    ser_work varchar(500),
    service_charge decimal(65,2),
    mechanic_id int,
	cust_id int,
    PRIMARY KEY (service_id),
    FOREIGN KEY (cust_id) REFERENCES customer_tbl(cust_id)
); 

use gmsdb;
CREATE TABLE product_charge_tbl (
    product_charge_id int NOT NULL AUTO_INCREMENT,
    product_id int NOT NULL,
    product_qty int,
    product_price decimal(65,2),
	service_id int,
    PRIMARY KEY (product_charge_id),
    FOREIGN KEY (service_id) REFERENCES vehicle_service_tbl(service_id)
);   


use gmsdb;
CREATE TABLE labour_charge_tbl (
    labour_charge_id int NOT NULL AUTO_INCREMENT,
    labour_id int NOT NULL,
    labour_charge_desc varchar(255) NULL,
    labour_charge decimal(65,2),
	service_id int,
    PRIMARY KEY (labour_charge_id),
    FOREIGN KEY (service_id) REFERENCES vehicle_service_tbl(service_id)
);

use gmsdb;
CREATE TABLE employee_tbl (
    emp_id int NOT NULL AUTO_INCREMENT,
    emp_name varchar(255) NOT NULL,
    emp_email varchar(255) NULL,
    emp_address varchar(255) NOT NULL,
    emp_mob_no bigint NOT NULL,
    emp_designation varchar(255) NOT NULL,
    PRIMARY KEY (emp_id)
);

INSERT INTO employee_tbl VALUES(1,'Tushar Pradhan','tushar@gmail.com','Vilam',7769895412,'Mechanic');
INSERT INTO employee_tbl VALUES(2,'Tejas Thakare','tejas@gmail.com','Chandrapur',9985652365,'Mechanic');
INSERT INTO employee_tbl VALUES(3,'Shrikant Pradhan','tejas@gmail.com','Chandrapur',9985652365,'Mechanic');
INSERT INTO employee_tbl VALUES(4,'Ram Tiwari','tejas@gmail.com','Chandrapur',9985652365,'Mechanic');
INSERT INTO employee_tbl VALUES(5,'Kishor Kumar','tejas@gmail.com','Chandrapur',9985652365,'Mechanic');
INSERT INTO employee_tbl VALUES(6,'Virat Kohali','tejas@gmail.com','Chandrapur',9985652365,'Mechanic');
INSERT INTO employee_tbl VALUES(7,'Shrikant Ashok Pradhan','shripradhan@gmail.com','Chandrapur',9985652365,'Mechanic');




use gmsdb;
CREATE TABLE insurance_tbl (
    inc_id int NOT NULL AUTO_INCREMENT,
    ins_com_name varchar(255) NOT NULL,
    mno bigint NULL,
    address varchar(255) NOT NULL,
    email varchar(255) NULL,
    gst_in varchar(255) NOT NULL,
	pan_no varchar(255) NOT NULL,
    PRIMARY KEY (inc_id)
);

INSERT INTO insurance_tbl VALUES(1,'Bajaj Allianz General Insurance','07124526523','Mumbai','bajajinsurance@gmail.com','GST050022','ECW56GY5632');