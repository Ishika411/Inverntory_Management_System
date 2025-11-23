-- insert products
INSERT INTO products (name, description, category, stock, min_stock_threshold, buying_price, selling_price)
VALUES
('Notebook', '200 pages ruled notebook', 'Stationery', 50, 10, 20, 35),
('Pen', 'Blue gel pen', 'Stationery', 100, 20, 5, 10),
('Laptop Bag', 'Waterproof laptop bag', 'Accessories', 20, 5, 500, 800),
('Mouse', 'Wireless optical mouse', 'Electronics', 40, 10, 150, 300),

('Keyboard', 'Mechanical keyboard', 'Electronics', 30, 5, 400, 650),
('USB Cable', '1.5m USB-C cable', 'Electronics', 150, 20, 50, 120),
('Desk Chair', 'Ergonomic office chair', 'Furniture', 15, 5, 2500, 4000),
('Stapler', 'Standard stapler', 'Stationery', 60, 10, 30, 55);

-- insert suppliers
INSERT INTO suppliers (name, contact, email, address)
VALUES
('ABC Stationers', '9876543210', 'abc@gmail.com', 'Sector 12'),
('SupplierMart', '9123456780', 'mart@gmail.com', 'Sector 21'),
('TechWarehouse', '9998887771', 'tech@warehouse.com', 'IT Park'),

('OfficeMart', '9812345670', 'office@mart.com', 'Sector 15'),
('ElectroHub', '9876543212', 'support@electrohub.com', 'Sector 7');

-- sample purchases
INSERT INTO purchases (product_id, supplier_id, quantity, cost_price)
VALUES
(1, 1, 20, 20),
(2, 1, 50, 5),
(3, 3, 10, 500),

(5, 2, 25, 400),
(6, 2, 100, 50),
(7, 1, 10, 2500),
(8, 1, 40, 30);

-- sample sales
INSERT INTO sales (product_id, quantity, selling_price)
VALUES
(1, 5, 35),
(4, 3, 300),
(2, 20, 10),

(5, 10, 650),
(6, 50, 120),
(7, 2, 4000),
(8, 25, 55);
