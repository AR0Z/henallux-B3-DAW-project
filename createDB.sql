CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    delivery_address VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    authorities VARCHAR(255) NOT NULL,
    account_non_expired BOOLEAN NOT NULL,
    account_non_locked BOOLEAN NOT NULL,
    credentials_non_expired BOOLEAN NOT NULL,
    enabled BOOLEAN NOT NULL
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    label_fr VARCHAR(255) NOT NULL,
    label_en VARCHAR(255) NOT NULL
);

CREATE TABLE promotions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    discount FLOAT NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    label_en VARCHAR(255) NOT NULL,
    label_fr VARCHAR(255) NOT NULL,
    description_en VARCHAR(255) NOT NULL,
    description_fr VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    promotion_id INT,
    dimension VARCHAR(255),
    weight FLOAT,
    price FLOAT NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    date_added DATE NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (promotion_id) REFERENCES promotions(id)
);

CREATE TABLE images (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    date_order DATE NOT NULL,
    is_paid BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders_lines (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price FLOAT NOT NULL CHECK (price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
