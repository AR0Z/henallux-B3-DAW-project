package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Category;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.dataAccess.entity.CategoryEntity;

import java.util.ArrayList;

public interface ProductDataAccess {
    Product findByLabelEnAndId(String labelEn, Integer id);
    Product findById(Integer id);
    ArrayList<Product> findByCategory(Category category);
}
