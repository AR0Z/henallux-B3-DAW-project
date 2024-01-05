package com.spring.henallux.ecommerce.dataAccess.repository;

import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderLineEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;

public interface OrderLineRepository extends JpaRepository<OrderLineEntity, String> {
    ArrayList<OrderLineEntity> findAllByOrderId(OrderEntity orderEntity);
}
