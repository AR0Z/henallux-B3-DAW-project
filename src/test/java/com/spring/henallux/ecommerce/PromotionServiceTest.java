package com.spring.henallux.ecommerce;

import com.spring.henallux.ecommerce.DataAccess.dao.ProductDAO;
import com.spring.henallux.ecommerce.DataAccess.dao.ProductDataAccess;
import com.spring.henallux.ecommerce.DataAccess.entity.CategoryEntity;
import com.spring.henallux.ecommerce.DataAccess.entity.ProductEntity;
import com.spring.henallux.ecommerce.DataAccess.entity.PromotionEntity;
import com.spring.henallux.ecommerce.DataAccess.repository.ProductRepository;
import com.spring.henallux.ecommerce.DataAccess.util.ProviderConverter;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.Model.Promotion;
import com.spring.henallux.ecommerce.Service.PromotionService;
import org.junit.*;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
public class PromotionServiceTest {

    private PromotionService promotionService;
    private ProductDataAccess productDAO;
    private ProviderConverter providerConverter;

    @Mock
    private ProductRepository productRepository;

    @Before
    public void setUp() throws Exception {
        providerConverter = new ProviderConverter();
        productDAO = new ProductDAO(productRepository, providerConverter);

        promotionService = new PromotionService(productDAO);
    }

    @Test
    public void applyPromotion() throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ProductEntity productEntity = new ProductEntity(1, "Cozy Sofa", "Canapé confortable", "Comfortable sofa", "Canapé confortable", new CategoryEntity(1, "Living Room", "Salon"), new PromotionEntity(1,  "Soldes du Nouvel An","New Year Sale", 20, "Seasonal", dateFormat.parse("2024-01-01 00:00:00"), dateFormat.parse("2024-01-31 00:00:00")), "80x35x40", 40.5, 599.99,  50, new Date());

        when(productRepository.findById(1)).thenReturn(productEntity);

        assertThat(productEntity.getPrice()).isEqualTo(599.99);

        Promotion promotion = providerConverter.promotionEntityToPromotion(productEntity.getPromotionId());
        Product product = providerConverter.productEntityToProduct(productEntity);

        product.setPromotion(promotion);

        product = promotionService.applyPromotion(product);

        assertThat(product.getPrice()).isEqualTo(479.99);

    }
}