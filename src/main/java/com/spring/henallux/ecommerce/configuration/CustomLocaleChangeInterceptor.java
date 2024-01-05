package com.spring.henallux.ecommerce.configuration;

import com.spring.henallux.ecommerce.Model.Category;
import com.spring.henallux.ecommerce.Model.FilterForm;
import com.spring.henallux.ecommerce.Model.SearchForm;
import com.spring.henallux.ecommerce.dataAccess.dao.CategoryDAO;
import com.spring.henallux.ecommerce.dataAccess.dao.CategoryDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

@Component
public class CustomLocaleChangeInterceptor extends LocaleChangeInterceptor {

    private CategoryDataAccess categoryDAO;
    private LocaleResolver localeResolver;

    @Autowired
    public CustomLocaleChangeInterceptor(CategoryDataAccess categoryDAO, LocaleResolver localeResolver) {
        this.categoryDAO = categoryDAO;
        this.localeResolver = localeResolver;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        if (modelAndView != null) {

            ArrayList<Category> categories = categoryDAO.getAllCategories();
            Locale currentLocale = LocaleContextHolder.getLocale();

            // create a map with catgorie link and categorie name with the locale
            Map<String, String> categoriesMap = new java.util.HashMap<>();
            for (Category category : categories) {
                categoriesMap.put(category.getLabelEn(), category.getName(currentLocale));
            }

            modelAndView.addObject("categories", categoriesMap);
            modelAndView.addObject("searchform", new SearchForm());
            modelAndView.addObject("filterform", new FilterForm());
        }
    }
}


