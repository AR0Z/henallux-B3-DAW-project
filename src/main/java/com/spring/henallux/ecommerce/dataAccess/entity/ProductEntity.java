package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.util.List;

@Entity
@Table(name="products")
@Getter
@Setter
@NoArgsConstructor
public class ProductEntity {

    @Id
    @Column(name="product_id")
    private Integer id;

    @Column(name="label_en")
    private String labelEn;

    @Column(name="label_fr")
    private String labelFr;

    @Column(name="description_en")
    private String descriptionEn;

    @Column(name="description_fr")
    private String descriptionFr;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinColumn(name="product_id")
    private List<CategoryEntity> categoryId;

    @OneToOne
    @JoinColumn(name="promotion_id")
    private PromotionEntity promotionId;

    @Column(name="dimension")
    private String dimension;

    @Column(name="weight")
    @Min(0)
    private Double weight;

    @Column(name="price")
    @Min(0)
    private Double price;

    @Column(name="stock")
    @Min(0)
    private Integer stock;

    @Column(name="date_added")
    private String dateAdded;
}
