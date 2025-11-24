-- Create database
CREATE DATABASE IF NOT EXISTS shop_hunt;
USE shop_hunt;

-- Single unified table for all product inventory data
CREATE TABLE product_inventory (
    -- Core identifiers
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Shop information
    shop_name VARCHAR(255) NOT NULL,
    shop_owner VARCHAR(255),
    shop_address TEXT,
    
    -- Product information
    product_name VARCHAR(255) NOT NULL,
    product_brand VARCHAR(255),
    product_mrp DECIMAL(10, 2),
    product_size VARCHAR(50),
    
    -- Inventory details
    quantity INT NOT NULL,
    selling_price DECIMAL(10, 2),
    manufacture_date DATE,
    expiry_date DATE,
    
    -- Status and timestamps
    is_available BOOLEAN DEFAULT TRUE,
    stock_status ENUM('IN_STOCK', 'LOW_STOCK', 'OUT_OF_STOCK') DEFAULT 'IN_STOCK',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Indexes for better performance
    INDEX idx_product_name (product_name),
    INDEX idx_brand_category (product_brand),
    INDEX idx_availability (is_available, stock_status)
);

