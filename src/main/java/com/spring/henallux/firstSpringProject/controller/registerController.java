package com.spring.henallux.firstSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/register")
public class registerController {
        @RequestMapping(method = RequestMethod.GET)
        public String register(){
            System.out.println("register");
            return "integrated:register";
        }
}
