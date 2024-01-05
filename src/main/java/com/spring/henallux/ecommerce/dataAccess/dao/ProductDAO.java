package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.Category;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.dataAccess.entity.CategoryEntity;
import com.spring.henallux.ecommerce.dataAccess.entity.ProductEntity;
import com.spring.henallux.ecommerce.dataAccess.repository.ProductRepository;
import com.spring.henallux.ecommerce.dataAccess.util.ProviderConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ProductDAO implements ProductDataAccess {

    private ProductRepository productRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public ProductDAO(ProductRepository productRepository, ProviderConverter providerConverter) {
        this.productRepository = productRepository;
        this.providerConverter = providerConverter;
    }

    public Product findByLabelEnAndId(String labelEn, Integer id) {
        ProductEntity productEntity = productRepository.findByLabelEnAndId(labelEn, id);

        if (productEntity == null) {
            return null;
        }

        return providerConverter.productEntityToProduct(productEntity);
    }

    public Product findById(Integer id) {
        ProductEntity productEntity = productRepository.findById(id);

        if (productEntity == null) {
            return null;
        }

        return providerConverter.productEntityToProduct(productEntity);
    }

    public ArrayList<Product> findByCategory(Category category) {
        System.out.println("TEST2");
        CategoryEntity categoryEntity = providerConverter.categoryToCategoryEntity(category);
        System.out.println("TEST3");
        ArrayList<ProductEntity> productEntity = productRepository.findAllByCategoryId(categoryEntity);
        System.out.println("TEST4");

        ArrayList<Product> products = new ArrayList<>();

        for(ProductEntity product : productEntity) {
            products.add(providerConverter.productEntityToProduct(product));
        }

        return products;
    }

    public ArrayList<Product> findAll() {
        ArrayList<ProductEntity> productEntity = productRepository.findAll();

        ArrayList<Product> products = new ArrayList<>();

        for(ProductEntity product : productEntity) {
            products.add(providerConverter.productEntityToProduct(product));
        }

        return products;
    }
}
