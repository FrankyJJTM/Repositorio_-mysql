-- ============================================================
-- SCRIPT 02: INSERCIÓN DE REGISTROS (DML) Y VERIFICACIÓN
-- Proyecto: Agrofrutos (Página Web y App de Escritorio)
-- Motor: MySQL 8.x
-- ============================================================

USE agricultural_management_db;

-- ------------------------------------------------------------
-- 1. Document_Type (10 rows)
-- ------------------------------------------------------------
INSERT INTO Document_Type (Code, Name) VALUES
('DNI', 'Documento Nacional de Identidad'),
('RUC', 'Registro Unico de Contribuyentes'),
('CE', 'Carnet de Extranjeria'),
('PAS', 'Pasaporte'),
('PTP', 'Permiso Temporal de Permanencia'),
('CIP', 'Carnet de Identidad Policial'),
('CFA', 'Carnet Fuerzas Armadas'),
('DIE', 'Documento de Identidad Extranjera'),
('DNI-E', 'DNI Electronico'),
('RUC-PER', 'RUC Persona Natural');

-- ------------------------------------------------------------
-- 2. Role (10 rows)
-- ------------------------------------------------------------
INSERT INTO Role (Name, Description) VALUES
('Administrator', 'Full system access and configurations'),
('Acquisition Operator', 'Registers harvest receptions and partner details'),
('Warehouse Manager', 'Controls stock levels and warehouse dispatch'),
('Quality Inspector', 'Evaluates batch quality and product grading'),
('Sales Manager', 'Manages clients and export distribution'),
('Financial Officer', 'Handles payment calculations for partners'),
('Field Inspector', 'Monitors partner plots and cultivation areas'),
('Partner User', 'Read-only access for agricultural partners'),
('General Auditor', 'System reporting and traceability compliance'),
('Guest', 'Restricted access for external consultation');

-- ------------------------------------------------------------
-- 3. Product (10 rows - Palta, Maracuyá y Mango)
-- ------------------------------------------------------------
INSERT INTO Product (Product_Name, Variety, Certification_Type) VALUES
('Avocado', 'Hass', 'GlobalGAP'),
('Avocado', 'Hass', 'Organic Fairtrade'),
('Avocado', 'Fuerte', 'GlobalGAP'),
('Avocado', 'Zutano', 'Conventional'),
('Passion Fruit', 'Flavicarpa (Yellow)', 'GlobalGAP'),
('Passion Fruit', 'Purple Sweet', 'Organic Fairtrade'),
('Mango', 'Kent', 'USDA Organic'),
('Mango', 'Haden', 'GlobalGAP'),
('Mango', 'Tommy Atkins', 'Conventional'),
('Mango', 'Ataulfo', 'USDA Organic');

-- ------------------------------------------------------------
-- 4. Store (10 rows)
-- ------------------------------------------------------------
INSERT INTO Store (Warehouse_Name, Location, Capacity_m3) VALUES
('Main Warehouse A', 'Km 12 Carretera Central, Chanchamayo', 1500.00),
('Cold Storage B', 'Av. Circunvalacion 450, Satipo', 800.00),
('Acquisition Depot 1', 'Sector La Merced, Chanchamayo', 1200.00),
('Acquisition Depot 2', 'Jr. Lima 310, Pichanaqui', 950.00),
('Processing Hub C', 'Zona Industrial Lote 4, Quillabamba', 2000.00),
('Export Stockroom', 'Av. Elmer Faucett 1200, Callao', 3000.00),
('Grain Storage D', 'Carretera San Martin Km 5, Tarapoto', 1100.00),
('Secondary Warehouse E', 'Sector Pangoa S/N, Satipo', 700.00),
('Cold Storage C', 'Jr. Comercio 220, Oxapampa', 650.00),
('Dry Goods Depot', 'Av. Ferrocarril 890, Huancayo', 1300.00);

