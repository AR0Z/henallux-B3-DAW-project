package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Cart;
import com.spring.henallux.ecommerce.service.Constants;
import com.spring.henallux.ecommerce.service.PaypalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value="/payment")
@SessionAttributes({Constants.CURRENT_CART})
public class PaymentController {

    private PaypalService paypalService;

    @Autowired
    public PaymentController(PaypalService paypalService) {
        this.paypalService = paypalService;
    }

    @RequestMapping(value="/paypal", method = RequestMethod.POST)
    public String createPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart) {

        //check if cart is empty
        if(cart.getCartLines().isEmpty()) {
            return "redirect:/cart";
        }

        // save order in database

    }


}
