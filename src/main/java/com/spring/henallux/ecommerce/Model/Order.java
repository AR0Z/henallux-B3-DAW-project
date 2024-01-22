package com.spring.henallux.ecommerce.Model;

import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;

@NoArgsConstructor
@Getter
@Setter
public class Order {
    private int id;
    private Date date;
    private String status;
    private String paypalOrderId;
    private User userId;
    private HashMap<Integer, OrderLine> orderLines;

    public double getTotalPrice() {
        double totalPrice = 0;
        for (OrderLine orderLine : orderLines.values()) {
            totalPrice += orderLine.getPrice() * orderLine.getQuantity();
        }
        totalPrice = Math.round(totalPrice * 100.0) / 100.0;

        return totalPrice;
    }

    public double getTotalPriceWithShippingCost() {
        double totalPrice = 0;
        for (OrderLine orderLine : orderLines.values()) {
            totalPrice += orderLine.getPrice() * orderLine.getQuantity();
        }
        totalPrice += 5;
        totalPrice = Math.round(totalPrice * 100.0) / 100.0;
        return totalPrice;
    }
}