-- ------------------------------------------------------------
-- 5. Contact (10 rows)
-- ------------------------------------------------------------
INSERT INTO Contact (Names, Surnames, Phone, Message, Mail, Date_Sent) VALUES
('John', 'Smith', '+14155550110', 'We are interested in importing 20 tons of Hass Avocado.', 'jsmith@importcorp.com', '2026-01-05 09:30:00'),
('Marie', 'Curie', '+33142685500', 'Please provide pricing details for organic Passion Fruit.', 'mcurie@eurofoods.fr', '2026-01-08 11:15:00'),
('Carlos', 'Mendoza', '+51987654321', 'Query regarding shipping schedules to Europe for Mango Kent.', 'cmendoza@agropuerto.pe', '2026-01-12 14:20:00'),
('Hans', 'Gruber', '+49301234567', 'Requesting sample lots for quality inspection.', 'hgruber@exotictaste.de', '2026-01-15 16:45:00'),
('Elena', 'Rostova', '+74951234567', 'We want to schedule 3 reefer containers of Hass Avocado.', 'erostova@russtrade.ru', '2026-01-20 10:00:00'),
('Akira', 'Tanaka', '+81312345678', 'Inquiry for high-score export grade Mango Kent.', 'atanaka@nippongrain.jp', '2026-01-22 08:30:00'),
('Linda', 'Brown', '+12125550199', 'Can you send samples of Passion Fruit juice concentrate?', 'lbrown@nyfruit.com', '2026-01-25 15:10:00'),
('Paolo', 'Rossi', '+39061234567', 'Please send current organic certificates for Mango and Avocado.', 'prossi@italimport.it', '2026-01-28 12:00:00'),
('David', 'Wilson', '+442012345678', 'Looking for reliable suppliers of fresh Mango Haden.', 'dwilson@ukdistributors.co.uk', '2026-02-01 17:30:00'),
('Sofia', 'Lopez', '+525512345678', 'Proposal for commercial distribution in North America.', 'slopez@mexagri.mx', '2026-02-05 13:40:00');

-- ------------------------------------------------------------
-- 6. Customer (10 rows)
-- ------------------------------------------------------------
INSERT INTO Customer (Name, Last_name, Document_Number, Phone, Mail, Address, Creation_Date, Document_Type_ID) VALUES
('Global', 'Trader LLC', '20551234567', '+13055550144', 'sales@globaltrader.com', '701 Brickell Ave', '2025-01-15 00:00:00', 2),
('Andina', 'Imports S.A.C.', '20601122334', '+5114228900', 'contact@andinaimports.pe', 'Av. Javier Prado Este 2500', '2025-01-20 00:00:00', 2),
('Robert', 'Johnson', '45891234', '+14155550188', 'rjohnson@foodbuyer.org', '450 Sutter St', '2025-02-01 00:00:00', 4),
('Euro', 'Fruits GmbH', '20998877665', '+49891234560', 'info@eurofruits.de', 'Berliner Strasse 12', '2025-02-10 00:00:00', 2),
('Pacific', 'Fruit Co.', '20443322110', '+51976543210', 'purchasing@pacificfruit.com', 'Av. Argentina 1400', '2025-02-18 00:00:00', 2),
('Alice', 'Wong', '008765432', '+85291234567', 'awong@asiatrade.hk', 'Queen Road Central 88', '2025-03-01 00:00:00', 3),
('Bio', 'Foods SpA', '20776655443', '+39029876543', 'orders@biofoods.it', 'Via Montenapoleone 8', '2025-03-05 00:00:00', 2),
('Organic', 'Market Inc.', '20112233445', '+12125550122', 'supply@organicmarket.com', '5th Avenue 720', '2025-03-10 00:00:00', 2),
('Fernando', 'Torres', '10432156789', '+51965432187', 'ftorres@agrolocal.pe', 'Jr. Arequipa 450', '2025-03-15 00:00:00', 10),
('Nordic', 'Fruit AB', '20889900112', '+46812345678', 'imports@nordicfruit.se', 'Kungsgatan 33', '2025-03-20 00:00:00', 2);

-- ------------------------------------------------------------
-- 7. Partner (10 rows)
-- ------------------------------------------------------------
INSERT INTO Partner (DNI_RUC, Member_Code, Phone, Address, First_Names_Last_Names, Certification_Status, Document_Type_ID) VALUES
('40123456', 'PAR-001', '964123456', 'Sector Bajo Ch', 'Juan Perez Gomez', 'Fully Certified Organic', 1),
('41234567', 'PAR-002', '964234567', 'Anexo Victoria', 'Maria Quispe Huaman', 'Transition Year 2', 1),
('42345678', 'PAR-003', '964345678', 'Comunidad Nati', 'Carlos Rojas Torres', 'Fully Certified Organic', 1),
('43456789', 'PAR-004', '964456789', 'Sector Yurinak', 'Ana Espinosa Ruiz', 'GlobalGAP Certified', 1),
('44567890', 'PAR-005', '964567890', 'Anexo Metraro', 'Pedro Mamani Condori', 'Fully Certified Organic', 1),
('45678901', 'PAR-006', '964678901', 'Sector Rio Neg', 'Lucia Fernandez Silva', 'Transition Year 1', 1),
('46789012', 'PAR-007', '964789012', 'Valle Kiteni', 'Jorge Castro Benitez', 'Fully Certified Organic', 1),
('47890123', 'PAR-008', '964890123', 'Anexo Mazamari', 'Rosa Vargas Machuca', 'Conventional', 1),
('48901234', 'PAR-009', '964901234', 'Sector Perene', 'Luis Alvarez Delgado', 'GlobalGAP Certified', 1),
('49012345', 'PAR-010', '964012345', 'Anexo Imperial', 'Elena Gutiérrez Morales', 'Fully Certified Organic', 1);

