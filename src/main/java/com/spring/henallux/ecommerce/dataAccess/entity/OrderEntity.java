package com.spring.henallux.ecommerce.dataAccess.entity;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "orders")
@Data
@Setter
@Getter
public class OrderEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer id;
    @Column(name ="date")
    private String date;
    @Column(name = "paypal_order_id")
    private String paypalOrderId;
    @Column(name = "order_status")
    private String orderStatus;
    @OneToOne
    @JoinColumn(name = "user_id")
    private UserEntity userId;

    public String toString() {
    	return "OrderEntity [id=" + id + ", date=" + date + ", paypalOrderId=" + paypalOrderId + ", orderStatus="
    			+ orderStatus + ", userId=" + userId.getId() + "]";
    }
}