package com.spring.henallux.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/terms")
public class termsController {

    @RequestMapping (method= RequestMethod.GET)
    public String terms()    {
        return "integrated:terms";
    }
}
