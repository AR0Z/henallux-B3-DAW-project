package com.spring.henallux.firstSpringProject.dataAccess.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "promotion")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PromotionEntity {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "label_fr")
    private String labelFr;
    @Column(name = "label_en")
    private String labelEn;
    @Column(name = "percentage")
    private Integer percentage;
    @Column(name = "type")
    private String type;
    @Column(name = "begin_date")
    private String beginDate;
    @Column(name = "end_date")
    private String endDate;
}
