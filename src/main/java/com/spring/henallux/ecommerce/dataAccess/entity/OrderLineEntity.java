package com.spring.henallux.ecommerce.dataAccess.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;

@Entity
@Table(name = "orders_lines")
public class OrderLineEntity {
    @Id
    @Column(name = "line_id")
    private Integer id;
    @Column(name = "quantity")
    private Integer quantity;
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
