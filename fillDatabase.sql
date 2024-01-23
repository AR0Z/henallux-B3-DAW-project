use ecommerce;
-- Insertion dans la table categories
INSERT INTO categories (label_en, label_fr)
VALUES ('Living Room', 'Salon'),
       ('Bedroom', 'Chambre'),
       ('Kitchen', 'Cuisine'),
       ('Office', 'Bureau'),
       ('Dining Room', 'Salle à manger'),
       ('Outdoor', 'Extérieur'),
       ('Kids Room', 'Chambre d\'enfant'),
       ('Storage', 'Rangement'),
       ('Decor', 'Décoration');

-- Insertion dans la table promotions
INSERT INTO promotions (begin_date, end_date, label_en, label_fr, percentage, type)
VALUES ('2024-01-01', '2024-01-31', 'New Year Sale', 'Soldes du Nouvel An', 20, 'Seasonal'),
       ('2024-02-14', '2024-02-29', 'Valentine\'s Day Special', 'Spécial Saint Valentin', 15, 'Holiday'),
       ('2024-03-10', '2024-03-20', 'Spring Clearance', 'Liquidation de printemps', 30, 'Seasonal'),
       ('2024-05-01', '2024-05-10', 'Outdoor Furniture Sale', 'Soldes de mobilier d\'extérieur', 25, 'Seasonal'),
       ('2024-06-21', '2024-07-05', 'Summer Festival Discounts', 'Réductions du festival d\'été', 18, 'Seasonal'),
       ('2024-09-01', '2024-09-10', 'Back to School Sale', 'Vente de rentrée scolaire', 22, 'Seasonal'),
       ('2024-10-25', '2024-11-05', 'Autumn Home Refresh', 'Rafraîchissement de la maison d\'automne', 28, 'Seasonal'),
       ('2024-11-15', '2024-11-30', 'Black Friday Extravaganza', 'Extravagance du Black Friday', 35, 'Holiday'),
       ('2024-12-10', '2024-12-25', 'Holiday Season Deals', 'Offres de la saison des fêtes', 40, 'Holiday'),
       ('2025-01-01', '2025-01-15', 'New Year New Furniture', 'Nouvelle année, nouveau mobilier', 20, 'Seasonal');

-- Insertion des produits
INSERT INTO products (date_added, description_en, description_fr, dimension, label_en, label_fr, price, stock, weight,
                      category_id, promotion_id)
VALUES
    -- Bureau
    (CURRENT_DATE, 'Table for Office', 'Table pour bureau', '120x80', 'Office Table', 'Table de bureau', 150.00, 10, 15,
     4, 1),
    (CURRENT_DATE, 'Chair for Office', 'Chaise pour bureau', '50x60', 'Office Chair', 'Chaise de bureau', 80.00, 20, 8,
     4, 1),

    -- Chambre
    (CURRENT_DATE, 'Night Table for Bedroom', 'Table de nuit pour chambre', '50x40', 'Bedroom Night Table',
     'Table de nuit chambre', 100.00, 15, 5, 2, 3),
    (CURRENT_DATE, 'Chair for Bedroom', 'Chaise pour chambre', '60x70', 'Bedroom Chair', 'Chaise de chambre', 120.00,
     25, 10, 2, NULL),

    -- Chambre d'enfant
    (CURRENT_DATE, 'Chair for Kids Room', 'Chaise pour chambre d''enfant', '40x30', 'Kids Chair', 'Chaise d''enfant',
     50.00, 30, 5, 7, 4),
    (CURRENT_DATE, 'Armchair for Kids Room', 'Fauteuil pour chambre d''enfant', '60x50', 'Kids Armchair',
     'Fauteuil d''enfant', 80.00, 20, 8, 7, 5),

    -- Cuisine
    (CURRENT_DATE, 'Kitchen Island', 'Îlot de cuisine', '120x80', 'Kitchen Island', 'Îlot de cuisine', 200.00, 10, 20,
     3, 5),
    (CURRENT_DATE, 'Kitchen Stool', 'Tabouret de cuisine', '30x30', 'Kitchen Stool', 'Tabouret de cuisine', 30.00, 30,
     5, 3, 6),

    -- Décoration
    (CURRENT_DATE, 'Canvas Art', 'Toile artistique', '80x60', 'Canvas Art', 'Toile artistique', 80.00, 15, 5,
     9, 7),
    (CURRENT_DATE, 'Woman Canvas', 'Toile de femme', '100x80', 'Woman Canvas', 'Toile de femme', 120.00, 10, 8,
     9, 8),

    -- Extérieur
    (CURRENT_DATE, 'Outdoor Sofa', 'Canapé extérieur', '150x80', 'Outdoor Sofa', 'Canapé extérieur', 300.00, 5, 25,
     6, 9),
    (CURRENT_DATE, 'Outdoor Table', 'Table extérieure', '120x60', 'Outdoor Table', 'Table extérieure', 150.00, 10, 15,
     6, 10),

    -- Rangement
    (CURRENT_DATE, 'Wardrobe', 'Armoire', '150x200', 'Wardrobe', 'Armoire', 250.00, 8, 50, 8, 10),
    (CURRENT_DATE, 'Drawer Unit', 'Caisson', '60x40', 'Drawer Unit', 'Caisson', 120.00, 12, 15, 8, 1),

    -- Salle à manger
    (CURRENT_DATE, 'White Dining Table', 'Table à manger blanche', '120x80', 'White Dining Table',
     'Table à manger blanche', 180.00, 10, 20, 5,
     NULL),
    (CURRENT_DATE, 'Wooden Dining Table', 'Table à manger en bois', '150x90', 'Wooden Dining Table',
     'Table à manger en bois', 220.00, 8, 25, 5,
     NULL),

    -- Salon
    (CURRENT_DATE, 'Sofa for Living Room', 'Canapé pour salon', '200x100', 'Living Room Sofa', 'Canapé de salon',
     400.00, 5, 30, 1, NULL),
    (CURRENT_DATE, 'Chair for Living Room', 'Chaise pour salon', '80x70', 'Living Room Chair', 'Chaise de salon',
     150.00, 10, 15, 1, NULL);

-- Insertion dans la table users
INSERT INTO users (account_non_expired, account_non_locked, authorities, credentials_non_expired, delivery_address,
                   email, enabled, first_name, last_name, password, phone_number)
VALUES (1, 1, 'ROLE_USER', 1, '123 Main St, City', 'user1@example.com', 1, 'John', 'Doe', 'password123',
        '123-456-7890'),
       (1, 1, 'ROLE_USER', 1, '456 Elm St, Town', 'user2@example.com', 1, 'Jane', 'Smith', 'password456',
        '987-654-3210'),
       (1, 1, 'ROLE_ADMIN', 1, '789 Oak St, Village', 'admin@example.com', 1, 'Admin', 'Adminson', 'adminpass',
        '555-555-5555');

-- Insertion dans la table orders
INSERT INTO orders (date, order_status, paypal_order_id, user_id)
VALUES ('2024-01-10', 'Pending', 'PAYPAL123', 1),
       ('2024-02-20', 'Delivered', 'PAYPAL456', 2),
       ('2024-03-15', 'Processing', 'PAYPAL789', 3);

-- Insertion dans la table orders_lines
INSERT INTO orders_lines (price, quantity, order_id, product_id)
VALUES (599.99, 1, 1, 1),
       (799.99, 1, 2, 2),
       (499.99, 1, 3, 3),
       (199.99, 2, 3, 4);