package com.spring.henallux.ecommerce.DataAccess.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Min;

@Entity
@Table(name = "orders_lines")
@Getter
@Setter
public class OrderLineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "line_id")
    private int id;
    @Column(name = "quantity")
    @Min(1)
    private int quantity;
    @OneToOne
    @JoinColumn(name = "product_id")
    private ProductEntity productId;
    @OneToOne
    @JoinColumn(name = "order_id")
    private OrderEntity orderId;
    @Column(name = "price")
    @Min(0)
    private Double price;
}
