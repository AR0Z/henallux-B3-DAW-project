package com.spring.henallux.ecommerce.dataAccess.repository;

import com.spring.henallux.ecommerce.dataAccess.entity.CategoryEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, String> {
    ProductEntity findByLabelEnAndId(String labelEn, int id);
    ProductEntity findById(int id);
    ArrayList<ProductEntity> findAllByCategoryId(CategoryEntity category);
    ArrayList<ProductEntity> findAll();
}
