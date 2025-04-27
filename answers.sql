-- 1NF --
-- SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order --
-- Creating the orders table --
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Creating the products table with a foreign key reference to orders --
CREATE TABLE ProductDetails (
    OrderID INT,
    Product VARCHAR(50),
    PRIMARY KEY (OrderID, Product), 
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

-- Inserting data into the orders table --
INSERT INTO orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Inserting data into the product details table --
INSERT INTO ProductDetails (OrderID, Product)
VALUES
    (101, 'Laptop'),
    (101, 'Mouse'),
    (102, 'Tablet'),
    (102, 'Keyboard'),
    (102, 'Mouse'),
    (103, 'Phone');


-- 2NF --
-- SQL query to transform this table into 2NF by removing partial dependencies --
-- Creating the orders table -- 
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Creating the products table --
CREATE TABLE products (
    ProductID VARCHAR(50) PRIMARY KEY,
    Product VARCHAR(50),
);

-- Creating the order details table with a foreign key references to orders and products --
CREATE TABLE OrderDetails (
    OrderID INT 
    ProductID VARCHAR(50)
    Quantity INT
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

-- Inserting data into the orders table --
INSERT INTO orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Inserting data into the products table --
INSERT INTO products (ProductID, Product)
VALUES
    ('p1', 'Laptop'),
    ('p2', 'Mouse'),
    ('p3', 'Tablet'),
    ('p4', 'Keyboard'),
    ('p5', 'Phone');

-- Inserting data into the order details table --
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
    (101, 'p1', 2),
    (101, 'p2', 1),
    (102, 'p3', 3),
    (102, 'p4', 1),
    (102, 'p2', 2),
    (103, 'p5', 1);
