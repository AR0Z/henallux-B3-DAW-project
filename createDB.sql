CREATE DATABASE ecommerce;

use ecommerce;

create table ecommerce.categories
(
    category_id int auto_increment primary key,
    label_en    varchar(50) not null,
    label_fr    varchar(50) not null
);

create table ecommerce.promotions
(
    promotion_id int auto_increment primary key,
    begin_date   datetime    not null,
    end_date     datetime    not null,
    label_en     varchar(50) not null,
    label_fr     varchar(50) not null,
    percentage   int         not null,
    type         varchar(50) not null
);

create table ecommerce.products
(
    product_id     int auto_increment primary key,
    date_added     datetime     not null,
    description_en varchar(100) not null,
    description_fr varchar(100) not null,
    dimension      varchar(50)  not null,
    label_en       varchar(50)  not null,
    label_fr       varchar(50)  not null,
    price          double       not null,
    stock          int          not null,
    weight         double       not null,
    category_id    int          not null,
    promotion_id   int          null,
    constraint fk_promotion_id
        foreign key (promotion_id) references ecommerce.promotions (promotion_id),
    constraint fk_category_id
        foreign key (category_id) references ecommerce.categories (category_id)
);

create table ecommerce.users
(
    user_id                 int auto_increment primary key,
    account_non_expired     bit          not null,
    account_non_locked      bit          not null,
    authorities             varchar(255) not null,
    credentials_non_expired bit          not null,
    delivery_address        varchar(255) not null,
    email                   varchar(255) not null,
    enabled                 bit          not null,
    first_name              varchar(255) not null,
    last_name               varchar(255) not null,
    password                varchar(255) not null,
    phone_number            varchar(255) not null,
    constraint unique_email
        unique (email)
);

create table ecommerce.orders
(
    order_id        int auto_increment primary key,
    date            datetime     not null,
    paypal_order_id varchar(255) null,
    order_status    varchar(255) not null,
    user_id         int          not null,
    constraint fk_user_id
        foreign key (user_id) references ecommerce.users (user_id)
);

create table ecommerce.orders_lines
(
    line_id    int auto_increment primary key,
    price      double not null,
    quantity   int    not null,
    order_id   int    not null,
    product_id int    not null,
    constraint fk_order_id
        foreign key (order_id) references ecommerce.orders (order_id),
    constraint fk_product_id
        foreign key (product_id) references ecommerce.products (product_id)
);

