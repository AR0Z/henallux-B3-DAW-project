package com.spring.henallux.firstSpringProject.dataAccess.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;

@Entity
@Table(name = "line")
public class LineEntity {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "quantity")
    private Integer quantity;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(foreignKey = @ForeignKey(name = "product_id"))
    private ProductEntity productId;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(foreignKey = @ForeignKey(name = "order_id"))
    private OrderEntity orderId;
    @Column(name = "price")
    @Min(0)
    private Double price;


}
