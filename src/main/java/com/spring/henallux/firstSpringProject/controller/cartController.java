package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.Cart;
import com.spring.henallux.firstSpringProject.Model.CartLine;
import com.spring.henallux.firstSpringProject.Model.Product;
import com.spring.henallux.firstSpringProject.dataAccess.dao.ProductDataAccess;
import com.spring.henallux.firstSpringProject.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
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

    private ProductDataAccess productDAO;

    @Autowired
    public cartController(ProductDataAccess productDAO){
        this.productDAO = productDAO;
    }

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

        Product product = productDAO.findById(productId);
        HashMap<String, Object> response = new HashMap<>();
        if(product == null) {
            response.put("error", "Product not found");
            return ResponseEntity.ok(response);
        }

        if(quantity < 1) {
            cart.removeProduct(productId);
        } else {
            if(product.getStock() < quantity){
                response.put("error", "Not enough stock");
                response.put("maxQuantity", product.getStock());
                return ResponseEntity.ok(response);
            }
            cart.editQuantity(productId, quantity);
        }
        // return response with new total price and total price with shipping cost
        response.put("success", true);
        response.put("totalPrice", cart.getTotalPrice());
        response.put("totalPriceWithShippingCost", cart.getTotalPriceWithShippingCost());

        // return response
        return  ResponseEntity.ok(response);
    }

    @RequestMapping(value="/addProduct", method = RequestMethod.POST)
    public ResponseEntity<?> addProduct(@RequestParam int productId, @RequestParam int quantity, Locale locale,
                                        @ModelAttribute(value = Constants.CURRENT_CART) Cart cart) {
        Product product = productDAO.findById(productId);
        HashMap<String, Object> response = new HashMap<>();

        if(product == null) {
            response.put("error", "Product not found");
            return ResponseEntity.ok(response);
        }



        // check if user alradey has this product in his cart and add quantity to it
        if(cart.getCartLines().containsKey(productId)){
            quantity += cart.getCartLines().get(productId).getQuantity();
        }

        if(product.getStock() < quantity){
            response.put("error", "Not enough stock");
        }
        else{
            CartLine cartLine = new CartLine();
            cartLine.setProduct(product);
            cartLine.setQuantity(quantity);
            cart.addProduct(cartLine);
            response.put("success", "Product added to cart");
        }


        return ResponseEntity.ok(response);
    }

    @RequestMapping(method = RequestMethod.POST)
    public String cartPost(){
        System.out.println("cartPost");
        return "redirect:/";
    }
}
