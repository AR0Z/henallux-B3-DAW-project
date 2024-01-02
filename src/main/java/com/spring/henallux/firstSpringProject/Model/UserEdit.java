package com.spring.henallux.firstSpringProject.Model;

public class UserEdit {
    private String email;
    private String firstName;
    private String lastName;
    private String deliveryAddress;
    private String phoneNumber;

    public UserEdit() { }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFirstName(String firstName) {
    	this.firstName = firstName;
    }

    public void setLastName(String lastName) {
    	this.lastName = lastName;
    }

    public void setDeliveryAddress(String deliveryAddress) {
    	this.deliveryAddress = deliveryAddress;
    }

    public void setPhoneNumber(String phoneNumber) {
    	this.phoneNumber = phoneNumber;
    }
}
