package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.Model.Product;

public interface ProductDataAccess {
    Product findByLabelEnAndId(String labelEn, Integer id);
}
