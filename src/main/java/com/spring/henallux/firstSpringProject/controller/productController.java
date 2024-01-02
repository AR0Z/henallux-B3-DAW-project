package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.Cart;
import com.spring.henallux.firstSpringProject.Model.CartLine;
import com.spring.henallux.firstSpringProject.Model.Product;
import com.spring.henallux.firstSpringProject.dataAccess.dao.ProductDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.spring.henallux.firstSpringProject.service.Constants;

import java.util.Locale;

@Controller
@SessionAttributes({Constants.CURRENT_CART})
public class productController {

    private ProductDataAccess productDAO;

    @ModelAttribute(Constants.CURRENT_CART)
    public Cart cart() {
        return new Cart();
    }

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

    @PostMapping("/product/{productName}-{productId}/add")
    public String addProduct(@PathVariable String productName, @PathVariable Integer productId, Model model, Locale locale,
                             @ModelAttribute(value = Constants.CURRENT_CART) Cart cart, @ModelAttribute(value="cartLine") CartLine cartLine) {
        Product product = productDAO.findByLabelEnAndId(productName, productId);
        cartLine.setProduct(product);

        cart.addProduct(cartLine);

        return "redirect:/product/{productName}-{productId}";
    }
}
