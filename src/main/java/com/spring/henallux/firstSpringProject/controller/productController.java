package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.Cart;
import com.spring.henallux.firstSpringProject.Model.CartLine;
import com.spring.henallux.firstSpringProject.Model.Product;
import com.spring.henallux.firstSpringProject.dataAccess.dao.ProductDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.spring.henallux.firstSpringProject.service.Constants;

import java.util.HashMap;
import java.util.Locale;

@Controller
public class productController {

    private ProductDataAccess productDAO;

    @Autowired
    public productController(ProductDataAccess productDAO){
        this.productDAO = productDAO;
    }

    @GetMapping("/product/{productName}-{productId}")
    public String product(@PathVariable String productName, @PathVariable Integer productId, Model model, Locale locale){
        Product product = productDAO.findByLabelEnAndId(productName, productId);
        model.addAttribute("product", product);
        model.addAttribute("locale", locale);
        CartLine cartLine = new CartLine();
        cartLine.setQuantity(1);
        model.addAttribute("cartLine", cartLine);

        return "integrated:product";
    }
}
