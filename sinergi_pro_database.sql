
-- Tabel Penjualan (sales)
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL
);

-- Tabel Keuangan (financial_records)
CREATE TABLE financial_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL
);

-- Tabel Produksi (productions)
CREATE TABLE productions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    status VARCHAR(50) NOT NULL
);

-- Tabel Inventaris (inventories)
CREATE TABLE inventories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Sample data for testing purposes (optional)
INSERT INTO sales (customer_name, product_id, quantity, total_price) VALUES 
('John Doe', 1, 10, 1500.00),
('Jane Smith', 2, 5, 750.00);

INSERT INTO financial_records (description, amount, date) VALUES 
('Penjualan Produk A', 1500.00, '2024-09-01'),
('Pembelian Bahan Baku', -500.00, '2024-09-02');

INSERT INTO productions (product_name, quantity, status) VALUES 
('Produk A', 100, 'Selesai'),
('Produk B', 50, 'Dalam Proses');

INSERT INTO inventories (item_name, quantity, location) VALUES 
('Bahan Baku A', 100, 'Gudang 1'),
('Produk Jadi A', 50, 'Gudang 2');
