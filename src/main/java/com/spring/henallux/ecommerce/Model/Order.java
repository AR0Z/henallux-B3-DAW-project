package com.spring.henallux.ecommerce.Model;

import java.util.HashMap;

public class Order {
    private Integer id;
    private String date;
    private String orderStatus;
    private String paypalOderId;
    private Integer userId;

    private HashMap<Integer, OrderLine> orderLines;
    public Order() {}

    public Integer getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public String getPaypalOderId() {
        return paypalOderId;
    }

    public HashMap<Integer, OrderLine> getOrderLines() {
        return orderLines;
    }

    public float getTotalPrice() {
        float totalPrice = 0;
        for (OrderLine orderLine : orderLines.values()) {
            totalPrice += orderLine.getPrice() * orderLine.getQuantity();
        }
        return totalPrice;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public void setPaypalOderId(String paypalOderId) {
        this.paypalOderId = paypalOderId;
    }

    public void setOrderLines(HashMap<Integer, OrderLine> orderLines) {
        this.orderLines = orderLines;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

}
