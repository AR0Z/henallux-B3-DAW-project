package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Category;
import com.spring.henallux.ecommerce.Model.Product;
import com.spring.henallux.ecommerce.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.ecommerce.dataAccess.dao.ProductDataAccess;
import com.spring.henallux.ecommerce.service.PromotionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/search-product")
public class SearchProductController {
    private CategoryDataAccess categoryDAO;
    private ProductDataAccess productDAO;
    private PromotionService promotionService;

    public SearchProductController(CategoryDataAccess categoryDAO, ProductDataAccess productDAO, PromotionService promotionService) {
        this.categoryDAO = categoryDAO;
        this.productDAO = productDAO;
        this.promotionService = promotionService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String searchProduct(
            @RequestParam(value = "categoryLabel", required = false) String categoryLabel,
            @RequestParam(value = "filter", required = false) String searchLabel,
            Model model, Locale locale) {
        model.addAttribute("locale", locale);
        ArrayList<Product> products;
        if (categoryLabel == null && searchLabel == null) {
            products = productDAO.findAll();

            products = promotionService.calculatePromotionOfProducts(products);

            model.addAttribute("products", products);
            return "integrated:search-product";
        }
        Category category;
        if (categoryLabel == null) {
            categoryLabel = "all";
        }

        if (categoryLabel.toLowerCase().equals("all")) {
            products = productDAO.findAll();
            if (searchLabel != null) {
                products = filterBySearch(products, searchLabel, locale);
            }
            products = promotionService.calculatePromotionOfProducts(products);

            model.addAttribute("products", products);
            return "integrated:search-product";
        }

        category = categoryDAO.findByLabelEn(categoryLabel);
        System.out.println(category.getId());
        products = productDAO.findByCategory(category);

        if (searchLabel != null) {
            products = filterBySearch(products, searchLabel, locale);
        }

        products = promotionService.calculatePromotionOfProducts(products);

        model.addAttribute("products", products);
        return "integrated:search-product";
    }

    ArrayList<Product> filterBySearch(ArrayList<Product> products, String searchLabel, Locale locale) {
        if (locale.getLanguage().equals("fr")) {
            return products
                    .stream()
                    .filter(product -> product.getLabelFr().toLowerCase().contains(searchLabel.toLowerCase()))
                    .collect(Collectors.toCollection(ArrayList::new));
        }
        return products
                .stream()
                .filter(product -> product.getLabelEn().toLowerCase().contains(searchLabel.toLowerCase()))
                .collect(Collectors.toCollection(ArrayList::new));

    }
}
