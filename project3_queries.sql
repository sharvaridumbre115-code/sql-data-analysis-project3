-- ============================================================
-- Project 3 - SQL Data Analysis
-- DecodeLabs Data Analytics Internship
--
-- Dataset: E-commerce order records (1,200 rows x 14 columns)
-- Goal: Use SQL queries to filter, group, and aggregate raw
--       order data into actionable business insights.
--
-- Note: These queries were run against a SQLite database
-- built from the dataset using pandas (df.to_sql), and
-- executed via pd.read_sql() in Python/Jupyter.
-- ============================================================


-- 1. BASIC SELECT + WHERE
-- Find all orders for the "Chair" product category.
SELECT *
FROM orders
WHERE Product = 'Chair';


-- 2. WHERE + ORDER BY
-- Same Chair orders, sorted from most expensive to least expensive.
SELECT *
FROM orders
WHERE Product = 'Chair'
ORDER BY TotalPrice DESC;


-- 3. GROUP BY + AGGREGATION (COUNT, SUM)
-- How many orders, and how much total revenue, did each product generate?
SELECT
    Product,
    COUNT(*) AS OrderCount,
    SUM(TotalPrice) AS TotalRevenue
FROM orders
GROUP BY Product
ORDER BY TotalRevenue DESC;


-- 4. GROUP BY + AGGREGATION (AVG) + HAVING
-- Which products have an average order value above $1,000?
-- HAVING is used here instead of WHERE because AVG() only
-- exists after grouping has already happened.
SELECT
    Product,
    AVG(TotalPrice) AS AvgOrderValue
FROM orders
GROUP BY Product
HAVING AvgOrderValue > 1000
ORDER BY AvgOrderValue DESC;


-- 5. GROUP BY + HAVING (bonus / extended query)
-- Average order value by payment method, limited to payment
-- methods used in more than 100 orders (filters out noise
-- from small sample sizes).
SELECT
    PaymentMethod,
    COUNT(*) AS OrderCount,
    AVG(TotalPrice) AS AvgOrderValue
FROM orders
GROUP BY PaymentMethod
HAVING OrderCount > 100
ORDER BY AvgOrderValue DESC;
