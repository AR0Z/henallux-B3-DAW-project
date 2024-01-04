package com.spring.henallux.ecommerce.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Locale;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class Category {
    private Integer id;
    private String labelEn;
    private String labelFr;

    public String getLocalizedLabel(Locale locale) {
        return "fr".equalsIgnoreCase(locale.getLanguage()) ? labelFr : labelEn;
    }
}
