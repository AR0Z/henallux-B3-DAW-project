package com.spring.henallux.ecommerce.dataAccess.repository;

import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderLineRepository extends JpaRepository<OrderEntity, String> {
}
