package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Product;

public interface ProductDataAccess {
    Product findByLabelEnAndId(String labelEn, Integer id);
    Product findById(Integer id);
}
