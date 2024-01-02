package com.spring.henallux.firstSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/cart")
public class cartController {

        @RequestMapping(method = RequestMethod.GET)
        public String cart(){
            System.out.println("cart");
            return "integrated:cart";
        }

        @RequestMapping(method = RequestMethod.POST)
        public String cartPost(){
            System.out.println("cartPost");
            return "redirect:/";
        }
}
