1. **Employees**  
   | EmployeeID | Name     | DepartmentID | Salary  |  
   |-----------|---------|--------------|---------|  
   | 1         | Alice   | 101          | 60000   |  
   | 2         | Bob     | 102          | 70000   |  
   | 3         | Charlie | 101          | 65000   |  
   | 4         | David   | 103          | 72000   |  
   | 5         | Eva     | NULL         | 68000   |  

2. **Departments**  
   | DepartmentID | DepartmentName |  
   |-------------|---------------|  
   | 101         | IT            |  
   | 102         | HR            |  
   | 103         | Finance       |  
   | 104         | Marketing     |  

3. **Projects**  
   | ProjectID | ProjectName   | EmployeeID |  
   |----------|-------------|-----------|  
   | 1        | Alpha       | 1         |  
   | 2        | Beta        | 2         |  
   | 3        | Gamma       | 1         |  
   | 4        | Delta       | 4         |  
   | 5        | Omega       | NULL      |  
DROP TABLE IF EXISTS Employees
CREATE TABLE Employees
(
	EmployeeID int primary key,
	Name VARCHAR(50),
	DepartmentID int,
	Salary int
)

DROP TABLE IF EXISTS Departments
CREATE TABLE Departments
(
	DepartmentID int,
	DepartmentName VARCHAR(50)
)

DROP TABLE IF EXISTS Projects
CREATE TABLE Projects
(
	ProjectID int,
	ProjectName VARCHAR(255),
	EmployeeID int
)
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

INSERT INTO Projects (ProjectID, ProjectName, EmployeeID) VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);

SELECT * FROM Employees
SELECT * FROM Departments


--1.
SELECT 
e.*, d.*
FROM Employees as e
Inner join Departments as d
on e.DepartmentID = d.DepartmentID

--2. LEFT JOIN
SELECT
e.*, d.*
FROM Employees as e
left join Departments as d
on e.DepartmentID = d.DepartmentID

--3. RIGHT JOIN
SELECT
e.*, d.*
FROM Employees as e
right join Departments as d
on e.DepartmentID  = d.DepartmentID

--4. FULL OUTER JOIN
SELECT
e.*, d.*
FROM Employees as e
FULL OUTER JOIN Departments as d
on e.DepartmentID = d.DepartmentID

--5. JOIN WITH Agreggate functions
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    SUM(e.Salary) AS TotalSalary
FROM 
    Employees e
RIGHT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY 
    d.DepartmentID, d.DepartmentName;


--6. CROSS JOIN
SELECT 
	e.*, d.*
FROM Employees as e
CROSS JOIN Departments as d

--7. Multiple Joins

SELECT
	e.Name as EmployeeName,
	d.DepartmentName,
	p.ProjectName
FROM Employees as e
LEFT JOIN Departments as d
ON d.DepartmentID = e.DepartmentID
LEFT JOIN Projects as p
ON e.EmployeeID = p.EmployeeID