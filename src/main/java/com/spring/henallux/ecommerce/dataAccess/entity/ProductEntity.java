package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
public class ProductEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int id;

    @Column(name = "label_en")
    @Length(min = 1, max = 50)
    private String labelEn;

    @Column(name = "label_fr")
    @Length(min = 1, max = 50)
    private String labelFr;

    @Column(name = "description_en")
    @Length(min = 1, max = 100)

    private String descriptionEn;

    @Column(name = "description_fr")
    @Length(min = 1, max = 100)
    private String descriptionFr;

    @OneToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity categoryId;

    @OneToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotionId;

    @Column(name = "dimension")
    @Length(min = 1, max = 50)
    private String dimension;

    @Column(name = "weight")
    @Min(0)
    private double weight;

    @Column(name = "price")
    @Min(0)
    private double price;

    @Column(name = "stock")
    @Min(0)
    private int stock;

    @Column(name = "date_added")
    private Date dateAdded;
}
