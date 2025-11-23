-- PRODUCTS TABLE
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    stock INT DEFAULT 0,
    min_stock_threshold INT DEFAULT 5,
    buying_price NUMERIC(10,2),
    selling_price NUMERIC(10,2),
    created_at TIMESTAMP DEFAULT NOW()
);

-- SUPPLIERS TABLE
CREATE TABLE IF NOT EXISTS suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(50),
    email VARCHAR(100),
    address TEXT
);

-- PURCHASES TABLE (incoming stock)
CREATE TABLE IF NOT EXISTS purchases (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    supplier_id INT REFERENCES suppliers(id),
    quantity INT NOT NULL,
    cost_price NUMERIC(10,2),
    purchased_at TIMESTAMP DEFAULT NOW()
);

-- SALES TABLE (outgoing stock)
CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    selling_price NUMERIC(10,2),
    sold_at TIMESTAMP DEFAULT NOW()
);
