package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "promotions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PromotionEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "promotion_id")
    private int id;
    @Column(name = "label_fr")
    private String labelFr;
    @Column(name = "label_en")
    private String labelEn;
    @Column(name = "percentage")
    private int percentage;
    @Column(name = "type")
    private String type;
    @Column(name = "begin_date")
    private Date beginDate;
    @Column(name = "end_date")
    private Date endDate;
}
