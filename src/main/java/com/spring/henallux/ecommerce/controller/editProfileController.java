package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.PasswordChangeForm;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.Model.UserEdit;
import com.spring.henallux.ecommerce.dataAccess.dao.OrderDataAccess;
import com.spring.henallux.ecommerce.dataAccess.dao.OrderLineDataAccess;
import com.spring.henallux.ecommerce.dataAccess.dao.UserDataAccess;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping(value="/editProfile")
public class editProfileController {

    private UserDataAccess userDAO;
    private OrderDataAccess orderDAO;
    private OrderLineDataAccess orderLineDAO;

    @Autowired
    public editProfileController(UserDataAccess userDAO, OrderDataAccess orderDAO, OrderLineDataAccess orderLineDA){
        this.userDAO = userDAO;
        this.orderDAO = orderDAO;
        this.orderLineDAO = orderLineDA;
    }
    @RequestMapping(method = RequestMethod.GET)
    public String editProfile(Model model, Authentication authentication)    {
        User oldUser = (User) authentication.getPrincipal();

        UserEdit user = new UserEdit();

        user.setEmail(oldUser.getEmail());
        user.setFirstName(oldUser.getFirstName());
        user.setLastName(oldUser.getLastName());
        user.setDeliveryAddress(oldUser.getDeliveryAddress());
        user.setPhoneNumber(oldUser.getPhoneNumber());

        model.addAttribute("user", user);


        User userInDb = userDAO.findByEmail(oldUser.getEmail());

        HashMap<Integer, Order> orders = orderDAO.findAllByUserId(userInDb);

        for(Order order : orders.values()){
            order.setOrderLines(orderLineDAO.findAllByOrderId(order));
        }

        model.addAttribute("orders", orders);
        model.addAttribute("passwordchangeform", new PasswordChangeForm());

        return "integrated:editProfile";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String editProfileSubmit(Model model, @Valid @ModelAttribute(value="user") UserEdit user, Authentication authentication, final BindingResult errors) {
        User oldUser = (User) authentication.getPrincipal();
        model.addAttribute("user", user);

        //check
        if(errors.hasErrors()){
            model.addAttribute("user", user);
            return "integrated:editProfile";
        }


        //check email already exist
        if(!oldUser.getEmail().equals(user.getEmail()) && userDAO.findByEmail(user.getEmail()) != null){
            model.addAttribute("user", user);
            model.addAttribute("error", "Email already exist");
            return "integrated:editProfile";
        }

        //save to db
        oldUser = userDAO.update(user, oldUser);

        Authentication newAuthentication = new UsernamePasswordAuthenticationToken(oldUser, authentication.getCredentials(), oldUser.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(newAuthentication);

        return "integrated:editProfile";
    }
}
