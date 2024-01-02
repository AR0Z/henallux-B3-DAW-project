package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.Cart;
import com.spring.henallux.firstSpringProject.service.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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

    @RequestMapping(method = RequestMethod.POST)
    public String cartPost(){
        System.out.println("cartPost");
        return "redirect:/";
    }
}
