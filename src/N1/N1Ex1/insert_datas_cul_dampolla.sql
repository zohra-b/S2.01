INSERT
INTO customers (customer_name, customer_address, customer_phone_number, customer_email)
VALUES
('Jose Lopez', 'Passeig de gracia, 8, 08001 Bcn', '632632632', 'joselito@gmail.com'),
('Maria Lopez', 'Passeig de gracia, 8, 08001 Bcn', '632632655', 'maria@gmail.com'),
('Victoria Rodriguez', 'Carrer de la sequia, 1, 08004 Bcn', '635847632', 'rodri@gmail.com'),
('Alexa Gomez', 'Carrer Lorda, 10, 08025 Bcn', '655555632', 'alexa@gmail.com'),
('Bruna Roca', 'Carrer de la Vila, 28, 08015 Bcn', '632688889', 'bruna@gmail.com');

INSERT
INTO suppliers(supplier_name, supplier_cp,supplier_city ,supplier_country, supplier_phone_number, supplier_email, supplier_nif )
VALUES
('Best glasses', '08038', 'Bcn', 'Spain', '633585858', 'bestglasses@gmail.com', 'C-585858' ),
('LivinGlasses', '08001', 'Bcn', 'Spain', '633222222', 'LivinGlasses@gmail.com', 'C-45458585' ),
('All4You', '08025', 'Bcn', 'Spain', '933933933', 'all4You@gmail.com', 'C-454149898' );

INSERT
INTO brands(brand, supplier)
VALUES
('Luna de Sol', 1),
('Solstice', 1),
('Croma-Sil', 2);

INSERT
INTO employees (employee_name)
VALUES ('Lisa'), ('Jordi'), ('Pepita');


INSERT INTO glasses (left_graduation, right_graduation, glass_frame, frame_color, price,brands_brand_id)
VALUES
(2.25, 3.45, 'Plastic', 'red', 159.99, 1),
(2.00, 1.45, 'Metal', 'gold', 109.99, 2),
(1.25, 0.45, 'Floating', 'silver', 50.00, 1),
(4.25, 4.45, 'Plastic', 'brown', 125.99, 1),
(2.20, 3.00, 'Metal', 'blue', 59.99, 2),
(2.75, 1.55, 'Metal', 'green', 79.99, 3);

insert into sales (sale_date, sold_glasses, sold_by, bought_by)
values
('2025-02-20', 1, 1, 1) ,
('2025-03-20', 2, 2, 2),
('2025-01-31', 3, 1, 3),
('2025-01-25', 4, 3, 2) ,
('2025-01-24', 3, 3, 4);

-- to truncate your tables
--SET FOREIGN_KEY_CHECKS=0;
--  TRUNCATE TABLE glasses;
--  TRUNCATE TABLE brands;
--  TRUNCATE TABLE suppliers;
--  TRUNCATE TABLE customers;
--  TRUNCATE TABLE employees;
--  TRUNCATE TABLE sales;
--SET FOREIGN_KEY_CHECKS=1;
--
