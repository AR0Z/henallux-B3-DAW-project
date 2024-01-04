package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Category;
import com.spring.henallux.ecommerce.Model.SearchForm;
import com.spring.henallux.ecommerce.dataAccess.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value="/")
public class homeController {

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model) {
        return "integrated:home";
    }
}
