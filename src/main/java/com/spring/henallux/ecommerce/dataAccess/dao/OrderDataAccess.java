package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;

import java.util.ArrayList;
import java.util.HashMap;

public interface OrderDataAccess {
    OrderEntity save(Order order);
    Order findById(int id);
    HashMap<Integer, Order> findAllByUserId(User user);
}
