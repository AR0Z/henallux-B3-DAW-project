package com.spring.henallux.ecommerce.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/")
public class homeController {

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model) {
        return "integrated:home";
    }
}
