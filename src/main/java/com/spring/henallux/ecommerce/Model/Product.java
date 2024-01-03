package com.spring.henallux.ecommerce.Model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Locale;


@Getter
@Setter
@NoArgsConstructor
public class Product {
    private Integer id;
    private String labelEn;
    private String labelFr;
    private String descriptionEn;
    private String descriptionFr;
    private List<Category> category;
    private Promotion promotion;
    private String dimension;
    private Double weight;
    private Double price;
    private Integer stock;
    private String dateAdded;

    public String getLocalizedLabel(Locale locale) {
        return "fr".equalsIgnoreCase(locale.getLanguage()) ? labelFr : labelEn;
    }

    public String getLocalizedDescription(Locale locale) {
        return "fr".equalsIgnoreCase(locale.getLanguage()) ? descriptionFr : descriptionEn;
    }
}
