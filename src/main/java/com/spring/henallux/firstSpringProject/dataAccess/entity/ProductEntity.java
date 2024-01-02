package com.spring.henallux.firstSpringProject.dataAccess.entity;

import javax.persistence.*;

@Entity
@Table(name="products")
public class ProductEntity {

    @Id
    @Column(name="id")
    private Integer id;

    @Column(name="label_en")
    private String labelEn;

    @Column(name="label_fr")
    private String labelFr;

    @Column(name="description_en")
    private String descriptionEn;

    @Column(name="description_fr")
    private String descriptionFr;

    @Column(name="category_id")
    private Integer categoryId;

    @Column(name="promotion_id")
    private Integer promotionId;

    @Column(name="dimension")
    private String dimension;

    @Column(name="weight")
    private float weight;

    @Column(name="price")
    private float price;

    @Column(name="stock")
    private Integer stock;

    @Column(name="date_added")
    private String dateAdded;

    public ProductEntity() {};

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
}
