package com.spring.henallux.ecommerce.Model;

public class OrderLine {
    private int id;
    private int quantity;
    private Double price;
    private Product product;
    private Order order;

    public OrderLine() {}

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public Double getPrice() {
        return price;
    }

    public Product getProduct() {
        return product;
    }

    public Order getOrder() {
        return order;
    }

    public double getTotalPrice() {
        return quantity * price;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
