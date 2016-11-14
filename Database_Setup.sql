DROP DATABASE D0018E_Webshop;

CREATE DATABASE D0018E_Webshop;

USE D0018E_Webshop;

CREATE TABLE Category
(
	id 		smallint 	AUTO_INCREMENT,
	name 	varchar(127),
	parent 	smallint,
	PRIMARY KEY (id)
);

CREATE TABLE Product
(
	id 				smallint 	AUTO_INCREMENT,
	name 			varchar(127) 	NOT NULL,
	description 	text,
	picture 		varchar(127),
	category 		smallint,
	price 			float 		NOT NULL,
	stock 			smallint 	NOT NULL 	DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY (category) REFERENCES Category(id)
);

CREATE TABLE Campain
(
	id 			smallint 	AUTO_INCREMENT,
	start_date 	timestamp 	DEFAULT CURRENT_TIMESTAMP(),
	end_date 	timestamp,
	picture 	varchar(127),
	PRIMARY KEY (id)
);

CREATE TABLE CampainProducts
(
	campain 	smallint 	NOT NULL,
	product 	smallint 	NOT NULL,
	price_mod 	smallint 	NOT NULL,
	FOREIGN KEY (campain) REFERENCES Campain(id),
	FOREIGN KEY (product) REFERENCES Product(id)
);

CREATE TABLE Customer
(
	id 			smallint 	AUTO_INCREMENT,
	name 		varchar(127),
	p_nr 		char(11),
	adress 		varchar(127),
	email 		varchar(127),
	phone_nr 	varchar(31),
	password 	char(32),
	picture 	varchar(127),
	PRIMARY KEY (id)
);

CREATE TABLE ShoppingCart
(
	id 			smallint 	NOT NULL AUTO_INCREMENT,
	products 	text,
	customer 	smallint,
	PRIMARY KEY (id),
	FOREIGN KEY (customer) REFERENCES Customer(id)
);

CREATE TABLE Delivery
(
	id 			smallint 		NOT NULL AUTO_INCREMENT,
	customer 	smallint,
	adress 		varchar(127) 	NOT NULL,
	payed 		boolean 		NOT NULL 	DEFAULT false, 
	shipped 	boolean 		NOT NULL 	DEFAULT false,
	cart 		smallint 		NOT NULL,
	oder_date 	date,
	PRIMARY KEY (id),
	FOREIGN KEY (customer) REFERENCES Customer(id),
	FOREIGN KEY (cart) REFERENCES ShoppingCart(id)
);

