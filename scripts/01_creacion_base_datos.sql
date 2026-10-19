-- ============================================================
-- SCRIPT 01: CREACIÓN DE BASE DE DATOS Y ESTRUCTURA FÍSICA (DDL)
-- Proyecto: Agrofrutos (Página Web y App de Escritorio)
-- Motor: MySQL 8.x
-- ============================================================

DROP DATABASE IF EXISTS agricultural_management_db;
CREATE DATABASE agricultural_management_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE agricultural_management_db;

-- ============================================================
-- 1. MASTER & REFERENCE TABLES
-- ============================================================

-- Document_Type Table
CREATE TABLE Document_Type (
    Document_Type_ID INT AUTO_INCREMENT,
    Code VARCHAR(10) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Document_Type_ID),
    CONSTRAINT uk_document_type_code UNIQUE (Code)
) ENGINE=InnoDB;

-- Role Table
CREATE TABLE Role (
    Role_ID INT AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL,
    Description VARCHAR(150) NULL,
    PRIMARY KEY (Role_ID),
    CONSTRAINT uk_role_name UNIQUE (Name)
) ENGINE=InnoDB;

-- Product Table
CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT,
    Product_Name VARCHAR(80) NOT NULL,
    Variety VARCHAR(50) NULL,
    Certification_Type VARCHAR(50) NULL,
    PRIMARY KEY (Product_ID)
) ENGINE=InnoDB;

-- Store Table (Warehouse)
CREATE TABLE Store (
    Warehouse_ID INT AUTO_INCREMENT,
    Warehouse_Name VARCHAR(80) NOT NULL,
    Location VARCHAR(150) NULL,
    Capacity_m3 DECIMAL(8,2) NULL,
    PRIMARY KEY (Warehouse_ID),
    CONSTRAINT chk_store_capacity CHECK (Capacity_m3 IS NULL OR Capacity_m3 > 0)
) ENGINE=InnoDB;

-- Contact Table (Web Form)
CREATE TABLE Contact (
    Contact_ID INT AUTO_INCREMENT,
    Names VARCHAR(50) NOT NULL,
    Surnames VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Message TEXT NOT NULL,
    Mail VARCHAR(100) NOT NULL,
    Date_Sent DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Contact_ID)
) ENGINE=InnoDB;

-- Customer Table (Web / Sales)
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT,
    Name VARCHAR(60) NOT NULL,
    Last_name VARCHAR(80) NOT NULL,
    Document_Number VARCHAR(15) NOT NULL,
    Phone VARCHAR(15) NULL,
    Mail VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NULL,
    Creation_Date DATETIME NOT NULL,
    Document_Type_ID INT NOT NULL,
    PRIMARY KEY (Customer_ID),
    CONSTRAINT fk_customer_document_type FOREIGN KEY (Document_Type_ID) 
        REFERENCES Document_Type(Document_Type_ID),
    CONSTRAINT uk_customer_doc UNIQUE (Document_Type_ID, Document_Number)
) ENGINE=InnoDB;

-- Partner Table (Desktop Module)
CREATE TABLE Partner (
    Member_ID INT AUTO_INCREMENT,
    DNI_RUC VARCHAR(11) NOT NULL,
    Member_Code VARCHAR(20) NOT NULL,
    Phone VARCHAR(9) NULL,
    Address VARCHAR(15) NULL,
    First_Names_Last_Names VARCHAR(100) NOT NULL,
    Certification_Status VARCHAR(150) NOT NULL,
    Document_Type_ID INT NOT NULL,
    PRIMARY KEY (Member_ID),
    CONSTRAINT fk_partner_document_type FOREIGN KEY (Document_Type_ID) 
        REFERENCES Document_Type(Document_Type_ID),
    CONSTRAINT uk_partner_code UNIQUE (Member_Code)
) ENGINE=InnoDB;

-- User Table (Security)
CREATE TABLE User (
    User_ID INT AUTO_INCREMENT,
    Member_ID INT NULL,
    Role_ID INT NOT NULL,
    Username VARCHAR(30) NOT NULL,
    Password_Hash VARCHAR(255) NOT NULL,
    Registration_Date DATE NOT NULL,
    PRIMARY KEY (User_ID),
    CONSTRAINT fk_user_role FOREIGN KEY (Role_ID) 
        REFERENCES Role(Role_ID),
    CONSTRAINT fk_user_partner FOREIGN KEY (Member_ID) 
        REFERENCES Partner(Member_ID) ON DELETE SET NULL,
    CONSTRAINT uk_user_username UNIQUE (Username)
) ENGINE=InnoDB;

-- ============================================================
-- 2. OPERATIONAL & TRANSACTIONAL TABLES
-- ============================================================

-- Parcel Table
CREATE TABLE Parcel (
    Plot_ID INT AUTO_INCREMENT,
    Location_Name VARCHAR(100) NOT NULL,
    Area_Hectares DECIMAL(8,2) NOT NULL,
    Plot_Traceability_Code VARCHAR(30) NOT NULL,
    GPS_coordinates VARCHAR(50) NULL,
    Member_ID INT NOT NULL,
    PRIMARY KEY (Plot_ID),
    CONSTRAINT fk_parcel_partner FOREIGN KEY (Member_ID) 
        REFERENCES Partner(Member_ID),
    CONSTRAINT uk_parcel_traceability UNIQUE (Plot_Traceability_Code),
    CONSTRAINT chk_parcel_area CHECK (Area_Hectares > 0)
) ENGINE=InnoDB;

