package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login")
public class loginController {

    @RequestMapping(method = RequestMethod.GET)
    public String login(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "integrated:login";
    }

}
