/* =====================================================
   RETAIL SALES & CUSTOMER ANALYTICS
   Database: retail_analytics
   Tool: MySQL Workbench
   ===================================================== */


/* =====================================================
   1. DATABASE SETUP
   ===================================================== */
   
CREATE DATABASE retail_analytics;

USE retail_analytics;

SELECT DATABASE();

/* =====================================================
   2. TABLE CREATION
   ===================================================== */
   
-- 1. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE
);


-- 2. Categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);


-- 3. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);


-- 4. Stores
CREATE TABLE stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);


-- 5. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    store_id INT,
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (store_id)
        REFERENCES stores(store_id)
);


-- 6. Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


/* =====================================================
   3. DATA INSERTION
   ===================================================== */
   
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Groceries'),
('Home & Kitchen'),
('Beauty'),
('Sports');

INSERT INTO customers
(customer_name, email, city, state, registration_date)
VALUES
('Aarav Sharma', 'aarav@gmail.com', 'Pune', 'Maharashtra', '2025-01-15'),
('Priya Patil', 'priya@gmail.com', 'Mumbai', 'Maharashtra', '2025-02-10'),
('Rohan Deshmukh', 'rohan@gmail.com', 'Nashik', 'Maharashtra', '2025-02-22'),
('Sneha Kulkarni', 'sneha@gmail.com', 'Nagpur', 'Maharashtra', '2025-03-05'),
('Aditya Joshi', 'aditya@gmail.com', 'Pune', 'Maharashtra', '2025-03-18'),
('Neha Shah', 'neha@gmail.com', 'Ahmedabad', 'Gujarat', '2025-04-02'),
('Rahul Verma', 'rahul@gmail.com', 'Delhi', 'Delhi', '2025-04-15'),
('Ananya Singh', 'ananya@gmail.com', 'Bengaluru', 'Karnataka', '2025-05-01'),
('Vikram Mehta', 'vikram@gmail.com', 'Mumbai', 'Maharashtra', '2025-05-20'),
('Kavya Rao', 'kavya@gmail.com', 'Hyderabad', 'Telangana', '2025-06-10');

INSERT INTO stores
(store_name, city, state)
VALUES
('Pune Central Store', 'Pune', 'Maharashtra'),
('Mumbai Mall Store', 'Mumbai', 'Maharashtra'),
('Nashik City Store', 'Nashik', 'Maharashtra'),
('Nagpur Central Store', 'Nagpur', 'Maharashtra'),
('Bengaluru Store', 'Bengaluru', 'Karnataka');

INSERT INTO products
(product_name, category_id, price, cost_price)
VALUES
('Laptop', 1, 55000, 45000),
('Smartphone', 1, 30000, 24000),
('Wireless Mouse', 1, 1200, 700),
('Keyboard', 1, 1800, 1100),
('T-Shirt', 2, 800, 450),
('Jeans', 2, 1800, 1000),
('Rice 5kg', 3, 450, 350),
('Cooking Oil 1L', 3, 160, 125),
('Mixer Grinder', 4, 3500, 2500),
('Water Bottle', 4, 600, 350),
('Face Wash', 5, 450, 280),
('Cricket Bat', 6, 2500, 1700);

INSERT INTO orders
(customer_id, store_id, order_date, payment_method, order_status)
VALUES
(1, 1, '2025-07-05', 'UPI', 'Completed'),
(2, 2, '2025-07-08', 'Credit Card', 'Completed'),
(3, 3, '2025-07-12', 'Cash', 'Completed'),
(1, 1, '2025-07-18', 'UPI', 'Completed'),
(4, 4, '2025-08-02', 'Debit Card', 'Completed'),
(5, 1, '2025-08-10', 'UPI', 'Completed'),
(6, 2, '2025-08-15', 'Credit Card', 'Completed'),
(7, 2, '2025-08-20', 'UPI', 'Cancelled'),
(8, 5, '2025-09-03', 'Debit Card', 'Completed'),
(9, 2, '2025-09-10', 'UPI', 'Completed'),
(10, 5, '2025-09-15', 'Credit Card', 'Completed'),
(2, 2, '2025-09-22', 'UPI', 'Completed'),

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 55000),
(1, 3, 2, 1200),

(2, 2, 1, 30000),
(2, 4, 1, 1800),

(3, 7, 2, 450),
(3, 8, 3, 160),

(4, 5, 2, 800),
(4, 6, 1, 1800),

(5, 9, 1, 3500),
(5, 10, 2, 600),

(6, 1, 1, 55000),
(6, 3, 1, 1200),

(7, 11, 2, 450),
(7, 5, 2, 800),

(8, 2, 1, 30000),

(9, 12, 1, 2500),
(9, 10, 2, 600),

(10, 2, 1, 30000),
(10, 11, 1, 450),

(11, 9, 1, 3500),
(11, 8, 4, 160),

(12, 6, 2, 1800),
(12, 5, 3, 800),

(13, 7, 3, 450),
(13, 8, 2, 160),

(14, 1, 1, 55000),
(14, 4, 1, 1800),

(15, 2, 1, 30000),
(15, 3, 2, 1200);
(3, 3, '2025-10-05', 'Cash', 'Completed'),
(5, 1, '2025-10-12', 'UPI', 'Completed'),
(1, 1, '2025-10-20', 'Credit Card', 'Completed');

