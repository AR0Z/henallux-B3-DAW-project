package com.spring.henallux.ecommerce.DataAccess.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.Date;

@Entity
@Table(name = "promotions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PromotionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "promotion_id")
    private int id;
    @Column(name = "label_fr")
    @Length(min = 1, max = 50)
    private String labelFr;
    @Column(name = "label_en")
    @Length(min = 1, max = 50)
    private String labelEn;
    @Column(name = "percentage")
    @Min(0)
    @Max(100)
    private int percentage;
    @Column(name = "type")
    @Length(min = 1, max = 50)
    private String type;
    @Column(name = "begin_date")
    private Date beginDate;
    @Column(name = "end_date")
    private Date endDate;
}
