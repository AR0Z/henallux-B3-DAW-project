package com.spring.henallux.ecommerce.Model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;

@NoArgsConstructor
@Getter
@Setter
public class Order {
    private Integer id;
    private String date;
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
}
