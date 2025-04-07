DROP TABLE IF EXISTS test_identity;

CREATE TABLE test_identity(
    test_id INTEGER PRIMARY KEY IDENTITY(1,1),
    test_name NVARCHAR(127)
);

INSERT INTO test_identity VALUES('name1'), ('name2'), ('name3'), ('name4'), ('name5'), ('name6');
SELECT * FROM test_identity;

DROP TABLE test_identity;

select * from test_identity -- gives an error because the table is removed from the database;

--same table creation step after drop

DROP TABLE IF EXISTS test_identity;

CREATE TABLE test_identity(
    test_id INTEGER PRIMARY KEY IDENTITY(1,1),
    test_name NVARCHAR(127)
);

INSERT INTO test_identity VALUES('name1'), ('name2'), ('name3'), ('name4'), ('name5'), ('name6');
SELECT * FROM test_identity;

TRUNCATE TABLE test_identity;
SELECT * FROM test_identity; -- table exists but empty
INSERT INTO test_identity VALUES('name1'); -- identity is reset to initial value
SELECT * FROM test_identity; -- Now, the values starts with id 1, since we initialized it


--same table creation step after drop

DROP TABLE IF EXISTS test_identity;

CREATE TABLE test_identity(
    test_id INTEGER PRIMARY KEY IDENTITY(1,1),
    test_name NVARCHAR(127)
);

INSERT INTO test_identity VALUES('name1'), ('name2'), ('name3'), ('name4'), ('name5'), ('name6');
SELECT * FROM test_identity;

DELETE FROM test_identity; --table is empty, but identity is not reset.
INSERT INTO test_identity VALUES('name1') -- identity starts from 7
SELECT * FROM test_identity; -- test_id started from 7

SELECT NAME FROM sys.databases;