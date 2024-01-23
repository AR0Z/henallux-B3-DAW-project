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
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class PromotionServiceTest {

    private PromotionService promotionService;
    @InjectMocks
    private ProductDataAccess productDAO;
    private ProviderConverter providerConverter;
    private SimpleDateFormat dateFormat;

    @Mock
    private ProductRepository productRepository;

    @BeforeEach
    void setUp() throws Exception {
        providerConverter = new ProviderConverter();
        productDAO = new ProductDAO(productRepository, providerConverter);
        promotionService = new PromotionService(productDAO);
        dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    }

    @Test
    public void FindProductById() throws Exception {

        ProductEntity productEntity = new ProductEntity(1, "Office Table", "Table de bureau", "Table for Office", "Table pour bureau", new CategoryEntity(1, "Living Room", "Salon"), new PromotionEntity(1, "Soldes du Nouvel An", "New Year Sale", 20, "Seasonal", dateFormat.parse("2024-01-01 00:00:00"), dateFormat.parse("2024-01-31 00:00:00")), "120x80", 15, 150, 10, dateFormat.parse("2024-01-23 00:00:00"));

        when(productRepository.findById(1)).thenReturn(productEntity);

        Product product = productDAO.findById(1);

        assertThat(product.getLabelEn()).isEqualTo("Office Table");

        verify(productRepository).findById(1);
    }

    @Test
    public void calculatePromotionOfProducts() throws Exception {
        ArrayList<Product> products = new ArrayList<>();
        ProductEntity productEntity1 = new ProductEntity(1, "Office Table", "Table de bureau", "Table for Office", "Table pour bureau", new CategoryEntity(1, "Living Room", "Salon"), new PromotionEntity(1, "Soldes du Nouvel An", "New Year Sale", 20, "Seasonal", dateFormat.parse("2024-01-01 00:00:00"), dateFormat.parse("2024-01-31 00:00:00")), "120x80", 15, 150, 10, dateFormat.parse("2024-01-23 00:00:00"));
        Product product = providerConverter.productEntityToProduct(productEntity1);
        product.setPromotion(providerConverter.promotionEntityToPromotion(productEntity1.getPromotionId()));
        products.add(product);


        when(productRepository.findById(1)).thenReturn(productEntity1);

        ProductEntity productEntity2 = new ProductEntity(4, "Bedroom Chair", "Chaise de chambre", "Chair for Bedroom", "Chaise pour chambre", new CategoryEntity(2, "Bedroom", "Chambre"), null, "60x70", 10, 120, 25, dateFormat.parse("2024-01-23 00:00:00"));
        products.add(providerConverter.productEntityToProduct(productEntity2));

        when(productRepository.findById(4)).thenReturn(productEntity2);

        products = promotionService.calculatePromotionOfProducts(products);

        assertThat(products.get(0).getPrice()).isEqualTo(120);
        assertThat(products.get(1).getPrice()).isEqualTo(120);
    }

    @Test
    public void applyPromotion() throws Exception {
        ProductEntity productEntity = new ProductEntity(1, "Office Table", "Table de bureau", "Table for Office", "Table pour bureau", new CategoryEntity(1, "Living Room", "Salon"), new PromotionEntity(1, "Soldes du Nouvel An", "New Year Sale", 20, "Seasonal", dateFormat.parse("2024-01-01 00:00:00"), dateFormat.parse("2024-01-31 00:00:00")), "120x80", 15, 150, 10, dateFormat.parse("2024-01-23 00:00:00"));

        when(productRepository.findById(1)).thenReturn(productEntity);

        Promotion promotion = providerConverter.promotionEntityToPromotion(productEntity.getPromotionId());
        Product product = providerConverter.productEntityToProduct(productEntity);

        product.setPromotion(promotion);

        product = promotionService.applyPromotion(product);

        assertThat(product.getPrice()).isEqualTo(120);

    }
}