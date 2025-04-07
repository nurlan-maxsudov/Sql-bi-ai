DROP TABLE IF exists photos;

CREATE TABLE photos(
    id INT IDENTITY PRIMARY KEY,
    IMAGE VARBINARY(max)
);

INSERT INTO photos 
SELECT * FROM OPENROWSET(
    BULK '‪C:\Users\ids\Pictures\Apple.png', SINGLE_BOLB
) AS IMAGE;