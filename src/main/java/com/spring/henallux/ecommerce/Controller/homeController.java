package com.spring.henallux.ecommerce.Controller;

import com.spring.henallux.ecommerce.DataAccess.dao.ProductDataAccess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

@Controller
@RequestMapping(value = "/")
public class homeController {
    private ProductDataAccess productDAO;

    public homeController(ProductDataAccess productDAO) {
        this.productDAO = productDAO;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model, Locale locale) {
        System.out.println(productDAO.findAll().get(0).getLabelEn());
        model.addAttribute("products", productDAO.findAll());
        model.addAttribute("locale", locale);
        return "integrated:home";
    }
}
