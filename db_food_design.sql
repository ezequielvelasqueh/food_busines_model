CREATE DATABASE food_business;
USE food_business;

-- In the first sales contact, the cashier requests basic information from the customer,
-- this is a security protocol.
CREATE TABLE customer (
customer_id SMALLINT,
customer_id_doc ENUM('DNI', 'Passport', 'Other') NOT NULL,
customer_firstname VARCHAR(20) NOT NULL,
customer_lastname1 VARCHAR(20) NOT NULL,
customer_lastname2 VARCHAR(20),
address VARCHAR(50),
district_id INT,
CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

-- The district information gives information not only for estimated delivery's costs and time,
-- but also future projects of geographical expansion.
CREATE TABLE districts(
district_id INT PRIMARY KEY,
district_name VARCHAR(30));

-- The menu table contain information about the category of foods, the food's name, and its price.
-- This information is called when the cashier is taking the order.
CREATE TABLE menu(
item_id SMALLINT PRIMARY KEY,
item_category ENUM('Starter','Main Course','Beverage', 'Dessert'),
item_name VARCHAR(30),
price_item float(4,2));

-- This table registers the payment mode. This is important for monitoring the business liquidity.
CREATE TABLE payments(
payment_id INT PRIMARY KEY,
payment_name ENUM('Effective', 'Debt Card', 'Credit Card', 'Coupon')
);

-- The service table registers the type of services. This information helps us to estimate the building capacity,
-- salso it allows us to know the effective income from delivery sales.
CREATE TABLE service(
service_id INT PRIMARY KEY,
service_name ENUM('Eat In', 'Take Out', 'Delivery')
);

-- This table register the sales operations, it use information previously asked.
CREATE TABLE orders(
ticket VARCHAR(15) PRIMARY KEY,
ticket_time DATETIME,
item_id SMALLINT NOT NULL,
quantity SMALLINT NOT NULL,
price_total float(4,2) NOT NULL,
service_id INT,
payment_id INT,
customer_id SMALLINT
);

