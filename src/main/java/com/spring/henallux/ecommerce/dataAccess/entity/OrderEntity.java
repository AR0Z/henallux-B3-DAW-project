package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "orders")
@Data
public class OrderEntity {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name ="date")
    private String date;
    @Column(name = "paypal_order_id")
    private String paypalOrderId;
    @Column(name = "order_status")
    private String orderStatus;
    @Column(name = "user_id")
    private Integer userId;

}