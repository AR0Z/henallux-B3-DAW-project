package com.spring.henallux.firstSpringProject.Model;

import java.util.Locale;

public class Product {
    private Integer id;
    private String labelEn;
    private String labelFr;
    private String descriptionEn;
    private String descriptionFr;
    private Integer categoryId;
    private Integer promotionId;
    private String dimension;
    private float weight;
    private float price;
    private Integer stock;
    private String dateAdded;

    public Product() {};

    public Integer getId() {
        return id;
    }

    public String getLabelEn() {
        return labelEn;
    }

    public String getLabelFr() {
        return labelFr;
    }

    public String getDescriptionEn() {
        return descriptionEn;
    }

    public String getDescriptionFr() {
        return descriptionFr;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public Integer getPromotionId() {
        return promotionId;
    }

    public String getDimension() {
        return dimension;
    }

    public float getWeight() {
        return weight;
    }

    public float getPrice() {
        return price;
    }

    public Integer getStock() {
        return stock;
    }

    public String getDateAdded() {
        return dateAdded;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setLabelEn(String labelEn) {
        this.labelEn = labelEn;
    }

    public void setLabelFr(String labelFr) {
        this.labelFr = labelFr;
    }

    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }

    public void setDescriptionFr(String descriptionFr) {
        this.descriptionFr = descriptionFr;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public void setPromotionId(Integer promotionId) {
        this.promotionId = promotionId;
    }

    public void setDimension(String dimension) {
        this.dimension = dimension;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
    }


    public String getLocalizedLabel(Locale locale) {
        return "fr".equalsIgnoreCase(locale.getLanguage()) ? labelFr : labelEn;
    }

    public String getLocalizedDescription(Locale locale) {
        return "fr".equalsIgnoreCase(locale.getLanguage()) ? descriptionFr : descriptionEn;
    }
}
