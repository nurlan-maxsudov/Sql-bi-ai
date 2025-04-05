DROP TABLE IF EXISTS product

CREATE TABLE product
(
	product_id INT unique,
	product_name VARCHAR(255),
	price NUMERIC
);
ALTER TABLE product
DROP CONSTRAINT UQ_product_id;

ALTER TABLE product
ADD CONSTRAINT UQ_product_product_id UNIQUE(product_id);

ALTER TABLE product
ADD CONSTRAINT UQ_product_product_id UNIQUE(product_id, product_name);

INSERT INTO product
SELECT 1, 'Car', 5000;

INSERT INTO product
SELECT 1, 'Car', 6000;