package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Cart;
import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.dao.*;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.service.Constants;
import com.spring.henallux.ecommerce.service.PaypalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.transaction.Transactional;

@Controller
@RequestMapping(value="/payment")
@SessionAttributes({Constants.CURRENT_CART})
public class PaymentController {

    private PaypalService paypalService;
    private OrderDataAccess orderDAO;
    private OrderLineDataAccess orderLineDAO;
    private UserDataAccess userDAO;

    @Autowired
    public PaymentController(PaypalService paypalService, OrderDataAccess orderDAO, OrderLineDataAccess orderLineDAO, UserDataAccess userDAO) {
        this.paypalService = paypalService;
        this.orderDAO = orderDAO;
        this.orderLineDAO = orderLineDAO;
        this.userDAO = userDAO;
    }

    @Transactional
    @RequestMapping(value="/paypal", method = RequestMethod.POST)
    public String createPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        //check if cart is empty
        if(cart.getCartLines().isEmpty()) {
            return "redirect:/cart";
        }

        // get userId
        User user = (User) authentication.getPrincipal();

        // save order in database
        OrderEntity orderEntity = orderDAO.save(cart.toOrder(), userDAO.findEntityByEmail(user.getEmail()));

        // save order lines in database
        orderLineDAO.save(cart.toOrderLines(), orderEntity);
    }


}
