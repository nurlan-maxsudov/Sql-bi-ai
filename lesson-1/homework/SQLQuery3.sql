DROP TABLE IF EXISTS orders

CREATE TABLE orders
(
	order_id INT primary key,
	customer_name VARCHAR(50),
	order_date DATE
);

ALTER TABLE orders
DROP CONSTRAINT PK__orders__46596229508AA46D;

ALTER TABLE orders
ADD CONSTRAINT PK_orders_order_id PRIMARY KEY(order_id);
