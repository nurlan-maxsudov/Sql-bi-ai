DROP TABLE IF EXISTS worker;

CREATE TABLE worker(
    id INTEGER PRIMARY KEY,
    name NVARCHAR(50)
);

BULK INSERT worker
FROM 'C:\Users\ids\Documents\workers.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

SELECT * FROM worker;
