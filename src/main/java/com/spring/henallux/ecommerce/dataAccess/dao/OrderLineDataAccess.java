package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.OrderLine;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.ProductEntity;

import java.util.ArrayList;
import java.util.HashMap;

public interface OrderLineDataAccess {
    void save(HashMap<Integer, OrderLine> orderLines, OrderEntity orderEntity);
    HashMap<Integer, OrderLine> findByOrderId(Order orderEntity);
}
