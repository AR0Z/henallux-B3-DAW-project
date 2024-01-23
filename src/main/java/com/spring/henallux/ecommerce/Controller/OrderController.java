package com.spring.henallux.ecommerce.Controller;

import com.spring.henallux.ecommerce.Model.Cart;
import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.DataAccess.dao.OrderDataAccess;
import com.spring.henallux.ecommerce.DataAccess.dao.OrderLineDataAccess;
import com.spring.henallux.ecommerce.DataAccess.dao.UserDataAccess;
import com.spring.henallux.ecommerce.DataAccess.entity.OrderEntity;
import com.spring.henallux.ecommerce.Service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Locale;

@Controller
@RequestMapping(value = "/order")
@SessionAttributes({Constants.CURRENT_ORDER, Constants.CURRENT_CART})
public class OrderController {

    @ModelAttribute(Constants.CURRENT_ORDER)
    public Order order() {
        return new Order();
    }

    private OrderDataAccess orderDAO;
    private OrderLineDataAccess orderLineDAO;
    private UserDataAccess userDAO;

    @Autowired
    public OrderController(OrderDataAccess orderDAO, OrderLineDataAccess orderLineDAO, UserDataAccess userDAO) {
        this.orderDAO = orderDAO;
        this.orderLineDAO = orderLineDAO;
        this.userDAO = userDAO;
    }


    @RequestMapping(value = "{orderId}", method = RequestMethod.GET)
    public String order(@PathVariable int orderId, @ModelAttribute(value = Constants.CURRENT_ORDER) Order order, HttpSession session, Model model, Locale locale, Authentication authentication) {
        // check if order exists
        Order orderDb = orderDAO.findById(orderId);

        if (orderDb == null)
            return "redirect:/error";


        // current user
        User user = (User) authentication.getPrincipal();
        // check if order belongs to user
        if (orderDb.getUserId().getId() != user.getId())
            return "redirect:/error";

        // get order line list
        orderDb.setOrderLines(orderLineDAO.findAllByOrderId(orderDb));

        model.addAttribute("order", orderDb);
        model.addAttribute("locale", locale);

        session.setAttribute(Constants.CURRENT_ORDER, orderDb);

        return "integrated:order";
    }

    @Transactional
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ResponseEntity<String> createOrder(@ModelAttribute(value = Constants.CURRENT_CART) Cart cart, Authentication authentication, Locale locale) {

        //check if cart is empty
        if (cart.getCartLines().isEmpty()) {
            String message = locale == Locale.FRENCH ? "Votre panier est vide" : "Your cart is empty";
            return ResponseEntity.ok().body("{\"status\": \"error\", \"message\": \"" + message + "\"}");
        }

        // get userId
        User user = (User) authentication.getPrincipal();


        if (user == null) {
            String message = locale == Locale.FRENCH ? "Vous devez être connecté pour passer une commande" : "You must be logged in to place an order";
            return ResponseEntity.ok().body("{\"status\": \"needLogin\", \"message\": \"" + message + "\"}");
        }

        Order order = cart.toOrder();

        order.setUserId(userDAO.findByEmail(user.getEmail()));

        // save order in database
        OrderEntity orderEntity = orderDAO.save(order);

        // save order lines in database
        orderLineDAO.save(cart.toOrderLines(), orderEntity);

        // create order object

        order.setOrderLines(cart.toOrderLines());

        // clear cart
        cart.clear();

        // return order id
        return ResponseEntity.ok().body("{\"status\": \"success\", \"orderId\": \"" + orderEntity.getId() + "\"}");
    }

}