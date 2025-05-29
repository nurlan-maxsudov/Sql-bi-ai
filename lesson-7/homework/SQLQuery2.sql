DROP TABLE IF EXISTS Customers
DROP TABLE IF EXISTS Orders
DROP TABLE IF EXISTS OrderDetails
DROP TABLE IF EXISTS Products
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

-- Insert into Customers
INSERT INTO Customers (CustomerID, CustomerName) VALUES 
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown');

-- Insert into Products
INSERT INTO Products (ProductID, ProductName, Category) VALUES 
(101, 'Laptop', 'Electronics'),
(102, 'Phone', 'Electronics'),
(103, 'Book', 'Stationery'),
(104, 'Pen', 'Stationery');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES 
(1001, 1, '2025-04-15'),
(1002, 2, '2025-04-16'),
(1003, 1, '2025-04-17');

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES 
(1, 1001, 101, 1, 999.99),   -- Alice bought 1 Laptop
(2, 1001, 104, 3, 1.50),     -- Alice bought 3 Pens
(3, 1002, 102, 2, 499.99),   -- Bob bought 2 Phones
(4, 1003, 103, 5, 10.00);    -- Alice bought 5 Books


SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderDetails


--1. 
SELECT *
FROM Customers c
LEFT JOIN Orders o
	ON c.CustomerID = o.CustomerID


--2.
SELECT CustomerName
FROM Customers c
LEFT JOIN Orders o
	ON c.CustomerID = o.CustomerID
WHERE OrderID is NULL


--3. 
SELECT o.OrderID, ProductName, Quantity
FROM Orders o
LEFT JOIN OrderDetails od
	ON o.OrderID = od.OrderID
LEFT JOIN Products p
	ON od.ProductID = p.ProductID

--4.
SELECT TOP 1
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS cnt
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY cnt DESC


--5.
SELECT OrderID, MAX(Price) as maxPrice
FROM OrderDetails
GROUP BY OrderID

--6. 
SELECT 
    c.CustomerName,
    o.CustomerID,
    MAX(o.OrderDate) AS LatestOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName, o.CustomerID;

--7. 
SELECT CustomerName, c.CustomerID, p.ProductID, o.OrderID, p.Category
FROM Orders o
LEFT JOIN Customers c
	on o.CustomerID = c.CustomerID
LEFT JOIN OrderDetails od
	on o.OrderID = od.OrderID
JOIN Products p
	on p.ProductID = od.ProductID
WHERE p.Category = 'Electronics'

--8. 
SELECT CustomerName, c.CustomerID, p.ProductID, o.OrderID, p.Category
FROM Orders o
LEFT JOIN Customers c
	on o.CustomerID = c.CustomerID
LEFT JOIN OrderDetails od
	on o.OrderID = od.OrderID
JOIN Products p
	on p.ProductID = od.ProductID
WHERE p.Category = 'Stationery'

--9.
SELECT 
    c.CustomerName,
    c.CustomerID,
    SUM(od.Price) AS totalExpenses
FROM Customers c
LEFT JOIN Orders o 
ON o.CustomerID = c.CustomerID
LEFT JOIN OrderDetails od 
ON o.OrderID = od.OrderID
GROUP BY c.CustomerName, c.CustomerID;