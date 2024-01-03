package com.spring.henallux.firstSpringProject.controller;

import com.spring.henallux.firstSpringProject.Model.User;
import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
@RequestMapping(value="/register")
public class registerController {

    private UserDataAccess userDAO;

    @Autowired
    public registerController(UserDataAccess userDAO){
        this.userDAO = userDAO;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "integrated:register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String registerSubmit(Model model, @Valid @ModelAttribute(value="user") User user, final BindingResult errors) {

        //check error
        if(errors.hasErrors()){
            model.addAttribute("user", user);
            return "integrated:register";
        }

        //check match password
        if(!user.getPassword().equals(user.getPasswordConfirm())){
            model.addAttribute("user", user);
            model.addAttribute("error", "Password doesn't match");
            return "integrated:register";
        }


        //check if user already exist
        if(userDAO.findByEmail(user.getEmail()) != null){
            model.addAttribute("user", user);
            model.addAttribute("error", "User already exist");
            return "integrated:register";
        }

        //crypt password
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(user.getPassword());

        user.setPassword(hashedPassword);

        user.setAuthorities("ROLE_USER");
        user.setAccountNonExpired(true);
        user.setAccountNonLocked(true);
        user.setCredentialsNonExpired(true);
        user.setEnabled(true);

        //save to db
        userDAO.save(user);

        return "redirect:/login";
    }
}