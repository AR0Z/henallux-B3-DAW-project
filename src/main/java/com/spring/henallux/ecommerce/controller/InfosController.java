package com.spring.henallux.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/infos")
public class InfosController {

    @RequestMapping(value = "aboutus", method = RequestMethod.GET)
    public String infos() {
        return "integrated:about";
    }

    @RequestMapping(value = "terms", method = RequestMethod.GET)
    public String terms() {
        return "integrated:terms";
    }

}
