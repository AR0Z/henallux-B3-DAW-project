package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
@Getter
@Setter
@NoArgsConstructor
public class CategoryEntity {
    @Id
    @Column(name = "category_id")
    private Integer id;
    @Column(name = "label_fr")
    private String labelFr;
    @Column(name = "label_en")
    private String labelEn;
}
