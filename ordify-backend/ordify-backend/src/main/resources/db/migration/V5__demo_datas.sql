INSERT IGNORE INTO roles (role_name) VALUES
('CUSTOMER'),
('DELIVERY_PARTNER'),
('STORE_ADMIN'),
('SUPER_ADMIN');

INSERT INTO users (name, email, phone, password, role_id) VALUES
('Rahul Deshmukh', 'rahul.admin@ordify.com', '9876543210', 'pass123', 4);

INSERT INTO users (name, email, phone, password, role_id) VALUES
('Sneha Kulkarni', 'sneha.store@ordify.com', '9823012345', 'pass123', 3);

INSERT INTO users (name, email, phone, password, role_id) VALUES
('Amit Patil', 'amit.user@gmail.com', '9765432109', 'pass123', 1);

INSERT INTO users (name, email, phone, password, role_id) VALUES
('Rohit Jadhav', 'rohit.delivery@ordify.com', '9898123456', 'pass123', 2);

INSERT INTO dark_store (store_name, latitude, longitude, delivery_radius_km) VALUES
('Ordify Baner Store', 18.5590, 73.7868, 5),
('Ordify Wakad Store', 18.5993, 73.7645, 5);


INSERT INTO store_admin (user_id, store_id) VALUES
(2, 1);

INSERT INTO product (name, description, category, price) VALUES
('Tata Salt 1kg', 'Refined Iodized Salt', 'Grocery', 28.00),
('Amul Milk 1L', 'Full Cream Milk', 'Dairy', 62.00),
('Aashirvaad Atta 5kg', 'Whole Wheat Flour', 'Grocery', 275.00),
('Maggi Noodles', '2-Minute Noodles', 'Snacks', 14.00);


INSERT INTO inventory (store_id, product_id, quantity) VALUES
(1, 1, 100),  -- Tata Salt
(1, 2, 80),   -- Amul Milk
(1, 3, 50),   -- Atta
(1, 4, 200);  -- Maggi


INSERT INTO inventory (store_id, product_id, quantity) VALUES
(2, 1, 120),
(2, 2, 90),
(2, 4, 150);


INSERT INTO delivery_partner (user_id, is_online, current_latitude, current_longitude) VALUES
(4, TRUE, 18.5640, 73.7890);  -- Near Baner area

INSERT INTO orders (
    user_id,
    store_id,
    order_status,
    total_amount,
    delivery_latitude,
    delivery_longitude
) VALUES (
    3,
    1,
    'CREATED',
    379.00,
    18.5615,   -- Customer location (Baner)
    73.7842
);

INSERT INTO order_item (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 28.00),   -- Tata Salt
(1, 2, 2, 62.00),  -- 2 Amul Milk
(1, 4, 5, 14.00);  -- 5 Maggi


INSERT INTO delivery_assignment (order_id, delivery_partner_id, status) VALUES
(1, 1, 'ASSIGNED');


INSERT INTO delivery_location_log (delivery_partner_id, latitude, longitude) VALUES
(1, 18.5660, 73.7900),
(1, 18.5630, 73.7880),
(1, 18.5618, 73.7855);
