package com.spring.henallux.ecommerce.dataAccess.repository;

import com.spring.henallux.ecommerce.dataAccess.entity.CategoryEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderLineEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;

public interface CategoryRepository extends JpaRepository<CategoryEntity, String> {
    ArrayList<CategoryEntity> findAll();
    CategoryEntity findByLabelEn(String labelEn);
}
