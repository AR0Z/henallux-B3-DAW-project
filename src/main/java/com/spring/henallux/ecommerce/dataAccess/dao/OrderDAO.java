package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;
import com.spring.henallux.ecommerce.dataAccess.repository.OrderRepository;
import com.spring.henallux.ecommerce.dataAccess.repository.UserRepository;
import com.spring.henallux.ecommerce.dataAccess.util.ProviderConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDAO implements OrderDataAccess {
    private OrderRepository orderRepository;
    private ProviderConverter providerConverter;


    @Autowired
    public OrderDAO(OrderRepository orderRepository, ProviderConverter providerConverter) {
        this.orderRepository = orderRepository;
        this.providerConverter = providerConverter;
    }

    public OrderEntity save(Order order) {
        OrderEntity orderEntity = providerConverter.orderToOrderEntity(order);

        orderEntity = orderRepository.save(orderEntity);

        return orderEntity;
    }

    public Order findById(Integer id) {
        OrderEntity orderEntity = orderRepository.findById(id);
        return providerConverter.orderEntityToOrder(orderEntity);
    }

}
