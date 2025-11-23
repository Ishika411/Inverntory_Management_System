-- Get all products sorted by stock
SELECT * FROM products ORDER BY stock ASC;

-- Items with stock below threshold
SELECT * FROM low_stock_items;

-- Total stock value of entire inventory
SELECT SUM(stock * buying_price) AS inventory_value FROM products;

-- Most frequently purchased products
SELECT product_id, COUNT(*) AS times_purchased
FROM purchases
GROUP BY product_id
ORDER BY times_purchased DESC;

-- Monthly sales revenue
SELECT 
    DATE_TRUNC('month', sold_at) AS month,
    SUM(quantity * selling_price) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Top-selling product
SELECT 
    product_id,
    SUM(quantity) AS total_sold
FROM sales
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

-- Top 3 selling products this month

SELECT 
    product_id,
    SUM(quantity) AS total_sold
FROM sales
WHERE DATE_TRUNC('month', sold_at) = DATE_TRUNC('month', CURRENT_DATE)
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 3;


-- Average purchase cost per product

SELECT 
    product_id,
    AVG(cost_price) AS avg_purchase_cost
FROM purchases
GROUP BY product_id;


-- Revenue vs Stock Value

SELECT 
    p.id,
    p.name,
    p.stock * p.buying_price AS stock_value,
    COALESCE(SUM(s.quantity * s.selling_price),0) AS revenue_generated
FROM products p
LEFT JOIN sales s ON p.id = s.product_id
GROUP BY p.id, p.name, p.stock;


-- Products never sold

SELECT p.id, p.name
FROM products p
LEFT JOIN sales s ON p.id = s.product_id
WHERE s.id IS NULL;


-- Monthly sales and purchases comparison

SELECT
    DATE_TRUNC('month', s.sold_at) AS month,
    COALESCE(SUM(s.quantity * s.selling_price), 0) AS sales_value,
    COALESCE((SELECT SUM(quantity * cost_price) 
              FROM purchases 
              WHERE DATE_TRUNC('month', purchased_at) = DATE_TRUNC('month', s.sold_at)),0) AS purchase_value
FROM sales s
GROUP BY month
ORDER BY month;