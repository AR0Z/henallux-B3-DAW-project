CREATE DATABASE ecommerce;

use ecommerce;

create table ecommerce.categories
(
    category_id int auto_increment primary key,
    label_en    varchar(50) null,
    label_fr    varchar(50) null
);

create table ecommerce.promotions
(
    promotion_id int auto_increment primary key,
    begin_date   datetime    null,
    end_date     datetime    null,
    label_en     varchar(50) null,
    label_fr     varchar(50) null,
    percentage   int         null,
    type         varchar(50) null
);

create table ecommerce.products
(
    product_id     int auto_increment primary key,
    date_added     datetime     null,
    description_en varchar(100) null,
    description_fr varchar(100) null,
    dimension      varchar(50)  null,
    label_en       varchar(50)  null,
    label_fr       varchar(50)  null,
    price          double       null,
    stock          int          null,
    weight         double       null,
    category_id    int          null,
    promotion_id   int          null,
    constraint fk_promotion_id
        foreign key (promotion_id) references ecommerce.promotions (promotion_id),
    constraint fk_category_id
        foreign key (category_id) references ecommerce.categories (category_id)
);

create table ecommerce.users
(
    user_id                 int auto_increment primary key,
    account_non_expired     bit          null,
    account_non_locked      bit          null,
    authorities             varchar(255) null,
    credentials_non_expired bit          null,
    delivery_address        varchar(255) null,
    email                   varchar(255) null,
    enabled                 bit          null,
    first_name              varchar(255) null,
    last_name               varchar(255) null,
    password                varchar(255) null,
    phone_number            varchar(255) null,
    constraint unique_email
        unique (email)
);

create table ecommerce.orders
(
    order_id        int auto_increment primary key,
    date            datetime     null,
    paypal_order_id varchar(255) null,
    order_status    varchar(255) null,
    user_id         int          null,
    constraint fk_user_id
        foreign key (user_id) references ecommerce.users (user_id)
);

create table ecommerce.orders_lines
(
    line_id    int auto_increment primary key,
    price      double null,
    quantity   int    null,
    order_id   int    null,
    product_id int    null,
    constraint fk_order_id
        foreign key (order_id) references ecommerce.orders (order_id),
    constraint fk_product_id
        foreign key (product_id) references ecommerce.products (product_id)
);

