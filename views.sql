-- low stock items
CREATE OR REPLACE VIEW low_stock_items AS
SELECT id, name, stock, min_stock_threshold
FROM products
WHERE stock < min_stock_threshold;

-- product stock summary
CREATE OR REPLACE VIEW product_stock_summary AS
SELECT 
    id,
    name,
    stock,
    (stock * buying_price) AS total_stock_value
FROM products;

-- monthly purchase overview
CREATE OR REPLACE VIEW monthly_purchases AS
SELECT 
    DATE_TRUNC('month', purchased_at) AS month,
    SUM(quantity * cost_price) AS amount_spent
FROM purchases
GROUP BY month
ORDER BY month;

-- monitor which supplier’s products are low in stock.
CREATE OR REPLACE VIEW supplier_product_stock AS
SELECT 
    s.id AS supplier_id,
    s.name AS supplier_name,
    p.id AS product_id,
    p.name AS product_name,
    p.stock
FROM products p
JOIN purchases pu ON p.id = pu.product_id
JOIN suppliers s ON pu.supplier_id = s.id
GROUP BY s.id, s.name, p.id, p.name, p.stock;

-- Top suppliers by supply value
CREATE OR REPLACE VIEW top_suppliers AS
SELECT 
    s.id AS supplier_id,
    s.name AS supplier_name,
    SUM(pu.quantity * pu.cost_price) AS total_supplied_value
FROM suppliers s
JOIN purchases pu ON s.id = pu.supplier_id
GROUP BY s.id, s.name
ORDER BY total_supplied_value DESC;

-- Product profit margin
CREATE OR REPLACE VIEW product_profit_margin AS
SELECT 
    id,
    name,
    (selling_price - buying_price) AS profit_per_unit,
    (stock * (selling_price - buying_price)) AS potential_profit
FROM products;

-- Monthly profit summary
CREATE OR REPLACE VIEW monthly_profit AS
SELECT
    DATE_TRUNC('month', s.sold_at) AS month,
    SUM(s.quantity * (s.selling_price - p.buying_price)) AS profit
FROM sales s
JOIN products p ON s.product_id = p.id
GROUP BY month
ORDER BY month;