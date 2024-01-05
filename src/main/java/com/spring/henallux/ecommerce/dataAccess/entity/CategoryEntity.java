package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "categories")
@Getter
@Setter
@NoArgsConstructor
public class CategoryEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "category_id")
    private int id;
    @Column(name = "label_fr")
    private String labelFr;
    @Column(name = "label_en")
    private String labelEn;
}
