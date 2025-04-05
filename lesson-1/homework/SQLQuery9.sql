DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id INT primary key,
	title VARCHAR(50),
	author VARCHAR(50),
	published_year INT
);

DROP TABLE IF EXISTS member;

CREATE TABLE member
(
	member_id INT primary key,
	name VARCHAR(50),
	email VARCHAR(100),
	phone_number VARCHAR(50)
);

DROP TABLE IF EXISTS loan;

CREATE TABLE loan
(
	loan_id INT primary key,
	book_id INT foreign key references book(book_id),
	member_id INT foreign key references member(member_id),
	loan_date DATE,
	return_date DATE
);

INSERT INTO book (book_id, title, author, published_year)
VALUES
	(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925),
	(2, '1984', 'George Orwell', 1949);

INSERT INTO member (member_id, name, email, phone_number)
VALUES
	(1, 'Alice Johnson', 'alice.johnson@example.com', '123-456-7890'),
	(2, 'Bob Smith', 'bob.smith@example.com', '987-654-3210');

INSERT INTO loan (loan_id, book_id, member_id, loan_date, return_date)
VALUES
	(1, 1, 1, '2025-04-01', '2025-05-01'),
	(2, 2, 2, '2025-04-02', '2025-05-02');

SELECT * FROM book
SELECT * FROM member
SELECT * FROM loan