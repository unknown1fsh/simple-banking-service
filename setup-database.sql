-- MySQL Veritabanı Kurulum Scripti
-- Kullanım: mysql -u root -p < setup-database.sql
-- Veya MySQL Workbench'te çalıştırın

-- Veritabanını oluştur (eğer yoksa)
CREATE DATABASE IF NOT EXISTS bankapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Veritabanını kullan
USE bankapp;

-- Mevcut tabloları sil (eğer varsa)
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS bank_accounts;

-- Bank Accounts tablosunu oluştur
CREATE TABLE bank_accounts (
    id BIGINT NOT NULL AUTO_INCREMENT,
    account_number VARCHAR(255) NOT NULL,
    owner VARCHAR(255) NOT NULL,
    balance DOUBLE NOT NULL,
    create_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY account_number (account_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Transactions tablosunu oluştur
CREATE TABLE transactions (
    id BIGINT NOT NULL AUTO_INCREMENT,
    account_id BIGINT NOT NULL,
    date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    amount DOUBLE NOT NULL,
    transaction_type VARCHAR(255) NOT NULL,
    approval_code VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    KEY transactions_ibfk_1 (account_id),
    CONSTRAINT transactions_ibfk_1 FOREIGN KEY (account_id) REFERENCES bank_accounts (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Örnek veriler (opsiyonel)
INSERT INTO bank_accounts (account_number, owner, balance, create_date) VALUES
('BA123456789', 'Selim Yılmaz', 1899.00, '2023-01-15 07:30:00'),
('BA987654321', 'Ayşe Demir', 2600.75, '2023-02-20 11:45:00'),
('BA135792468', 'Mehmet Can', 3200.50, '2023-03-10 06:15:00'),
('BA246813579', 'Fatma Çelik', 1800.00, '2023-04-05 08:00:00'),
('BA864209753', 'Ahmet Korkmaz', 4200.30, '2023-05-15 12:30:00');

-- Başarı mesajı
SELECT 'Veritabanı başarıyla oluşturuldu!' AS message;

