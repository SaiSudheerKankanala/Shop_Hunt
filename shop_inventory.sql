CREATE DATABASE IF NOT EXISTS shop_inventory;
USE shop_inventory;

CREATE TABLE shop_inventory_flat (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_name VARCHAR(150),
    product_name VARCHAR(150),
    quantity INT,
    product_type VARCHAR(150),
    location TEXT,
    day_in_to_shop DATE,
    available BOOLEAN,
    price DECIMAL(10,2)
);

INSERT INTO shop_inventory_flat
(shop_name, product_name, quantity, product_type, location, day_in_to_shop, available, price)
VALUES
('FreshMart', 'Milk', 50, 'Amul 1L', '123 MG Road, Bangalore', '2026-01-20', TRUE, 60.00),
('FreshMart', 'Bread', 30, 'Britannia 400g', '123 MG Road, Bangalore', '2026-01-15', TRUE, 40.00),
('FreshMart', 'Sugar', 120, 'Madhur 1kg', '123 MG Road, Bangalore', '2026-01-21', TRUE, 55.00),
('FreshMart', 'Banana', 0, 'FreshFarms 1kg', '123 MG Road, Bangalore', '2026-01-22', FALSE, 70.00),

('DailyNeeds', 'Eggs', 20, 'LocalFarm 12pcs', '45 Park Street, Kolkata', '2026-01-18', TRUE, 90.00),
('DailyNeeds', 'Apple', 0, 'FreshFarms 1kg', '45 Park Street, Kolkata', '2026-01-10', FALSE, 180.00),
('DailyNeeds', 'Rice', 80, 'Daawat 5kg', '45 Park Street, Kolkata', '2026-01-25', TRUE, 460.00),

('SuperStore', 'Atta', 40, 'Ashirvaad 5kg', '78 Ring Road, Delhi', '2026-01-19', TRUE, 280.00),
('SuperStore', 'Oil', 12, 'Fortune 1L', '78 Ring Road, Delhi', '2026-01-20', TRUE, 140.00),
('SuperStore', 'Paneer', 5, 'MilkyMist 200g', '78 Ring Road, Delhi', '2026-01-23', TRUE, 90.00);

SELECT * FROM shop_inventory_flat;
