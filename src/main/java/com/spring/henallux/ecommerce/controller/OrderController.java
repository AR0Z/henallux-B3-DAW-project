package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Cart;
import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.OrderLine;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.dao.OrderDataAccess;
import com.spring.henallux.ecommerce.dataAccess.dao.OrderLineDataAccess;
import com.spring.henallux.ecommerce.dataAccess.dao.UserDataAccess;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Locale;

@Controller
@RequestMapping(value="/order")
@SessionAttributes({Constants.CURRENT_CART})
public class OrderController {

    private OrderDataAccess orderDAO;
    private OrderLineDataAccess orderLineDAO;
    private UserDataAccess userDAO;

    @Autowired
    public OrderController(OrderDataAccess orderDAO, OrderLineDataAccess orderLineDAO, UserDataAccess userDAO){
        this.orderDAO = orderDAO;
        this.orderLineDAO = orderLineDAO;
        this.userDAO = userDAO;
    }

    @RequestMapping(value = "{orderId}" ,method = RequestMethod.GET)
    public String order(@PathVariable int orderId, Model model, Locale locale, Authentication authentication){
        // check if order exists
        Order order = orderDAO.findById(orderId);

        if(order == null)
            return "redirect:/error";

        // current user
        User user = (User) authentication.getPrincipal();

        System.out.println(order.getUserId().getId() + " " + user.getId());
        // check if order belongs to user
        if(order.getUserId().getId() != user.getId())
            return "redirect:/error";

        // get order line list
        order.setOrderLines(orderLineDAO.findByOrderId(order));

        model.addAttribute("order", order);
        model.addAttribute("locale", locale);

        return "integrated:order";
    }

    @Transactional
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public ResponseEntity<String> createOder(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        //check if cart is empty
        if(cart.getCartLines().isEmpty()) {
            String jsonResponse = "{\"status\": \"error\", \"message\": \"Empty cart. Please add items to your cart before create order.\"}";

            // Renvoie la réponse formatée avec le statut 400 Bad Request
            return ResponseEntity.badRequest().body(jsonResponse);
        }

        // get userId
        User user = (User) authentication.getPrincipal();

        Order order = cart.toOrder();

        order.setUserId(userDAO.findByEmail(user.getEmail()));

        // save order in database
        OrderEntity orderEntity = orderDAO.save(order);

        // save order lines in database
        orderLineDAO.save(cart.toOrderLines(), orderEntity);

        // create order object

        order.setOrderLines(cart.toOrderLines());

        // return order id
        return ResponseEntity.ok().body("{\"status\": \"success\", \"orderId\": \"" + orderEntity.getId() + "\"}");
    }

}
