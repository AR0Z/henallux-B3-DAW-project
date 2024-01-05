package com.spring.henallux.ecommerce.service;

import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.dataAccess.dao.ProductDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
public class PromotionService {
    private ProductDataAccess productDAO;

    @Autowired
    public PromotionService( ProductDataAccess productDAO) {
        this.productDAO = productDAO;
    }

    public ArrayList<Product> calculatePromotionOfProducts(ArrayList<Product> products) {

        ArrayList<Product> productsWithPromotion = new ArrayList<>();

        for (Product product : products) {
            product = applyPromotion(product);
            productsWithPromotion.add(product);
        }

        return productsWithPromotion;
    }

    public Product applyPromotion(Product product) {
        if (product.getPromotion() != null) {
            Date dateNow = new Date();
            if(product.getPromotion().getBeginDate().before(dateNow) && product.getPromotion().getEndDate().after(dateNow)) {
                product.setOldPrice(product.getPrice());
                product.setPrice(product.getPrice() - (product.getPrice() * product.getPromotion().getPercentage() / 100));
                product.setIsPromotion(true);
            }
        }
        return product;
    }


}
