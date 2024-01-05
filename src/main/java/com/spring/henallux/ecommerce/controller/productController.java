package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.CartLine;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.dataAccess.dao.ProductDataAccess;
import com.spring.henallux.ecommerce.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@Controller
public class productController {

    private ProductDataAccess productDAO;
    private PromotionService promotionService;

    @Autowired
    public productController(ProductDataAccess productDAO, PromotionService promotionService){
        this.productDAO = productDAO;
        this.promotionService = promotionService;
    }

    @GetMapping("/product/{productName}-{productId}")
    public String product(@PathVariable String productName, @PathVariable Integer productId, Model model, Locale locale){
        Product product = productDAO.findByLabelEnAndId(productName, productId);

        product = promotionService.applyPromotion(product);

        model.addAttribute("product", product);
        model.addAttribute("locale", locale);
        CartLine cartLine = new CartLine();
        cartLine.setQuantity(1);
        model.addAttribute("cartLine", cartLine);

        if(product == null)
            return "redirect:/error";

        return "integrated:product";
    }
}
