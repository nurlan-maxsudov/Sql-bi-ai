DROP TABLE IF EXISTS data_types_demo;
CREATE TABLE data_types_demo
(
	tint_int TINYINT,
	s_int SMALLINT,
	n_int INT,
	b_int BIGINT,
	d_decimal DECIMAL(10, 3),
	f_float FLOAT,
	ch_char CHAR(50),
	n_char NCHAR(50),
	v_char VARCHAR(50),
	nv_char NVARCHAR(50),
	d_date DATE,
	t_time TIME,
	dt_datetime DATETIME,
	varbnry VARBINARY(MAX)
);

INSERT INTO data_types_demo
VALUES
	(255,
	32767,
	2147483647,
	9200000000,
	12345.123,
	12334.34,
	'Hello world',
	'Привет мир',
	'Hello world babe',
	'Привет мир детка',
	'2025-04-7',
	'11:36',
	'2025-04-7 11:36',
	(SELECT * FROM OPENROWSET(BULK '‪C:\Users\ids\Documents\Maxsudov_FSE2.pdf', SINGLE_BLOB) AS pdf_file)
);

SELECT * FROM data_types_demo