/* =====================================================
   4. BASIC SALES ANALYSIS
   ===================================================== */

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT *
FROM customers;

SELECT *
FROM products;

SELECT *
FROM order_items;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;


/* =====================================================
   5. PRODUCT & CATEGORY ANALYSIS
   ===================================================== */
   
SELECT COUNT(*) AS completed_orders
FROM orders
WHERE order_status = 'Completed';

SELECT SUM(quantity) AS total_quantity_sold
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed';

SELECT
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed';

SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.order_id
) AS order_totals;

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

SELECT
    c.category_name,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.category_id, c.category_name
ORDER BY total_quantity DESC;

SELECT
    p.product_name,
    SUM(
        oi.quantity * (oi.unit_price - p.cost_price)
    ) AS total_profit
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_profit DESC;

SELECT
    p.product_name,
    p.price,
    CASE
        WHEN p.price >= 30000 THEN 'Premium'
        WHEN p.price >= 5000 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS price_category
FROM products p
ORDER BY p.price DESC;

SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
HAVING total_revenue > 10000
ORDER BY total_revenue DESC;


/* =====================================================
   6. CUSTOMER ANALYSIS
   ===================================================== */
   
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

SELECT
    c.customer_name,
    ROUND(
        SUM(oi.quantity * oi.unit_price) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY average_order_value DESC;

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;

SELECT
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING total_spending > 50000
ORDER BY total_spending DESC;

SELECT
    customer_name,
    total_spending,
    RANK() OVER (
        ORDER BY total_spending DESC
    ) AS customer_rank
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name
) AS customer_sales
ORDER BY customer_rank;

SELECT
    city,
    customer_name,
    total_spending,
    RANK() OVER (
        PARTITION BY city
        ORDER BY total_spending DESC
    ) AS city_rank
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        SUM(oi.quantity * oi.unit_price) AS total_spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, c.city
) AS customer_sales
ORDER BY city, city_rank;

/* =====================================================
   7. TIME-SERIES ANALYSIS
   ===================================================== */
   
SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    sales_year,
    sales_month;
    
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Completed'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    sales_year,
    sales_month;
    
    SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT *
FROM monthly_sales
ORDER BY sales_month;

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    sales_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY sales_month
    ) AS running_revenue
FROM monthly_sales
ORDER BY sales_month;

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    sales_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (
        ORDER BY sales_month
    ) AS previous_month_revenue
FROM monthly_sales
ORDER BY sales_month;

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),

sales_with_previous AS (
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)

SELECT
    sales_month,
    monthly_revenue,
    previous_month_revenue,
    ROUND(
        (
            (monthly_revenue - previous_month_revenue)
            / previous_month_revenue
        ) * 100,
        2
    ) AS growth_percentage
FROM sales_with_previous
ORDER BY sales_month;

/* =====================================================
   8. STORE ANALYSIS
   ===================================================== */
   
-- Store-wise Revenue

SELECT
    s.store_name,
    s.city,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM stores s
JOIN orders o
    ON s.store_id = o.store_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY s.store_id, s.store_name, s.city
ORDER BY total_revenue DESC;

SELECT
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM stores s
JOIN orders o
    ON s.store_id = o.store_id
WHERE o.order_status = 'Completed'
GROUP BY s.store_id, s.store_name
ORDER BY total_orders DESC;

SELECT
    s.store_name,
    ROUND(
        SUM(oi.quantity * oi.unit_price)
        / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM stores s
JOIN orders o
    ON s.store_id = o.store_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY s.store_id, s.store_name
ORDER BY average_order_value DESC;

WITH store_sales AS (
    SELECT
        s.store_id,
        s.store_name,
        s.city,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM stores s
    JOIN orders o
        ON s.store_id = o.store_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY s.store_id, s.store_name, s.city
)

SELECT
    store_name,
    city,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS store_rank
FROM store_sales
ORDER BY store_rank;

SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(
        (
            SELECT SUM(oi.quantity * oi.unit_price)
            FROM order_items oi
            WHERE oi.order_id = o.order_id
        )
    ) AS total_revenue
FROM orders o
WHERE order_status = 'Completed'
GROUP BY payment_method
ORDER BY total_revenue DESC;


/* =====================================================
   FINAL BUSINESS ANALYSIS
   ===================================================== */

-- 1. Top 5 Products by Revenue
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 5;


-- 2. Top 5 Customers by Spending
SELECT
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;


-- 3. Revenue by Category
SELECT
    cat.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories cat
JOIN products p
    ON cat.category_id = p.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY cat.category_id, cat.category_name
ORDER BY total_revenue DESC;


-- 4. Revenue by Store
SELECT
    s.store_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM stores s
JOIN orders o
    ON s.store_id = o.store_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY s.store_id, s.store_name
ORDER BY total_revenue DESC;


-- 5. Payment Method Analysis
WITH order_totals AS (
    SELECT
        o.order_id,
        o.payment_method,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.order_id, o.payment_method
)
SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(order_total) AS total_revenue
FROM order_totals
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- 6. Monthly Revenue
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;


-- 7. Monthly Revenue Growth
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),
sales_growth AS (
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    sales_month,
    monthly_revenue,
    previous_month_revenue,
    ROUND(
        (
            (monthly_revenue - previous_month_revenue)
            / previous_month_revenue
        ) * 100,
        2
    ) AS growth_percentage
FROM sales_growth
ORDER BY sales_month;