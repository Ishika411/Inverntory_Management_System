-- automatically increase stock after a purchase
CREATE OR REPLACE FUNCTION increase_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE products
    SET stock = stock + NEW.quantity
    WHERE id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_increase_stock
AFTER INSERT ON purchases
FOR EACH ROW
EXECUTE FUNCTION increase_stock();

-- automatically decrease stock after a sale
CREATE OR REPLACE FUNCTION decrease_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_decrease_stock
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION decrease_stock();

-- Low stock alert trigger
CREATE OR REPLACE FUNCTION alert_low_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stock < NEW.min_stock_threshold THEN
        RAISE NOTICE 'ALERT: Product % stock is below threshold!', NEW.name;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_low_stock
AFTER UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION alert_low_stock();
