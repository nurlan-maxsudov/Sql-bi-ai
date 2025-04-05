DROP TABLE IF EXISTS books;

CREATE TABLE books
(
	book_id INT primary key,
	title VARCHAR(255) check (title != ''),
	price NUMERIC check (price >0),
	genre VARCHAR(50) default 'Unknown'
);

INSERT INTO books (book_id, title, price)
VALUES
	(101, 'Pride and Prejudice', 75000),
	(102, 'War and Peace', 80000)
	
	--Everything works fine
SELECT * FROM books;