package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;

public interface OrderDataAccess {
    OrderEntity save(Order order, UserEntity userEntity);
}
