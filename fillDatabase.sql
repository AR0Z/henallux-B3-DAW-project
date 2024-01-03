use ecommerce;
-- Categories
INSERT INTO categories (label_en, label_fr) VALUES
                                                ('Electronics', 'Électronique'),
                                                ('Clothing', 'Vêtements'),
                                                ('Books', 'Livres');

-- Promotions
INSERT INTO promotions (begin_date, end_date, label_en, label_fr, percentage, type) VALUES
                                                                                        ('2024-01-01', '2024-01-15', 'New Year Sale', 'Soldes du Nouvel An', 10, 'Seasonal'),
                                                                                        ('2024-02-14', '2024-02-29', 'Valentine Special', 'Spécial Saint Valentin', 15, 'Holiday');

-- Products
INSERT INTO products (date_added, description_en, description_fr, dimension, label_en, label_fr, price, stock, weight, promotion_id) VALUES
                                                                                                                                         ('2023-12-15', 'Smartphone with high-resolution camera', 'Smartphone avec caméra haute résolution', '5x3x0.3 inches', 'Smartphone X', 'Téléphone intelligent X', 499.99, 100, 0.3, 1),
                                                                                                                                         ('2024-01-05', 'Classic blue jeans', 'Jeans bleu classique', 'Various sizes available', 'Blue Jeans', 'Jeans Bleu', 39.99, 150, 0.8, NULL),
                                                                                                                                         ('2024-02-20', 'Bestseller novel', 'Roman à succès', 'Hardcover, 300 pages', 'The Adventure Begins', 'L\'aventure Commence', 19.99, 75, 1.2, 2);

-- Users
INSERT INTO users (account_non_expired, account_non_locked, authorities, credentials_non_expired, delivery_address, email, enabled, first_name, last_name, password, phone_number) VALUES
                                                                                                                                                                                       (1, 1, 'ROLE_USER', 1, '123 Main St, City', 'user@example.com', 1, 'John', 'Doe', 'password123', '+1234567890'),
                                                                                                                                                                                       (1, 1, 'ROLE_ADMIN', 1, '456 Oak St, Town', 'admin@example.com', 1, 'Admin', 'Smith', 'admin123', '+1987654321');

-- Orders
INSERT INTO orders (date, order_status, paypal_order_id, user_id) VALUES
                                                                      ('2024-01-10', 'Shipped', 'PAYPAL123456', 1),
                                                                      ('2024-02-25', 'Processing', 'PAYPAL789012', 2);

-- Order Lines
INSERT INTO orders_lines (price, quantity, order_id, product_id) VALUES
                                                                     (499.99, 1, 1, 1),
                                                                     (39.99, 2, 1, 2),
                                                                     (19.99, 1, 2, 3);

-- Categories
INSERT INTO categories (label_en, label_fr) VALUES
                                                ('Home Appliances', 'Appareils ménagers'),
                                                ('Beauty', 'Beauté'),
                                                ('Toys', 'Jouets');

-- Promotions
INSERT INTO promotions (begin_date, end_date, label_en, label_fr, percentage, type) VALUES
                                                                                        ('2024-03-01', '2024-03-15', 'Spring Clearance', 'Liquidation de printemps', 20, 'Seasonal'),
                                                                                        ('2024-04-10', '2024-04-30', 'Easter Sale', 'Vente de Pâques', 15, 'Holiday');

-- Products
INSERT INTO products (date_added, description_en, description_fr, dimension, label_en, label_fr, price, stock, weight, promotion_id) VALUES
                                                                                                                                         ('2024-02-10', 'Coffee Maker with 12-cup capacity', 'Machine à café avec une capacité de 12 tasses', '10x8x12 inches', 'Coffee Maker', 'Machine à Café', 79.99, 50, 5.5, 3),
                                                                                                                                         ('2024-03-05', 'Lipstick Set - assorted colors', 'Ensemble de rouge à lèvres - couleurs assorties', 'Pack of 5', 'Lipstick Set', 'Ensemble Rouge à Lèvres', 29.99, 100, 0.2, NULL),
                                                                                                                                         ('2024-04-15', 'Building Blocks Set for creative play', 'Ensemble de blocs de construction pour jeu créatif', '500 pieces', 'Building Blocks', 'Blocs de Construction', 49.99, 80, 3.0, 4);

-- Users
INSERT INTO users (account_non_expired, account_non_locked, authorities, credentials_non_expired, delivery_address, email, enabled, first_name, last_name, password, phone_number) VALUES
                                                                                                                                                                                       (1, 1, 'ROLE_USER', 1, '789 Elm St, Village', 'user2@example.com', 1, 'Alice', 'Johnson', 'pass456', '+1122334455'),
                                                                                                                                                                                       (1, 1, 'ROLE_USER', 1, '101 Pine St, Suburb', 'user3@example.com', 1, 'Emily', 'Brown', 'hello789', '+9988776655');

-- Orders
INSERT INTO orders (date, order_status, paypal_order_id, user_id) VALUES
                                                                      ('2024-03-12', 'Delivered', 'PAYPAL234567', 2),
                                                                      ('2024-04-20', 'Pending', 'PAYPAL345678', 3);

-- Order Lines
INSERT INTO orders_lines (price, quantity, order_id, product_id) VALUES
                                                                     (79.99, 1, 3, 4),
                                                                     (29.99, 3, 3, 5),
                                                                     (49.99, 2, 4, 6);
