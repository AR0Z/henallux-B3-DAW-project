package com.spring.henallux.ecommerce.Model;

import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.HashMap;

@NoArgsConstructor
@Getter
@Setter
public class Order {
    private int id;
    private Date date;
    private String orderStatus;
    private String paypalOrderId;
    private User userId;
    private HashMap<Integer, OrderLine> orderLines;
    public float getTotalPrice() {
        float totalPrice = 0;
        for (OrderLine orderLine : orderLines.values()) {
            totalPrice += orderLine.getPrice() * orderLine.getQuantity();
        }
        return totalPrice;
    }

    public float getTotalPriceWithShippingCost() {
        float totalPrice = 0;
        for (OrderLine orderLine : orderLines.values()) {
            totalPrice += orderLine.getPrice() * orderLine.getQuantity();
        }
        totalPrice += 5;
        return totalPrice;
    }
}
