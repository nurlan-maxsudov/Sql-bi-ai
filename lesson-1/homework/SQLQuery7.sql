DROP TABLE IF EXISTS invoice;

CREATE TABLE invoice
(
	invoice_id INT primary key identity,
	amount NUMERIC
);

INSERT INTO invoice
VALUES (5000);

SELECT * FROM invoice;

SET IDENTITY_INSERT invoice ON;
INSERT INTO invoice(invoice_id, amount)
SELECT 100, 7777;
