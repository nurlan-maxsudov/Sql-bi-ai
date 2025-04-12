--Order letters but 'b' must be first/last
--Order letters but 'b' must be 3rd (Optional)

create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

SELECT Letter
FROM letters
ORDER BY 
	CASE
	WHEN letter = 'b' then 0
	ELSE 1
	END,
	letter;

SELECT letter FROM letters
ORDER BY
	CASE
	WHEN letter = 'b' then 3
	ELSE 1
	END,
	letter;