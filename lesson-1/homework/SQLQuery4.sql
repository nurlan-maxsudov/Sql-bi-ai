DROP TABLE IF EXISTS category

CREATE TABLE category
(
	category_id INT primary key,
	category_name VARCHAR(255)
);

DROP TABLE IF EXISTS item

CREATE TABLE item
(
	item_id INT primary key,
	item_name VARCHAR(255),
	category_id INT foreign key references category(category_id)
);

ALTER TABLE item
DROP CONSTRAINT FK__item__category_i__44FF419A;

ALTER TABLE item 
ADD CONSTRAINT FK_item_category FOREIGN KEY (category_id) REFERENCES category(category_id)