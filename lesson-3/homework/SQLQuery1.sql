CREATE TABLE Employees (
     EmployeeID INT PRIMARY KEY,
     FirstName VARCHAR(50),
     LastName VARCHAR(50),
     Department VARCHAR(50),
     Salary DECIMAL(10,2),
     HireDate DATE
 );
 
 DROP TABLE IF EXISTS Orders
 CREATE TABLE [Orders] (
     OrderID INT PRIMARY KEY,
     CustomerName VARCHAR(100),
     OrderDate DATE,
     TotalAmount DECIMAL(10,2),
     Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
 );
 
 CREATE TABLE Products (
     ProductID INT PRIMARY KEY,
     ProductName VARCHAR(100),
     Category VARCHAR(50),
     Price DECIMAL(10,2),
     Stock INT
 );
 
 INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
 (1, 'Alice', 'Johnson', 'Engineering', 85000.00, '2019-03-15'),
 (2, 'Bob', 'Smith', 'Engineering', 87000.00, '2018-07-22'),
 (3, 'Carol', 'Davis', 'Marketing', 62000.00, '2020-01-10'),
 (4, 'David', 'Lee', 'HR', 59000.00, '2021-04-01'),
 (5, 'Eve', 'Brown', 'Marketing', 64000.00, '2022-05-13'),
 (6, 'Frank', 'Wilson', 'Engineering', 90000.00, '2017-11-25'),
 (7, 'Grace', 'Taylor', 'Finance', 75000.00, '2020-10-09'),
 (8, 'Hank', 'Moore', 'Finance', 72000.00, '2021-02-19'),
 (9, 'Ivy', 'Martin', 'HR', 60000.00, '2019-09-18'),
 (10, 'Jack', 'Clark', 'Engineering', 87000.00, '2016-06-06'),
 (11, 'Kara', 'Walker', 'Sales', 55000.00, '2022-07-01'),
 (12, 'Liam', 'Hall', 'Sales', 58000.00, '2021-03-22'),
 (13, 'Mona', 'Allen', 'Marketing', 66000.00, '2023-01-01'),
 (14, 'Nate', 'Young', 'Engineering', 91000.00, '2020-08-14'),
 (15, 'Olivia', 'Hernandez', 'HR', 61000.00, '2018-12-31'),
 (16, 'Paul', 'King', 'Finance', 74000.00, '2017-10-30'),
 (17, 'Quinn', 'Wright', 'Sales', 59000.00, '2020-11-11'),
 (18, 'Rachel', 'Lopez', 'Engineering', 88000.00, '2022-04-04'),
 (19, 'Sam', 'Hill', 'Marketing', 63000.00, '2019-05-05'),
 (20, 'Tina', 'Scott', 'Finance', 71000.00, '2023-02-20');
 
 
 INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status) VALUES
 (1, 'Alice Johnson', '2023-12-01', 150.00, 'Delivered'),
 (2, 'Bob Smith', '2023-12-03', 85.50, 'Pending'),
 (3, 'Carol Davis', '2023-12-05', 230.99, 'Shipped'),
 (4, 'David Lee', '2023-12-07', 120.00, 'Cancelled'),
 (5, 'Eve Brown', '2023-12-09', 310.45, 'Delivered'),
 (6, 'Frank Wilson', '2023-12-10', 199.99, 'Pending'),
 (7, 'Grace Taylor', '2023-12-11', 89.90, 'Shipped'),
 (8, 'Hank Moore', '2023-12-13', 400.00, 'Delivered'),
 (9, 'Ivy Martin', '2023-12-15', 135.75, 'Cancelled'),
 (10, 'Jack Clark', '2023-12-16', 220.00, 'Shipped'),
 (11, 'Kara Walker', '2023-12-17', 99.95, 'Delivered'),
 (12, 'Liam Hall', '2023-12-19', 540.00, 'Pending'),
 (13, 'Mona Allen', '2023-12-20', 60.00, 'Cancelled'),
 (14, 'Nate Young', '2023-12-21', 150.00, 'Shipped'),
 (15, 'Olivia Hernandez', '2023-12-22', 175.75, 'Delivered'),
 (16, 'Paul King', '2023-12-23', 80.00, 'Pending'),
 (17, 'Quinn Wright', '2023-12-24', 260.00, 'Shipped'),
 (18, 'Rachel Lopez', '2023-12-25', 310.00, 'Delivered'),
 (19, 'Sam Hill', '2023-12-26', 500.50, 'Cancelled'),
 (20, 'Tina Scott', '2023-12-27', 420.20, 'Shipped');
 
 INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
 (1, 'Wireless Mouse', 'Electronics', 25.99, 120),
 (2, 'Bluetooth Keyboard', 'Electronics', 45.50, 85),
 (3, 'HD Monitor', 'Electronics', 199.99, 40),
 (4, 'USB-C Cable', 'Accessories', 9.99, 250),
 (5, 'Laptop Stand', 'Accessories', 29.99, 70),
 (6, 'Notebook', 'Stationery', 2.50, 500),
 (7, 'Ballpoint Pen', 'Stationery', 0.99, 800),
 (8, 'Desk Lamp', 'Home & Living', 34.99, 60),
 (9, 'Coffee Mug', 'Home & Living', 12.99, 150),
 (10, 'Office Chair', 'Furniture', 129.99, 20),
 (11, 'Bookshelf', 'Furniture', 89.95, 15),
 (12, 'Tablet', 'Electronics', 299.99, 30),
 (13, 'Wireless Charger', 'Electronics', 39.99, 55),
 (14, 'Sticky Notes', 'Stationery', 1.20, 600),
 (15, 'Backpack', 'Accessories', 49.99, 100),
 (16, 'Floor Mat', 'Home & Living', 24.99, 90),
 (17, 'Smartphone', 'Electronics', 699.00, 25),
 (18, 'Fountain Pen', 'Stationery', 15.00, 150),
 (19, 'Wall Clock', 'Home & Living', 19.99, 110),
 (20, 'Table', 'Furniture', 199.99, 10);
 
 
 SELECT * FROM Employees
 SELECT * FROM Orders
 SELECT * FROM Products
 
 --TASK 1
 SELECT TOP 10 PERCENT *
 FROM Employees
 ORDER BY Salary DESC
 
 SELECT Department, AVG(Salary) as AvgSalary
 FROM Employees
 GROUP BY(Department)
 ORDER BY AVG(Salary) DESC
 OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY
 
 SELECT *, 'High' AS SalaryCategory
 FROM Employees
 WHERE Salary > 80000
 	UNION ALL
 SELECT *, 'Medium' AS SalaryCategory
 FROM Employees
 WHERE SALARY > 50000 AND Salary < 80000
 	UNION ALL
 SELECT *, 'Low' AS SalaryCategory
 FROM Employees
 WHERE Salary < 50000
 ORDER BY EmployeeID
 OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY
 
 
 --TASK 2
 
 SELECT * FROM Orders
 WHERE OrderDate BETWEEN '2023-01-01' and '2023-12-31';
 
 SELECT *, 'Completed' As OrderStatus
 FROM Orders
 WHERE Status = 'Delivered' OR Status = 'Shipped'
 	Union ALL
 SELECT *, 'Pending' As OrderStatus
 FROM Orders
 WHERE Status = 'Pending'
 	UNION ALL
 SELECT *, 'Cancelled' As OrderStatus
 FROM Orders
 WHERE Status = 'Cancelled'

 SELECT Status, COUNT(*) AS NumberOfOrders, SUM(TotalAmount) AS TotalRevenue
 FROM Orders
 GROUP BY (Status)
 HAVING SUM(TotalAmount) > 1000
 
 SELECT Status, COUNT(*) AS NumberOfOrders, SUM(TotalAmount) as TotalRevenue
 FROM Orders
 GROUP BY (Status)
 ORDER BY TotalRevenue DESC
 
 --TASK 3
 
 SELECT * FROM Products
 
 SELECT DISTINCT Category FROM Products
 
 SELECT Category, MAX(Price) as MaxPrice
 FROM Products
 GROUP BY (Category)
 
 SELECT 
     ProductName,
 	Category,
     Stock,
 	Price,
     IIF(Stock = 0, 'Out of Stock', 
         IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
 FROM Products
 ORDER BY PRICE
 OFFSET 5 ROWS