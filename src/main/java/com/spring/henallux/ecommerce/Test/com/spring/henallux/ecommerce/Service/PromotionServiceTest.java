package com.spring.henallux.ecommerce.Service;

import com.spring.henallux.ecommerce.DataAccess.dao.ProductDAO;
import com.spring.henallux.ecommerce.DataAccess.dao.ProductDataAccess;
import com.spring.henallux.ecommerce.DataAccess.repository.ProductRepository;
import com.spring.henallux.ecommerce.DataAccess.util.ProviderConverter;
import com.spring.henallux.ecommerce.Model.Product;
import org.junit.*;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class PromotionServiceTest {

    private PromotionService promotionService;
    private ProductDataAccess productDAO;
    private ProviderConverter providerConverter;

    @Mock
    private ProductRepository productRepository;

    @Before
    void setUp() throws Exception {
        providerConverter = new ProviderConverter();
        productDAO = new ProductDAO(productRepository, providerConverter);
        promotionService = new PromotionService(productDAO);
    }

    @Test
    void applyPromotion() {
        Product product = new Product();

        assertThat(product.getPrice()).isEqualTo(599.99);

        product = promotionService.applyPromotion(product);

        assertThat(product.getPrice()).isEqualTo(479.99);

    }
}