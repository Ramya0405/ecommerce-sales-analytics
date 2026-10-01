CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
SELECT DATABASE();
CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    city VARCHAR(25),
    state VARCHAR(25),
    registration_date date
);
CREATE TABLE products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);
CREATE TABLE orders(
     order_id INT PRIMARY KEY AUTO_INCREMENT,
     customer_id INT NOT NULL,
     order_date DATE NOT NULL,
     order_status  VARCHAR(30),
     FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items(
     order_item_id INT PRIMARY KEY AUTO_INCREMENT,
     order_id INT NOT NULL,
     product_id INT NOT NULL,
     quantity INT NOT NULL,
     unit_price DECIMAL(10,2) NOT NULL,
     FOREIGN KEY(order_id) REFERENCES orders(order_id),
     FOREIGN KEY(product_id) REFERENCES products(product_id)
);
CREATE TABLE payments(
	payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
SHOW TABLES;
INSERT INTO customers
(customer_name, customer_email, city, state, registration_date)
VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', 'Hyderabad', 'Telangana', '2025-01-15'),
('Priya Reddy', 'priya.reddy@gmail.com', 'Bengaluru', 'Karnataka', '2025-01-20'),
('Arjun Kumar', 'arjun.kumar@gmail.com', 'Chennai', 'Tamil Nadu', '2025-02-05'),
('Sneha Rao', 'sneha.rao@gmail.com', 'Hyderabad', 'Telangana', '2025-02-18'),
('Vikram Singh', 'vikram.singh@gmail.com', 'Pune', 'Maharashtra', '2025-03-10'),
('Ananya Das', 'ananya.das@gmail.com', 'Kolkata', 'West Bengal', '2025-03-22'),
('Karthik Reddy', 'karthik.reddy@gmail.com', 'Vijayawada', 'Andhra Pradesh', '2025-04-12'),
('Meera Nair', 'meera.nair@gmail.com', 'Kochi', 'Kerala', '2025-04-25'),
('Rohit Verma', 'rohit.verma@gmail.com', 'Mumbai', 'Maharashtra', '2025-05-08'),
('Divya Patel', 'divya.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2025-05-19'),
('Sai Teja', 'saiteja@gmail.com', 'Visakhapatnam', 'Andhra Pradesh', '2025-06-03'),
('Pooja Mehta', 'pooja.mehta@gmail.com', 'Delhi', 'Delhi', '2025-06-15'),
('Aditya Rao', 'aditya.rao@gmail.com', 'Hyderabad', 'Telangana', '2025-07-01'),
('Nisha Kapoor', 'nisha.kapoor@gmail.com', 'Jaipur', 'Rajasthan', '2025-07-18'),
('Manoj Kumar', 'manoj.kumar@gmail.com', 'Bengaluru', 'Karnataka', '2025-08-05');
SELECT * FROM customers;
INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Wireless Headphones', 'Electronics', 2499.00, 50),
('Bluetooth Speaker', 'Electronics', 1799.00, 40),
('Smart Watch', 'Electronics', 3999.00, 30),
('USB-C Charger', 'Electronics', 899.00, 100),

('Cotton T-Shirt', 'Fashion', 599.00, 80),
('Denim Jeans', 'Fashion', 1499.00, 60),
('Running Shoes', 'Fashion', 2299.00, 45),
('Casual Hoodie', 'Fashion', 1299.00, 50),

('Coffee Maker', 'Home & Kitchen', 3499.00, 25),
('Electric Kettle', 'Home & Kitchen', 1599.00, 40),
('Non-Stick Pan', 'Home & Kitchen', 999.00, 70),
('Water Bottle', 'Home & Kitchen', 499.00, 120),

('Backpack', 'Accessories', 1199.00, 55),
('Leather Wallet', 'Accessories', 799.00, 75),
('Sunglasses', 'Accessories', 999.00, 65),
('Travel Bag', 'Accessories', 1899.00, 35),

('Java Programming Book', 'Books', 699.00, 40),
('SQL Learning Guide', 'Books', 599.00, 45),
('DevOps Handbook', 'Books', 899.00, 30),
('System Design Book', 'Books', 1099.00, 25);
SELECT COUNT(*) FROM products;
INSERT INTO orders
(customer_id, order_date, order_status)
VALUES
(1, '2025-08-10', 'Delivered'),
(2, '2025-08-11', 'Delivered'),
(3, '2025-08-12', 'Delivered'),
(4, '2025-08-15', 'Shipped'),
(5, '2025-08-18', 'Delivered'),
(6, '2025-08-20', 'Cancelled'),
(7, '2025-08-22', 'Delivered'),
(8, '2025-08-25', 'Shipped'),
(9, '2025-08-27', 'Delivered'),
(10, '2025-08-29', 'Delivered'),

(11, '2025-09-01', 'Delivered'),
(12, '2025-09-03', 'Shipped'),
(13, '2025-09-05', 'Delivered'),
(14, '2025-09-07', 'Delivered'),
(15, '2025-09-10', 'Cancelled'),
(1, '2025-09-12', 'Delivered'),
(2, '2025-09-14', 'Delivered'),
(3, '2025-09-16', 'Shipped'),
(4, '2025-09-18', 'Delivered'),
(5, '2025-09-20', 'Delivered'),

(6, '2025-09-22', 'Delivered'),
(7, '2025-09-24', 'Shipped'),
(8, '2025-09-25', 'Delivered'),
(9, '2025-09-26', 'Delivered'),
(10, '2025-09-27', 'Delivered'),
(11, '2025-09-28', 'Cancelled'),
(12, '2025-09-29', 'Delivered'),
(13, '2025-09-30', 'Shipped'),
(14, '2025-10-01', 'Delivered'),
(15, '2025-10-02', 'Delivered');
SELECT count(*) FROM orders;
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 2499.00),
(1, 13, 2, 1199.00),

(2, 3, 1, 3999.00),
(2, 5, 2, 599.00),

(3, 7, 1, 2299.00),
(3, 12, 2, 499.00),

(4, 2, 1, 1799.00),
(4, 17, 1, 699.00),

(5, 9, 1, 3499.00),
(5, 10, 1, 1599.00),

(6, 6, 1, 1499.00),

(7, 1, 1, 2499.00),
(7, 14, 2, 799.00),

(8, 8, 1, 1299.00),
(8, 15, 1, 999.00),

(9, 16, 1, 1899.00),
(9, 20, 1, 1099.00),

(10, 4, 2, 899.00),
(10, 11, 1, 999.00),

(11, 3, 1, 3999.00),
(11, 7, 1, 2299.00),

(12, 18, 2, 599.00),
(12, 19, 1, 899.00),

(13, 5, 3, 599.00),
(13, 13, 1, 1199.00),

(14, 9, 1, 3499.00),
(14, 12, 3, 499.00),

(15, 2, 1, 1799.00),

(16, 1, 1, 2499.00),
(16, 6, 1, 1499.00),

(17, 10, 2, 1599.00),
(17, 14, 1, 799.00),

(18, 3, 1, 3999.00),
(18, 16, 1, 1899.00),

(19, 8, 2, 1299.00),
(19, 17, 1, 699.00),

(20, 7, 1, 2299.00),
(20, 15, 2, 999.00),

(21, 11, 2, 999.00),
(21, 12, 2, 499.00),

(22, 4, 1, 899.00),
(22, 18, 1, 599.00),

(23, 13, 2, 1199.00),
(23, 20, 1, 1099.00),

(24, 5, 2, 599.00),
(24, 19, 1, 899.00),

(25, 9, 1, 3499.00),
(25, 16, 1, 1899.00),

(26, 6, 1, 1499.00),
(26, 14, 2, 799.00),

(27, 1, 1, 2499.00),
(27, 2, 1, 1799.00),

(28, 10, 1, 1599.00),
(28, 11, 2, 999.00),

(29, 3, 1, 3999.00),
(29, 20, 1, 1099.00),

(30, 7, 2, 2299.00),
(30, 12, 1, 499.00);
SELECT COUNT(*) FROM order_items;
INSERT INTO payments
(order_id, payment_date, payment_method, payment_status, payment_amount)
VALUES
(1, '2025-08-10', 'UPI', 'Paid', 4897.00),
(2, '2025-08-11', 'Credit Card', 'Paid', 5197.00),
(3, '2025-08-12', 'UPI', 'Paid', 3297.00),
(4, '2025-08-15', 'Debit Card', 'Paid', 2498.00),
(5, '2025-08-18', 'Credit Card', 'Paid', 5098.00),
(6, '2025-08-20', 'UPI', 'Refunded', 1499.00),
(7, '2025-08-22', 'UPI', 'Paid', 4097.00),
(8, '2025-08-25', 'Debit Card', 'Paid', 2298.00),
(9, '2025-08-27', 'Credit Card', 'Paid', 2998.00),
(10, '2025-08-29', 'UPI', 'Paid', 2797.00),

(11, '2025-09-01', 'Credit Card', 'Paid', 6298.00),
(12, '2025-09-03', 'UPI', 'Paid', 2097.00),
(13, '2025-09-05', 'Debit Card', 'Paid', 2996.00),
(14, '2025-09-07', 'UPI', 'Paid', 4996.00),
(15, '2025-09-10', 'Credit Card', 'Refunded', 1799.00),
(16, '2025-09-12', 'UPI', 'Paid', 3998.00),
(17, '2025-09-14', 'Debit Card', 'Paid', 3997.00),
(18, '2025-09-16', 'Credit Card', 'Paid', 5898.00),
(19, '2025-09-18', 'UPI', 'Paid', 3297.00),
(20, '2025-09-20', 'Debit Card', 'Paid', 4297.00),

(21, '2025-09-22', 'UPI', 'Paid', 2996.00),
(22, '2025-09-24', 'Credit Card', 'Paid', 1498.00),
(23, '2025-09-25', 'Debit Card', 'Paid', 3497.00),
(24, '2025-09-26', 'UPI', 'Paid', 2097.00),
(25, '2025-09-27', 'Credit Card', 'Paid', 5398.00),
(26, '2025-09-28', 'UPI', 'Refunded', 3097.00),
(27, '2025-09-29', 'Debit Card', 'Paid', 4298.00),
(28, '2025-09-30', 'UPI', 'Paid', 3597.00),
(29, '2025-10-01', 'Credit Card', 'Paid', 5098.00),
(30, '2025-10-02', 'UPI', 'Paid', 5097.00);
SELECT COUNT(*) FROM payments;

SELECT COUNT(*) AS customers FROM customers;

SELECT COUNT(*) AS products FROM products;

SELECT COUNT(*) AS orders FROM orders;

SELECT COUNT(*) AS order_items FROM order_items;

SELECT COUNT(*) AS payments FROM payments;
SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_id;

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_id;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT order_status, COUNT(*) AS total
FROM orders
GROUP BY order_status;

SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items;

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 5;

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

SELECT
    c.city,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY revenue DESC;
