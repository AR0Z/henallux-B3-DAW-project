package com.spring.henallux.firstSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/")
public class homeController {

    @RequestMapping(method = RequestMethod.GET)
    public String home(){
        return "integrated:home";
    }
}
