package com.spring.henallux.firstSpringProject.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
    private Integer id;
    private String labelEn;
    private String labelFr;
    private String beginDate;
    private String endDate;
    private Integer percentage;
    private String type;
}
