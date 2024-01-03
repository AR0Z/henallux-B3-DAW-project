package com.spring.henallux.ecommerce.dataAccess.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;

@Entity
@Table(name = "irders_lines")
public class LineEntity {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "product_id")
    private Integer productId;
    @Column(name = "order_id")
    private Integer orderId;
    @Column(name = "price")
    @Min(0)
    private Double price;
}
