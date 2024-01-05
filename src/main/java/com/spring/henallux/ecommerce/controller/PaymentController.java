package com.spring.henallux.ecommerce.controller;

import com.spring.henallux.ecommerce.Model.Cart;
import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.dao.*;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.service.Constants;
import com.spring.henallux.ecommerce.service.PaypalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;

@Controller
@RequestMapping(value="/payment")
@SessionAttributes({Constants.CURRENT_ORDER})
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
    public ResponseEntity<String>  createPayment(@ModelAttribute(value=Constants.CURRENT_ORDER) Order order, Authentication authentication) {
        // if order null
        if (order == null)
            return ResponseEntity.ok("{\"status\": \"error\", \"message\": \"Order not found.\"}");

        // if order status is not pending
        if (!order.getStatus().equals("Pending"))
            return ResponseEntity.ok("{\"status\": \"error\", \"message\": \"Order status is not pending.\"}");

        // create payment
        ResponseEntity<String> response = paypalService.createPayment(order);

        // get approval url
        return response;
    }

    @RequestMapping(value="/paypal/capture/{orderID}", method = RequestMethod.POST)
    public ResponseEntity<String>  capturePayment(@PathVariable String orderID, @ModelAttribute(value=Constants.CURRENT_ORDER) Order order, Authentication authentication) {

        // capture payment
        ResponseEntity<String> response = paypalService.capturePayment(orderID);

        // check if payment is successful
        if(response.getStatusCode().isError()) {
            return response;
        }


        order.setStatus("Paid");

        orderDAO.save(order);

        return response;
    }

    @RequestMapping(value="/paypal/success", method = RequestMethod.GET)
    public String  successPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        return "integrated:success";
    }

    @RequestMapping(value="/paypal/error", method = RequestMethod.GET)
    public String  errorPayment() {
        return "integrated:error";
    }

    @RequestMapping(value="/paypal/cancel/", method = RequestMethod.POST)
    public ResponseEntity<String>  cancelPayment(@ModelAttribute(value=Constants.CURRENT_ORDER) Order order, Authentication authentication) {

        order.setStatus("Canceled");

        orderDAO.save(order);

        String jsonResponse = "{\"status\": \"canceled\", \"message\": \"Payment has been canceled.\"}";

        // Renvoie la réponse formatée
        return ResponseEntity.ok(jsonResponse);
    }


}
