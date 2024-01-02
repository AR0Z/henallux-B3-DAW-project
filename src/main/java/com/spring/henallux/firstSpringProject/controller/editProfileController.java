package com.spring.henallux.firstSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping(value="/editProfile")
public class editProfileController {
    @RequestMapping
    public String editProfile()    {
        return "integrated:editProfile";
    }
}
