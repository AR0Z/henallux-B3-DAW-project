package com.spring.henallux.ecommerce.DataAccess.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "categories")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CategoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private int id;
    @Column(name = "label_fr")
    @Length(min = 1, max = 50)
    @NotNull
    private String labelFr;
    @Length(min = 1, max = 50)
    @Column(name = "label_en")
    @NotNull
    private String labelEn;
}
