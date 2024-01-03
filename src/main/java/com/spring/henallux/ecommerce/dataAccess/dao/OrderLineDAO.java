package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.OrderLine;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.ProductEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class OrderLineDAO implements OrderLineDataAccess {
    @Override
    public void save(HashMap<Integer, OrderLine> orderLines, OrderEntity orderEntity) {

    }
}
