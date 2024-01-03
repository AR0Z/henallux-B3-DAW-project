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
    public ResponseEntity<String>  createPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        //check if cart is empty
        if(cart.getCartLines().isEmpty()) {
            String jsonResponse = "{\"status\": \"error\", \"message\": \"Empty cart. Please add items to your cart before proceeding with the payment.\"}";

            // Renvoie la réponse formatée avec le statut 400 Bad Request
            return ResponseEntity.badRequest().body(jsonResponse);
        }

        // get userId
        User user = (User) authentication.getPrincipal();

        Order order = cart.toOrder();

        order.setUserId(userDAO.findEntityByEmail(user.getEmail()));

        // save order in database
        OrderEntity orderEntity = orderDAO.save(order);

        // save order lines in database
        orderLineDAO.save(cart.toOrderLines(), orderEntity);

        // create order object

        order.setOrderLines(cart.toOrderLines());

        // create payment
        ResponseEntity<String> response = paypalService.createPayment(order);

        // save order id in session
        cart.setOrderId(orderEntity.getId());

        // get approval url
        return response;
    }

    @RequestMapping(value="/paypal/capture/{orderID}", method = RequestMethod.POST)
    public ResponseEntity<String>  capturePayment(@PathVariable String orderID, @ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        // capture payment
        ResponseEntity<String> response = paypalService.capturePayment(orderID);

        // check if payment is successful
        if(response.getStatusCode().isError()) {
            return response;
        }

        // put order status to paid
        Order order = orderDAO.findById(cart.getOrderId());

        order.setOrderStatus("Paid");

        orderDAO.save(order);

        // clear cart
        cart.clear();

        return response;
    }

    @RequestMapping(value="/paypal/success", method = RequestMethod.GET)
    public String  successPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        return "integrated:success";
    }

    @RequestMapping(value="/paypal/error", method = RequestMethod.GET)
    public String  errorPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {

        return "integrated:error";
    }

    @RequestMapping(value="/paypal/cancel/", method = RequestMethod.POST)
    public ResponseEntity<String>  cancelPayment(@ModelAttribute(value=Constants.CURRENT_CART) Cart cart, Authentication authentication) {
        // set order status to canceled
        Order order = orderDAO.findById(cart.getOrderId());

        order.setOrderStatus("Canceled");

        orderDAO.save(order);

        // clear cart
        cart.clear();

        String jsonResponse = "{\"status\": \"canceled\", \"message\": \"Payment has been canceled.\"}";

        // Renvoie la réponse formatée
        return ResponseEntity.ok(jsonResponse);
    }


}
