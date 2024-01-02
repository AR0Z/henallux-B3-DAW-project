package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.Model.Product;
import com.spring.henallux.firstSpringProject.dataAccess.entity.ProductEntity;
import com.spring.henallux.firstSpringProject.dataAccess.repository.ProductRepository;
import com.spring.henallux.firstSpringProject.dataAccess.repository.UserRepository;
import com.spring.henallux.firstSpringProject.dataAccess.util.ProviderConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
