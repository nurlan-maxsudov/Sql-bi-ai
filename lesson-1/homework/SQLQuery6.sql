DROP TABLE IF EXISTS customer;

CREATE TABLE customer
(
	customer_id INT primary key,
	name VARCHAR(50),
	city VARCHAR(50)
);

INSERT INTO customer (customer_id, name)
SELECT 101, 'Nurlan';

ALTER TABLE customer
DROP CONSTRAINT [DF__customer__city__4E88ABD4]

ALTER TABLE customer
ADD CONSTRAINT DF_customer_city default 'Unknown' for city;


SELECT * FROM customer;