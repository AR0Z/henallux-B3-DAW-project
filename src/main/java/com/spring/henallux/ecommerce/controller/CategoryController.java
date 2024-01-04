package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Category;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.ecommerce.dataAccess.dao.ProductDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Locale;

@Controller
@RequestMapping(value="/category")
public class CategoryController {

        private ProductDataAccess productDAO;
        private CategoryDataAccess categoryDAO;

        @Autowired
        public CategoryController(ProductDataAccess productDAO, CategoryDataAccess categoryDAO) {
            this.productDAO = productDAO;
            this.categoryDAO = categoryDAO;
        }

        @RequestMapping(value="/{category}", method = RequestMethod.GET)
        public String category(@PathVariable(value="category") String categoryLabelEn, Model model, Locale locale){
            Category category = categoryDAO.findByLabelEn(categoryLabelEn);

            if(category == null) {
                return "redirect:/";
            }
            ArrayList<Product> products;
            try {
            products = productDAO.findByCategory(category);
            } catch (Exception e) {
                return "redirect:/";
            }

            model.addAttribute("products", products);
            model.addAttribute("locale", locale);

            return "integrated:category";
        }
}
