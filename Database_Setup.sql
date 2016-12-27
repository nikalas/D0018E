DROP DATABASE D0018E_Webshop;

CREATE DATABASE D0018E_Webshop;

USE D0018E_Webshop;

CREATE TABLE schema_migrations 
(
    version     char(14)     NOT NULL, 
    PRIMARY KEY (version)
);

/*CREATE TABLE ar_internal_metadata (
    key         varchar(127)     NOT NULL, 
    value       varchar(127),
    created_at  datetime    NOT NULL,
    updated_at  datetime    NOT NULL, 
    PRIMARY KEY (key)
);*/

CREATE TABLE categories (
    id          INTEGER     NOT NULL    AUTO_INCREMENT, 
    name        varchar(127), 
    parent      integer, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL, 
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id          INTEGER     NOT NULL    AUTO_INCREMENT, 
    name        varchar(127)     NOT NULL, 
    description text, 
    picture     varchar(127), 
    category_id integer,
    price       float       NOT NULL, 
    stock       integer     NOT NULL    DEFAULT 0, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL, 
    PRIMARY KEY (id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE sales (
    id          INTEGER     NOT NULL AUTO_INCREMENT, 
    start_date  datetime    DEFAULT CURRENT_TIMESTAMP(), 
    end_date    datetime, 
    picture     varchar(127), 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sales_products (
    id          INTEGER     NOT NULL AUTO_INCREMENT, 
    sale_id     integer, 
    product_id  integer, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL,
    price_mod   float, 
    PRIMARY KEY (id),
    FOREIGN KEY (sale_id) REFERENCES sales(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE customers (
    id              INTEGER     NOT NULL AUTO_INCREMENT, 
    name            varchar(127), 
    p_nr            char(11), 
    adress          varchar(127), 
    zip             integer, 
    city            varchar(127), 
    email           varchar(127), 
    phone_nr        varchar(127), 
    password_digest varchar(127), 
    picture         varchar(127), 
    created_at      datetime    NOT NULL, 
    updated_at      datetime    NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE carts (
    id          INTEGER     AUTO_INCREMENT NOT NULL,
    products    text,
    customer_id integer,
    created_at  datetime    NOT NULL,
    updated_at  datetime    NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE deliveries (
    id          INTEGER     NOT NULL AUTO_INCREMENT, 
    customer_id integer, 
    cart_id     integer     NOT NULL, 
    adress      varchar(127)     NOT NULL, 
    zip         integer     NOT NULL, 
    city        varchar(127)     NOT NULL, 
    payed       boolean     NOT NULL    DEFAULT false, 
    shipped     boolean     NOT NULL    DEFAULT false, 
    order_date  date, 
    created_at  datetime    NOT NULL, 
    updated_at  datetime    NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (cart_id) REFERENCES carts(id)

);
