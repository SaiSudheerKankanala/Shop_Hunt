CREATE DATABASE IF NOT EXISTS shop_inventory;
USE shop_inventory;

CREATE TABLE shops (
    shop_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_name VARCHAR(150) NOT NULL,
    shop_owner VARCHAR(150),
    shop_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    product_brand VARCHAR(150),
    product_size VARCHAR(50),
    product_mrp DECIMAL(10,2),
    UNIQUE(product_name, product_brand, product_size)
);

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    shop_id INT DEFAULT 1,
    quantity INT NOT NULL,
    purchase_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    manufacture_date DATE,
    expiry_date DATE,
    stock_status ENUM('IN_STOCK','LOW_STOCK','OUT_OF_STOCK') DEFAULT 'IN_STOCK',
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (shop_id) REFERENCES shops(shop_id)
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_price DECIMAL(10,2),
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);




-- Sample Shops
INSERT INTO shops (shop_name, shop_owner, shop_address) VALUES
('FreshMart', 'Ravi Kumar', '123 MG Road, Bangalore'),
('DailyNeeds', 'Anita Sharma', '45 Park Street, Kolkata'),
('SuperStore', 'Vikram Singh', '78 Ring Road, Delhi');

-- Sample Products
INSERT INTO products (product_name, product_brand, product_size, product_mrp) VALUES
('Milk', 'Amul', '1L', 60.00),
('Bread', 'Britannia', '400g', 40.00),
('Eggs', 'LocalFarm', '12pcs', 90.00),
('Rice', 'Daawat', '5kg', 450.00),
('Apple', 'FreshFarms', '1kg', 180.00);

-- Sample Inventory
INSERT INTO inventory (product_id, shop_id, quantity, purchase_price, selling_price, manufacture_date, expiry_date, stock_status) VALUES
(1, 1, 50, 55.00, 60.00, '2026-01-20', '2026-01-28', 'IN_STOCK'),
(2, 1, 30, 35.00, 40.00, '2026-01-15', '2026-02-15', 'IN_STOCK'),
(3, 2, 20, 85.00, 90.00, '2026-01-18', '2026-02-18', 'LOW_STOCK'),
(4, 3, 15, 420.00, 450.00, '2025-12-25', '2026-06-25', 'IN_STOCK'),
(5, 2, 0, 170.00, 180.00, '2026-01-10', '2026-01-20', 'OUT_OF_STOCK');

-- Sample Sales
INSERT INTO sales (product_id, quantity, sale_price, sale_date) VALUES
(1, 5, 60.00, '2026-01-25 10:30:00'),
(2, 3, 40.00, '2026-01-25 11:00:00'),
(3, 2, 90.00, '2026-01-26 09:15:00'),
(4, 1, 450.00, '2026-01-26 14:00:00'),
(1, 10, 60.00, '2026-01-27 16:45:00');

USE shop_inventory;
SHOW TABLES;