-- ------------------------------------------------------------
-- 8. User (10 rows)
-- ------------------------------------------------------------
INSERT INTO User (Member_ID, Role_ID, Username, Password_Hash, Registration_Date) VALUES
(NULL, 1, 'admin_user', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-01-01'),
(1, 2, 'operator_perez', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-01-10'),
(NULL, 3, 'warehouse_satipo', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-01-12'),
(NULL, 4, 'inspector_qc', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-01-15'),
(NULL, 5, 'sales_manager', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-01-20'),
(5, 6, 'finance_user', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-02-01'),
(NULL, 7, 'field_inspector', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-02-05'),
(3, 8, 'partner_rojas', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-02-10'),
(NULL, 9, 'auditor_general', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-02-15'),
(10, 8, 'partner_gutierrez', '$2b$12$eImiTXuWVxfM37uY4JANjOq2SbgXOpG0EaO99f5w1aY7J3b.v2K4W', '2025-02-20');

-- ------------------------------------------------------------
-- 9. Parcel (10 rows)
-- ------------------------------------------------------------
INSERT INTO Parcel (Location_Name, Area_Hectares, Plot_Traceability_Code, GPS_coordinates, Member_ID) VALUES
('Finca El Palmar', 5.50, 'PLOT-PEREZ-01', '-11.0542,-75.3311', 1),
('Finca La Florida', 8.20, 'PLOT-QUISPE-01', '-11.2511,-74.6322', 2),
('Parcela Santa Rosa', 12.00, 'PLOT-ROJAS-01', '-11.1833,-74.8844', 3),
('Finca San Jose', 4.80, 'PLOT-ESPINOSA-01', '-10.9322,-74.8511', 4),
('Parcela El Triunfo', 15.30, 'PLOT-MAMANI-01', '-11.0122,-75.3100', 5),
('Finca Bella Vista', 6.00, 'PLOT-FERNANDEZ-01', '-11.2800,-74.6011', 6),
('Parcela Los Cedros', 20.00, 'PLOT-CASTRO-01', '-12.8611,-72.6922', 7),
('Finca El Manantial', 7.50, 'PLOT-VARGAS-01', '-11.3211,-74.5200', 8),
('Parcela La Esperanza', 9.40, 'PLOT-ALVAREZ-01', '-10.9811,-75.2233', 9),
('Finca El Sol', 11.10, 'PLOT-GUTIERREZ-01', '-10.9100,-74.8911', 10);

-- ------------------------------------------------------------
-- 10. Plot_Product (10 rows)
-- ------------------------------------------------------------
INSERT INTO Plot_Product (Plot_ID, Product_ID, Hectares_Sown, Fecha_Siembra) VALUES
(1, 1, 3.50, '2022-03-15'),
(1, 5, 2.00, '2022-04-10'),
(2, 7, 5.00, '2021-11-20'),
(2, 3, 3.20, '2022-01-15'),
(3, 1, 8.00, '2020-05-10'),
(4, 5, 4.80, '2021-08-25'),
(5, 7, 10.00, '2019-09-12'),
(6, 8, 6.00, '2023-02-18'),
(7, 1, 12.00, '2021-04-05'),
(8, 5, 7.50, '2023-06-30');

-- ------------------------------------------------------------
-- 11. Caliber (10 rows)
-- ------------------------------------------------------------
INSERT INTO Caliber (Caliber_Code, Weight_Range_Grams, Intended_Use, Product_ID) VALUES
('AV-CAL12', '300g - 370g', 'Fresh Export Grade A', 1),
('AV-CAL16', '230g - 299g', 'Fresh Export Grade A', 1),
('AV-CAL20', '184g - 229g', 'Standard Export', 3),
('PF-GR1', '120g - 160g', 'Fresh Market Export', 5),
('PF-GR2', '80g - 119g', 'Juice & Pulp Processing', 5),
('MN-K1', '450g - 600g', 'Air Freight Export', 7),
('MN-K2', '350g - 449g', 'Sea Freight Export', 7),
('MN-H1', '400g - 550g', 'Export Grade A', 8),
('MN-TA1', '300g - 450g', 'Local / Regional Market', 9),
('AV-IND', '< 180g', 'Guacamole Processing', 4);

-- ------------------------------------------------------------
-- 12. Harvest_Reception (10 rows)
-- ------------------------------------------------------------
INSERT INTO Harvest_Reception (Delivery_Date_Time, Entry_Batch_Code, Quality_Status, Observations, Member_ID, Plot_ID, User_ID) VALUES
('2026-02-01 08:30:00', 'LOT-20260201-01', 'Approved Premium', 'Optimal dry matter at 23%', 1, 1, 2),
('2026-02-01 10:15:00', 'LOT-20260201-02', 'Approved Standard', 'Slight skin blemish, acceptable', 2, 2, 2),
('2026-02-02 09:00:00', 'LOT-20260202-01', 'Approved Premium', 'High Brix level and aroma', 3, 3, 2),
('2026-02-02 14:20:00', 'LOT-20260202-02', 'Under Review', 'Slightly overripe batch', 4, 4, 4),
('2026-02-03 11:00:00', 'LOT-20260203-01', 'Approved Premium', 'GlobalGAP compliance verified', 5, 5, 2),
('2026-02-03 15:45:00', 'LOT-20260203-02', 'Approved Standard', 'Standard color and size', 6, 6, 4),
('2026-02-04 08:00:00', 'LOT-20260204-01', 'Approved Premium', 'Prime quality export lot', 7, 7, 2),
('2026-02-04 13:10:00', 'LOT-20260204-02', 'Approved Standard', 'Brix index at 15 degrees', 8, 8, 2),
('2026-02-05 09:30:00', 'LOT-20260205-01', 'Approved Premium', 'Caliber 16 dominant batch', 9, 9, 4),
('2026-02-05 11:50:00', 'LOT-20260205-02', 'Approved Premium', 'Clean fruit, zero pest impact', 10, 10, 2);

-- ------------------------------------------------------------
-- 13. Harvest_Receipt_Detail (10 rows)
-- ------------------------------------------------------------
INSERT INTO Harvest_Receipt_Detail (Quantity_Kilograms, Precio_Unidad_Establecido, Total_Payment_Amount, Reception_ID, Product_ID, Caliber_ID) VALUES
(1250.00, 8.50, 10625.00, 1, 1, 1),
(800.00, 6.00, 4800.00, 1, 1, 2),
(2100.00, 3.20, 6720.00, 2, 5, 4),
(3500.00, 5.80, 20300.00, 3, 7, 6),
(1800.00, 4.50, 8100.00, 4, 7, 7),
(4200.00, 7.20, 30240.00, 5, 1, 1),
(1500.00, 2.50, 3750.00, 6, 5, 5),
(850.00, 6.00, 5100.00, 7, 8, 8),
(1950.00, 8.00, 15600.00, 8, 1, 2),
(2800.00, 5.50, 15400.00, 9, 7, 6);

-- ------------------------------------------------------------
-- 14. Inventory_Stock (10 rows)
-- ------------------------------------------------------------
INSERT INTO Inventory_Stock (Origin_Lot_Code, Available_Quantity_in_Kilograms, Date_Of_Last_Update, Warehouse_ID, Product_ID, Caliber_ID, Member_ID, Reception_ID) VALUES
('LOT-20260201-01', 1250.00, '2026-02-01', 1, 1, 1, 1, 1),
('LOT-20260201-01', 800.00, '2026-02-01', 1, 1, 2, 1, 1),
('LOT-20260201-02', 2100.00, '2026-02-02', 3, 5, 4, 2, 2),
('LOT-20260202-01', 3500.00, '2026-02-02', 2, 7, 6, 3, 3),
('LOT-20260202-02', 1800.00, '2026-02-03', 2, 7, 7, 4, 4),
('LOT-20260203-01', 4200.00, '2026-02-03', 6, 1, 1, 5, 5),
('LOT-20260203-02', 1500.00, '2026-02-04', 4, 5, 5, 6, 6),
('LOT-20260204-01', 850.00, '2026-02-04', 9, 8, 8, 7, 7),
('LOT-20260204-02', 1950.00, '2026-02-05', 1, 1, 2, 8, 8),
('LOT-20260205-01', 2800.00, '2026-02-05', 7, 7, 6, 9, 9);

-- ============================================================
-- VERIFICACIÓN DE LOS 10 REGISTROS POR TABLA
-- ============================================================
SELECT * FROM Document_Type;
SELECT * FROM Role;
SELECT * FROM Product;
SELECT * FROM Store;
SELECT * FROM Contact;
SELECT * FROM Customer;
SELECT * FROM Partner;
SELECT * FROM User;
SELECT * FROM Parcel;
SELECT * FROM Plot_Product;
SELECT * FROM Caliber;
SELECT * FROM Harvest_Reception;
SELECT * FROM Harvest_Receipt_Detail;
SELECT * FROM Inventory_Stock;