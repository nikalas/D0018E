CREATE DATABASE D0018E_Webshop;

USE D0018E_Webshop;

CREATE TABLE Category
(
	id 		smallint 	NOT NULL AUTO_INCREMENT,
	name 	varchar 	NOT NULL,
	parent 	smallint,
	PRIMARY KEY (id),
	--FOREIGN KEY (parent) REFERENCES Category(id)
);

CREATE TABLE Product
(
	id 				smallint 	NOT NULL AUTO_INCREMENT,
	name 			varchar 	NOT NULL,
	description 	varchar,
	picture 		varchar,
	category 		smallint,
	price 			float 		NOT NULL,
	stock 			smallint 	NOT NULL 	DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY (category) REFERENCES Category(id)
);

CREATE TABLE Campain
(
	id 			smallint 	NOT NULL AUTO_INCREMENT,
	start_date 	timestamp 	DEFAULT GETDATE(),
	end_date 	timestamp,
	picture 	varchar,
	PRIMARY KEY (id)
);

CREATE TABLE CampainProducts
(
	campain 	smallint 	NOT NULL,
	product 	smallint 	NOT NULL,
	price_mod 	smallint 	NOT NULL,
	FOREIGN KEY (campain) REFERENCES Campain(id),
	FOREIGN KEY (product) ERFERENCES Product(id)
);

CREATE TABLE Customer
(
	id 			smallint 	NOT NULL AUTO_INCREMENT,
	name 		varchar,
	p_nr 		char(11),
	adress 		varchar,
	email 		varchar,
	phone_nr 	varchar,
	password 	char(32),
	picture 	varchar,
	PRIMARY KEY (id)
);

CREATE TABLE ShoppingCart
(
	id 			smallint 	NOT NULL AUTO_INCREMENT,
	products 	varchar,
	customer 	smallint,
	PRIMARY KEY (id),
	FOREIGN KEY (customer) REFERENCES Customer(id)
);

CREATE TABLE Delivery
(
	id 			smallint 	NOT NULL AUTO_INCREMENT,
	customer 	smallint,
	adress 		varchar 	NOT NULL,
	payed 		boolean 	NOT NULL 	DEFAULT false, 
	shipped 	boolean 	NOT NULL 	DEFAULT false,
	--collinummer
	--tracking link
	cart 		smallint 	NOT NULL,
	oder_date 	date 		DEFAULT GETDATE(),
	PRIMARY KEY (id),
	FOREIGN KEY (customer) REFERENCES Customer(id),
	FOREIGN KEY (cart) REFERENCES ShoppingCart(id)
);

