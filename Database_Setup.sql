DROP DATABASE D0018E_Webshop;

CREATE DATABASE D0018E_Webshop;

USE D0018E_Webshop;

CREATE TABLE schema_migrations 
(
    version     char(14)     NOT NULL, 
    PRIMARY KEY (version)
);

CREATE TABLE ar_internal_metadata (
    key         varchar     NOT NULL, 
    value       varchar,
    created_at  datetime    NOT NULL,
    updated_at  datetime    NOT NULL, 
    PRIMARY KEY (key)
);

CREATE TABLE Categories (
    id          INTEGER     NOT NULL    AUTO_INCREMENT, 
    name        varchar, 
    parent      integer, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL, 
    PRIMARY KEY (id)
);

CREATE TABLE Products (
    id          INTEGER     NOT NULL    AUTO_INCREMENT, 
    name        varchar     NOT NULL, 
    description text, 
    picture     varchar, 
    category_id integer,
    price       float       NOT NULL, 
    stock       integer     NOT NULL    DEFAULT 0, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL, 
    PRIMARY KEY (id),
	FOREIGN KEY (category) REFERENCES Categories(id)
);

CREATE TABLE Sales (
    id          INTEGER     NOT NULL AUTO_INCREMENT, 
    start_date  datetime    DEFAULT CURRENT_TIMESTAMP(), 
    end_date    datetime, 
    picture     varchar, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Sales_products (
    id          INTEGER     NOT NULL AUTO_INCREMENT, 
    sale_id     integer, 
    product_id  integer, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL,
    price_mod   float, 
    PRIMARY KEY (id),
    FOREIGN KEY (campain) REFERENCES Sales(id),
	FOREIGN KEY (product) REFERENCES Products(id)
);

CREATE TABLE Customers (
    id              INTEGER     NOT NULL AUTO_INCREMENT, 
    name            varchar, 
    p_nr            char(11), 
    adress          varchar, 
    zip             integer, 
    city            varchar, 
    email           varchar, 
    phone_nr        varchar, 
    password_digest varchar, 
    picture         varchar, 
    created_at      datetime    NOT NULL, 
    updated_at      datetime    NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Carts (
    id          INTEGER     AUTO_INCREMENT NOT NULL,
    products    text,
    customer_id integer,
    created_at  datetime    NOT NULL,
    updated_at  datetime    NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (customer) REFERENCES Customers(id)
);

CREATE TABLE Deliveries (
    id          INTEGER     NOT NULL AUTO_INCREMENT, 
    customer_id integer, 
    cart_id     integer     NOT NULL, 
    adress      varchar     NOT NULL, 
    zip         integer     NOT NULL, 
    city        varchar     NOT NULL, 
    payed       boolean     NOT NULL    DEFAULT false, 
    shipped     boolean     NOT NULL    DEFAULT false, 
    order_date  date, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (customer) REFERENCES Customers(id),
	FOREIGN KEY (cart_id) REFERENCES Carts(id)

);

