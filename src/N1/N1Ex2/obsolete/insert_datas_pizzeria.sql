INSERT INTO provinces (id_province, province)
VALUES
(08, 'Barcelona'),
(17, 'Girona');

INSERT INTO cities (id_city, city, provinces_id_province)
VALUES
(1, 'Barcelona', 08),
(2, 'L\'Hospitalet de Llobregat', 08),
(3, 'Badalona', 08),
(4, 'Sabadell', 08),
(5, 'Terrassa', 08);


INSERT INTO customers (name, surname, address, cp, phone_number, cities_id_city) VALUES
('Antonio', 'González', 'Calle de la Paz, 15', '08001', '612345678', 1),
('María', 'Fernández', 'Avenida del Mar, 23', '08002', '609876543', 2),
('José', 'Lopez', 'Carrer de la Creu, 45', '08003', '617654321', 3),
('Carmen', 'Martínez', 'Calle del Sol, 10', '08004', '623456789', 4),
('Juan', 'Sánchez', 'Carrer de l\'Estrella, 30', '08005', '634567890', 5),
('Laura', 'Rodríguez', 'Carrer de la Rambla, 12', '08006', '655432109', 1),
('Miguel', 'Díaz', 'Avenida de Catalunya, 18', '08007', '661234567', 2),
('Pedro', 'Álvarez', 'Calle de Santa Clara, 8', '08008', '662345678', 3),
('Ana', 'Pérez', 'Carrer del Mar, 50', '08009', '673456789', 4),
('Francisco', 'Gómez', 'Calle de la Sierra, 3', '08010', '681234567', 5);

INSERT INTO pizza_categories (pizza_category) VALUES
('GENERAL'),
('VEGAN');

INSERT INTO products (product_type_name, price)
values
('Pizza', 12),
('Burger', 14),
('Drink', 4);


INSERT INTO stores (address, cp, cities_id_city) VALUES
('Barcelona', '08001', 1),
('L\'Hospitalet de Llobregat', '08901', 2),
('Badalona', '08911', 3),
('Sabadell', '08201', 4),
('Terrassa', '08221', 5);

INSERT INTO employees (name,surname, nif, phone_number, role, stores_id_store) VALUES
-- ROLE : 'Kitchen','Delivery'

