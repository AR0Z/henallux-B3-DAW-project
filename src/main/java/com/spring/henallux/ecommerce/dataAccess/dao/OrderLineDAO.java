package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.OrderLine;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderLineEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.ProductEntity;
import com.spring.henallux.ecommerce.dataAccess.repository.OrderLineRepository;
import com.spring.henallux.ecommerce.dataAccess.util.ProviderConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class OrderLineDAO implements OrderLineDataAccess {

    private OrderLineRepository orderLineRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public OrderLineDAO(OrderLineRepository orderLineRepository, ProviderConverter providerConverter) {
        this.orderLineRepository = orderLineRepository;
        this.providerConverter = providerConverter;
    }

    @Override
    public void save(HashMap<Integer, OrderLine> orderLines, OrderEntity orderEntity) {
        for (Map.Entry<Integer, OrderLine> entry : orderLines.entrySet()) {
            OrderLine orderline = entry.getValue();

            ProductEntity productEntity = new ProductEntity();
            productEntity.setId(orderline.getProduct().getId());

            OrderLineEntity orderLineEntity = providerConverter.orderLineToOrderLineEntity(orderline);


        }
    }
}
