use ecommerce;
-- Insertion dans la table categories
INSERT INTO categories (label_en, label_fr)
VALUES
    ('Living Room', 'Salon'),
    ('Bedroom', 'Chambre'),
    ('Kitchen', 'Cuisine'),
    ('Office', 'Bureau'),
    ('Dining Room', 'Salle à manger'),
    ('Outdoor', 'Extérieur'),
    ('Bathroom', 'Salle de bains'),
    ('Kids Room', 'Chambre d\'enfant'),
    ('Storage', 'Rangement'),
    ('Decor', 'Décoration');

-- Insertion dans la table promotions
INSERT INTO promotions (begin_date, end_date, label_en, label_fr, percentage, type)
VALUES
    ('2024-01-01', '2024-01-31', 'New Year Sale', 'Soldes du Nouvel An', 20, 'Seasonal'),
    ('2024-02-14', '2024-02-29', 'Valentine\'s Day Special', 'Spécial Saint Valentin', 15, 'Holiday'),
    ('2024-03-10', '2024-03-20', 'Spring Clearance', 'Liquidation de printemps', 30, 'Seasonal'),
    ('2024-05-01', '2024-05-10', 'Outdoor Furniture Sale', 'Soldes de mobilier d\'extérieur', 25, 'Seasonal'),
    ('2024-06-21', '2024-07-05', 'Summer Festival Discounts', 'Réductions du festival d\'été', 18, 'Seasonal'),
    ('2024-09-01', '2024-09-10', 'Back to School Sale', 'Vente de rentrée scolaire', 22, 'Seasonal'),
    ('2024-10-25', '2024-11-05', 'Autumn Home Refresh', 'Rafraîchissement de la maison d\'automne', 28, 'Seasonal'),
    ('2024-11-15', '2024-11-30', 'Black Friday Extravaganza', 'Extravagance du Black Friday', 35, 'Holiday'),
    ('2024-12-10', '2024-12-25', 'Holiday Season Deals', 'Offres de la saison des fêtes', 40, 'Holiday'),
    ('2025-01-01', '2025-01-15', 'New Year New Furniture', 'Nouvelle année, nouveau mobilier', 20, 'Seasonal');

-- Insertion dans la table products
INSERT INTO products (date_added, description_en, description_fr, dimension, label_en, label_fr, price, stock, weight, category_id, promotion_id)
VALUES
    ('2023-12-20', 'Comfortable sofa', 'Canapé confortable', '80x35x40', 'Cozy Sofa', 'Canapé confortable', 599.99, 50, 40.5, 1, 1),
    ('2024-01-05', 'Elegant bed frame', 'Cadre de lit élégant', '160x200', 'Elegant Bed Frame', 'Cadre de lit élégant', 799.99, 30, 65.2, 2, 2),
    ('2024-02-10', 'Modern dining table', 'Table à manger moderne', '120x80x75', 'Modern Dining Table', 'Table à manger moderne', 499.99, 20, 30.8, 5, 3),
    ('2024-03-25', 'Adjustable office chair', 'Chaise de bureau réglable', '60x60x110', 'Adjustable Office Chair', 'Chaise de bureau réglable', 199.99, 40, 15.6, 4, 4),
    ('2024-04-12', 'Outdoor lounge set', 'Ensemble de salon extérieur', '200x150x80', 'Outdoor Lounge Set', 'Ensemble de salon extérieur', 899.99, 15, 75.0, 6, 5),
    ('2024-05-30', 'Bathroom vanity set', 'Ensemble de salle de bains', '100x50x85', 'Bathroom Vanity Set', 'Ensemble de salle de bains', 349.99, 25, 50.3, 7, 6),
    ('2024-06-15', 'Kids bunk bed', 'Lits superposés pour enfants', '90x190', 'Kids Bunk Bed', 'Lits superposés pour enfants', 399.99, 10, 45.9, 8, 7),
    ('2024-07-20', 'Storage cabinet', 'Armoire de rangement', '120x40x180', 'Storage Cabinet', 'Armoire de rangement', 299.99, 35, 55.0, 9, 8),
    ('2024-08-05', 'Decorative vase', 'Vase décoratif', '30x30x50', 'Decorative Vase', 'Vase décoratif', 49.99, 60, 5.2, 10, 9),
    ('2024-09-10', 'Bookshelf', 'Étagère à livres', '100x30x150', 'Bookshelf', 'Étagère à livres', 179.99, 25, 22.7, 9, 10);

-- Insertion dans la table users
INSERT INTO users (account_non_expired, account_non_locked, authorities, credentials_non_expired, delivery_address, email, enabled, first_name, last_name, password, phone_number)
VALUES
    (1, 1, 'ROLE_USER', 1, '123 Main St, City', 'user1@example.com', 1, 'John', 'Doe', 'password123', '123-456-7890'),
    (1, 1, 'ROLE_USER', 1, '456 Elm St, Town', 'user2@example.com', 1, 'Jane', 'Smith', 'password456', '987-654-3210'),
    (1, 1, 'ROLE_ADMIN', 1, '789 Oak St, Village', 'admin@example.com', 1, 'Admin', 'Adminson', 'adminpass', '555-555-5555');

-- Insertion dans la table orders
INSERT INTO orders (date, order_status, paypal_order_id, user_id)
VALUES
    ('2024-01-10', 'Pending', 'PAYPAL123', 1),
    ('2024-02-20', 'Delivered', 'PAYPAL456', 2),
    ('2024-03-15', 'Processing', 'PAYPAL789', 3);

-- Insertion dans la table orders_lines
INSERT INTO orders_lines (price, quantity, order_id, product_id)
VALUES
    (599.99, 1, 1, 1),
    (799.99, 1, 2, 2),
    (499.99, 1, 3, 3),
    (199.99, 2, 3, 4);