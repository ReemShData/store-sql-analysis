-- Project: Store Sales Analysis
-- Tool: SQL (SQLite)

-- Step 1: Create Products Table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INTEGER,
    product_name TEXT,
    category TEXT,
    price INTEGER
);

-- Step 2: Create Sales Table
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    sale_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    sale_date TEXT,
    store TEXT
);

-- Step 3: Insert Products Data
INSERT INTO products VALUES (1, 'Laptop', 'Electronics', 800);
INSERT INTO products VALUES (2, 'Phone', 'Electronics', 400);
INSERT INTO products VALUES (3, 'Headphones', 'Electronics', 100);
INSERT INTO products VALUES (4, 'T-Shirt', 'Clothing', 30);
INSERT INTO products VALUES (5, 'Jeans', 'Clothing', 60);

-- Step 4: Insert Sales Data
INSERT INTO sales VALUES (1, 1, 5, '2024-01-15', 'Store A');
INSERT INTO sales VALUES (2, 2, 10, '2024-01-20', 'Store B');
INSERT INTO sales VALUES (3, 3, 20, '2024-02-05', 'Store A');
INSERT INTO sales VALUES (4, 4, 50, '2024-02-10', 'Store B');
INSERT INTO sales VALUES (5, 5, 30, '2024-03-01', 'Store A');
INSERT INTO sales VALUES (6, 1, 8, '2024-03-15', 'Store B');
INSERT INTO sales VALUES (7, 2, 15, '2024-04-01', 'Store A');
INSERT INTO sales VALUES (8, 3, 25, '2024-04-20', 'Store B');
INSERT INTO sales VALUES (9, 4, 40, '2024-05-05', 'Store A');
INSERT INTO sales VALUES (10, 5, 20, '2024-05-15', 'Store B');

-- Step 5: Show All Products
SELECT * FROM products;

-- Step 6: Show All Sales
SELECT * FROM sales;

-- Step 7: JOIN - Sales with Product Details
SELECT s.sale_id, p.product_name, p.category, 
       s.quantity, s.store, s.sale_date
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- Step 8: Total Revenue by Product
SELECT p.product_name, 
       SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Step 9: Total Revenue by Store
SELECT s.store,
       SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY s.store
ORDER BY total_revenue DESC;

-- Step 10: Best Selling Category
SELECT p.category,
       SUM(s.quantity) AS total_units
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_units DESC;
