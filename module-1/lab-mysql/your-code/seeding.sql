###### CHALLENGE 3 -- SEEDING THE DATABASE ########
###################################################

# STEP 0: Delete the table that we created in the 2nd challenge

 DROP TABLE cars;

# STEP 1: Creating all the tables with all its fields and its types (including the primary key)

# Car table
CREATE TABLE cars (
    car_id VARCHAR(5)     NOT NULL,
    VIN  VARCHAR(30)      NOT NULL,
    manufacturer  VARCHAR(30)      NOT NULL,
    model  VARCHAR(30)      NOT NULL,
    year  VARCHAR(4)      NOT NULL,
    color  VARCHAR(15)      NOT NULL,
    PRIMARY KEY(car_id));

# Customers table
CREATE TABLE  customers(
    cust_id VARCHAR(20)     NOT NULL,
    customer_identification VARCHAR(20)     NOT NULL,
    name  VARCHAR(30)      NOT NULL,
    phone  VARCHAR(30)      NOT NULL,
    email  VARCHAR(20)       NULL, # The email can be null because with the phone number as compulsory, we are able to contact the customer.
    address  VARCHAR(30)     NOT NULL,
    city  VARCHAR(30)      NOT NULL, 
    state_province  VARCHAR(15)     NOT NULL, 
    country  VARCHAR(15)      NOT NULL,
    postal  VARCHAR(10)      NOT NULL, 
    PRIMARY KEY(cust_id));

# Salespersons table
CREATE TABLE salespersons (
	salespersons_id VARCHAR(100) NOT NULL,
    staff_id VARCHAR(20)     NOT NULL,
    name  VARCHAR(30)      NOT NULL,
    store  VARCHAR(30)      NOT NULL,
    PRIMARY KEY(salespersons_id));

# Invoices table
CREATE TABLE invoices (
	invoice_id VARCHAR(5)     NOT NULL,
	invoice_number VARCHAR(30) NOT NULL,
    date  TEXT      NOT NULL,
    car  VARCHAR(5)      NOT NULL,
    customer  VARCHAR(20)      NOT NULL,
    sales_person  VARCHAR(20)      NOT NULL,
    PRIMARY KEY(invoice_id));


# STEP 3: Inserting data into the tables

# Car table

INSERT INTO `cars` (`car_id`, `VIN`, `manufacturer`, `model`, `year`,`color`)  VALUES 
('0','3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
('1','ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
('2','RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
('3','HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
('4','DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
('5','DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');

# Customers table
INSERT INTO `customers` (`cust_id`,`customer_identification`, `name`, `phone`, `email`, `address`,`city`,`state_province`,`country`,`postal`)  VALUES 
(0,10001,'Pablo Picasso','+34 636 17 63 82','','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045),
(1,20001,'Abraham Lincoln','+1 305 907 7086','','120 SW 8th St','Miami','Florida','United States',33130),
(2,30001,'Napoléon Bonaparte','+33 1 79 75 40 00','','40 Rue du Colisée','Paris','Île-de-France','France',75008);

# Salespersons table
INSERT INTO `salespersons` (`salespersons_id`,`staff_id`,`name`, `store`)  VALUES 
(0,00001,'Petey Cruiser','Madrid'),
(1,00002,'Anna Sthesia','Barcelona'),
(2,00003,'Paul Molive','Berlin'),
(3,00004,'Gail Forcewind','Paris'),
(4,00005,'Paige Turner','Mimia'),
(5,00006,'Bob Frapples','Mexico City'),
(6,00007,'Walter Melon','Amsterdam'),
(7,00008,'Shonda Leer','São Paulo');


# Invoices table
INSERT INTO `invoices` (`invoice_id`,`invoice_number`,`date`, `car`,`customer`,`sales_person`)  VALUES 
(0,852399038,'22-08-2018',0,1,3),
(1,731166526,'31-12-2018',3,0,5),
(2,271135104,'22-01-2019',2,2,7);


