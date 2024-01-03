package com.spring.henallux.ecommerce.Model;

import java.util.HashMap;

public class Order {
    private Integer id;
    private String date;
    private String orderStatus;
    private String paypalOderId;
    private User userId;

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

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

}
