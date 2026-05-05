CREATE DATABASE OnlineShopping;
USE OnlineShopping;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
 CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);
 CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
 CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
 INSERT INTO Customers (name, email, phone, city)
VALUES 
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Mumbai'),
('Priya Singh', 'priya@gmail.com', '9123456780', 'Delhi');

INSERT INTO Products (product_name, price, stock)
VALUES 
('Laptop', 50000, 10),
('Phone', 20000, 20);

INSERT INTO Orders (customer_id, order_date)
VALUES 
(1, '2025-05-01'),
(2, '2025-05-02');

INSERT INTO OrderDetails (order_id, product_id, quantity)
VALUES 
(1, 1, 1),
(2, 2, 2);

INSERT INTO Payments (order_id, amount, payment_date)
VALUES 
(1, 50000, '2025-05-01'),
(2, 40000, '2025-05-02');
 SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
SELECT SUM(amount) AS total_sales FROM Payments;
SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;
 SELECT c.name, p.product_name, od.quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
















