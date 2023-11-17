package com.spring.henallux.firstSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="login")
public class loginController {
    @RequestMapping(method = RequestMethod.GET)
    public String login(){
        return "integrated:login";
    }

    // post
    @RequestMapping(method = RequestMethod.POST)
    public String loginPost(){

        return "redirect:/";
    }
}