-- Plot_Product Table
CREATE TABLE Plot_Product (
    Plot_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Hectares_Sown DECIMAL(8,2) NOT NULL,
    Fecha_Siembra DATE NULL,
    PRIMARY KEY (Plot_ID, Product_ID),
    CONSTRAINT fk_plot_product_parcel FOREIGN KEY (Plot_ID) 
        REFERENCES Parcel(Plot_ID) ON DELETE CASCADE,
    CONSTRAINT fk_plot_product_product FOREIGN KEY (Product_ID) 
        REFERENCES Product(Product_ID),
    CONSTRAINT chk_hectares_sown CHECK (Hectares_Sown > 0)
) ENGINE=InnoDB;

-- Caliber Table
CREATE TABLE Caliber (
    Caliber_ID INT AUTO_INCREMENT,
    Caliber_Code VARCHAR(10) NOT NULL,
    Weight_Range_Grams VARCHAR(20) NOT NULL,
    Intended_Use VARCHAR(50) NULL,
    Product_ID INT NOT NULL,
    PRIMARY KEY (Caliber_ID),
    CONSTRAINT fk_caliber_product FOREIGN KEY (Product_ID) 
        REFERENCES Product(Product_ID)
) ENGINE=InnoDB;

-- Harvest_Reception Table
CREATE TABLE Harvest_Reception (
    Reception_ID INT AUTO_INCREMENT,
    Delivery_Date_Time DATETIME NOT NULL,
    Entry_Batch_Code VARCHAR(30) NOT NULL,
    Quality_Status VARCHAR(30) NOT NULL,
    Observations TEXT NULL,
    Member_ID INT NOT NULL,
    Plot_ID INT NOT NULL,
    User_ID INT NULL,
    PRIMARY KEY (Reception_ID),
    CONSTRAINT fk_reception_partner FOREIGN KEY (Member_ID) 
        REFERENCES Partner(Member_ID),
    CONSTRAINT fk_reception_parcel FOREIGN KEY (Plot_ID) 
        REFERENCES Parcel(Plot_ID),
    CONSTRAINT fk_reception_user FOREIGN KEY (User_ID) 
        REFERENCES User(User_ID) ON DELETE SET NULL,
    CONSTRAINT uk_reception_batch_code UNIQUE (Entry_Batch_Code)
) ENGINE=InnoDB;

-- Harvest_Receipt_Detail Table
CREATE TABLE Harvest_Receipt_Detail (
    Reception_Detail_ID INT AUTO_INCREMENT,
    Quantity_Kilograms DECIMAL(8,2) NOT NULL,
    Precio_Unidad_Establecido DECIMAL(8,2) NULL,
    Total_Payment_Amount DECIMAL(8,2) NULL,
    Reception_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Caliber_ID INT NOT NULL,
    PRIMARY KEY (Reception_Detail_ID),
    CONSTRAINT fk_receipt_detail_reception FOREIGN KEY (Reception_ID) 
        REFERENCES Harvest_Reception(Reception_ID) ON DELETE CASCADE,
    CONSTRAINT fk_receipt_detail_product FOREIGN KEY (Product_ID) 
        REFERENCES Product(Product_ID),
    CONSTRAINT fk_receipt_detail_caliber FOREIGN KEY (Caliber_ID) 
        REFERENCES Caliber(Caliber_ID),
    CONSTRAINT chk_receipt_detail_qty CHECK (Quantity_Kilograms > 0)
) ENGINE=InnoDB;

-- Inventory_Stock Table
CREATE TABLE Inventory_Stock (
    Inventory_ID INT AUTO_INCREMENT,
    Origin_Lot_Code VARCHAR(30) NULL,
    Available_Quantity_in_Kilograms DECIMAL(8,2) NOT NULL,
    Date_Of_Last_Update DATE NOT NULL,
    Warehouse_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Caliber_ID INT NOT NULL,
    Member_ID INT NOT NULL,
    Reception_ID INT NOT NULL,
    PRIMARY KEY (Inventory_ID),
    CONSTRAINT fk_stock_store FOREIGN KEY (Warehouse_ID) 
        REFERENCES Store(Warehouse_ID),
    CONSTRAINT fk_stock_product FOREIGN KEY (Product_ID) 
        REFERENCES Product(Product_ID),
    CONSTRAINT fk_stock_caliber FOREIGN KEY (Caliber_ID) 
        REFERENCES Caliber(Caliber_ID),
    CONSTRAINT fk_stock_partner FOREIGN KEY (Member_ID) 
        REFERENCES Partner(Member_ID),
    CONSTRAINT fk_stock_reception FOREIGN KEY (Reception_ID) 
        REFERENCES Harvest_Reception(Reception_ID),
    CONSTRAINT chk_stock_available_qty CHECK (Available_Quantity_in_Kilograms >= 0)
) ENGINE=InnoDB;