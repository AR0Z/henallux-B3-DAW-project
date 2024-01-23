package com.spring.henallux.ecommerce.Service;

import com.spring.henallux.ecommerce.DataAccess.dao.ProductDAO;
import com.spring.henallux.ecommerce.DataAccess.dao.ProductDataAccess;
import com.spring.henallux.ecommerce.DataAccess.entity.CategoryEntity;
import com.spring.henallux.ecommerce.DataAccess.entity.ProductEntity;
import com.spring.henallux.ecommerce.DataAccess.entity.PromotionEntity;
import com.spring.henallux.ecommerce.DataAccess.repository.ProductRepository;
import com.spring.henallux.ecommerce.DataAccess.util.ProviderConverter;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.Model.Promotion;
import org.junit.Before;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class PromotionServiceTest {

    private PromotionService promotionService;
    private ProductDataAccess productDAO;
    private ProviderConverter providerConverter;

    @Mock
    private ProductRepository productRepository;

    @BeforeEach
    void setUp() throws Exception {
        providerConverter = new ProviderConverter();
        productDAO = new ProductDAO(productRepository, providerConverter);
        promotionService = new PromotionService(productDAO);
    }

    @Test
    public void applyPromotion() throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ProductEntity productEntity = new ProductEntity(1, "Office Table", "Table de bureau", "Table for Office", "Table pour bureau", new CategoryEntity(1, "Living Room", "Salon"), new PromotionEntity(1, "Soldes du Nouvel An", "New Year Sale", 20, "Seasonal", dateFormat.parse("2024-01-01 00:00:00"), dateFormat.parse("2024-01-31 00:00:00")), "120x80", 15, 150, 10, dateFormat.parse("2024-01-23 00:00:00"));

        when(productRepository.findById(1)).thenReturn(productEntity);

        assertThat(productEntity.getPrice()).isEqualTo(150);

        Promotion promotion = providerConverter.promotionEntityToPromotion(productEntity.getPromotionId());
        Product product = providerConverter.productEntityToProduct(productEntity);

        product.setPromotion(promotion);

        product = promotionService.applyPromotion(product);

        assertThat(product.getPrice()).isEqualTo(120);

    }
}