package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.repository.UserRepository;
import com.spring.henallux.ecommerce.dataAccess.util.ProviderConverter;
import org.springframework.beans.factory.annotation.Autowired;

public class OrderDAO implements OrderDataAccess {
    private UserRepository userRepository;
    private ProviderConverter providerConverter;


    @Autowired
    public OrderDAO(UserRepository userRepository, ProviderConverter providerConverter) {
        this.userRepository = userRepository;
        this.providerConverter = providerConverter;
    }

    public void save() {
        OrderEntity orderEntity = providerConverter.order();
    }
}
