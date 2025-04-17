DROP TABLE IF EXISTS Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 60000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');


--1.
SELECT 
	*,
	ROW_NUMBER() OVER(Order by Salary) as [rank]
FROM Employees

--2.
SELECT *
FROM (
    SELECT 
        EmployeeID,
        Name,
        Department,
        Salary,
        RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
) AS RankedEmployees
WHERE SalaryRank IN (
    SELECT SalaryRank
    FROM (
        SELECT 
            RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
        FROM Employees
    ) AS TempRanks
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
);

--3.
SELECT
* FROM
(SELECT
	EmployeeID,
    Name,
    Department,
    Salary,
	DENSE_RANK() OVER (partition by department order by salary desc) as rankedSalary
FROM Employees
) AS salary_ranks
WHERE rankedSalary IN (1, 2);

--4.
SELECT *
FROM (
    SELECT 
        EmployeeID,
        Name,
        Department,
        Salary,
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS salary_rank
    FROM Employees
) AS ranked
WHERE salary_rank = 1;

--5.
SELECT *,
	SUM(salary) OVER(ORDER BY EmployeeID)
FROM Employees

--6. Find the Total Salary of Each Department Without GROUP BY

SELECT *,
	SUM(Salary) OVER(partition by Department) as total_dep_salary
FROM Employees

--7. 

SELECT *,
	CAST(AVG(salary) OVER(partition by Department)  AS DECIMAL(10,2)) as avg_dep_salary
FROM Employees

--8.

SELECT *,
	CAST(ABS(Salary - AVG(salary) Over(partition by Department)) AS DECIMAL(10, 2)) AS Diff
FROM Employees

--9. 
SELECT *,
	SUM(salary) OVER(ORDER BY EmployeeID rows between 1 preceding  and 1 following) as ThreeSum
FROM Employees

--10. 
SELECT SUM(Salary) as top3HiredSalary
	FROM (
	SELECT TOP 3 Salary
	FROM Employees
	ORDER BY HireDate ASC) as top3salary

--11.

SELECT *,
	AVG(salary) OVER(ORDER BY EmployeeID)
FROM Employees

--12.
SELECT *,
	MAX(Salary) OVER(Order by EmployeeID rows between 2 preceding and 2 following) as idk
FROM Employees

--13.
SELECT Name, Department,
	CAST(Salary / SUM(Salary) OVER(partition by Department) * 100 AS DECIMAL(10, 2)) AS percentage
FROM Employees