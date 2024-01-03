package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.Cart;
import com.spring.henallux.firstSpringProject.service.Constants;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Locale;

@Controller
@RequestMapping(value="/cart")
@SessionAttributes({Constants.CURRENT_CART})
public class cartController {

    @ModelAttribute(Constants.CURRENT_CART)
    public Cart cart() {
        return new Cart();
    }

    @RequestMapping(method = RequestMethod.GET)
    public String cart(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Locale locale, Model model) {
        model.addAttribute("locale", locale);
        model.addAttribute("cart", cart);


        return "integrated:cart";
    }

    @RequestMapping(value="/editQuantity", method = RequestMethod.POST)
    public ResponseEntity<?> editQuantity(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, @RequestParam int productId, @RequestParam int quantity) {
        if(quantity < 1) {
            cart.removeProduct(productId);
        } else {
            cart.editQuantity(productId, quantity);
        }
        // return response with new total price and total price with shipping cost
        HashMap<String, Object> response = new HashMap<>();
        response.put("totalPrice", cart.getTotalPrice());
        response.put("totalPriceWithShippingCost", cart.getTotalPriceWithShippingCost());

        // return response
        return  ResponseEntity.ok(response);
    }

    @RequestMapping(method = RequestMethod.POST)
    public String cartPost(){
        System.out.println("cartPost");
        return "redirect:/";
    }
}
