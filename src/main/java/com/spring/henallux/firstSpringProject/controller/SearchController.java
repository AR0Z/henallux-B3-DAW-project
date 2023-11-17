package com.spring.henallux.firstSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class SearchController {
    @GetMapping(value="/search")
    public String search(){
        return "search-result";
    }
}
