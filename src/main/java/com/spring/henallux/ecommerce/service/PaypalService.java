package com.spring.henallux.ecommerce.service;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.OrderLine;
import com.spring.henallux.ecommerce.configuration.PayPalConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.util.HashMap;
import java.util.Map;

@Service
public class PaypalService {
    private final PayPalConfig payPalConfig;

    @Autowired
    public PaypalService(PayPalConfig payPalConfig) {
        this.payPalConfig = payPalConfig;
    }

    public ResponseEntity<String> createPayment(Order order) {
        String apiUrl = "/v2/checkout/orders";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(payPalConfig.getAccessToken());

        // Construire le corps de la requête pour créer un paiement avec les articles de la commande
        String requestBody = buildRequestBody(order);

        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

        return payPalConfig.makePayPalApiCall(apiUrl, HttpMethod.POST, null, entity);
    }

    private String buildRequestBody(Order order) {
        // Construire dynamiquement le corps de la requête en fonction des articles de la commande
        // Adapté en fonction de la structure exacte de votre modèle Order

        StringBuilder itemsJson = new StringBuilder();
        for (Map.Entry<Integer, OrderLine> entry : order.getOrderLines().entrySet()) {
            OrderLine orderLine = entry.getValue();
            itemsJson.append("{"
                    + "\"name\": \"" + orderLine.getProduct().getLabelEn() + "\","
                    + "\"description\": \"" + orderLine.getProduct().getDescriptionEn() + "\","
                    + "\"unit_amount\": {"
                    + "\"currency_code\": \"EUR\","
                    + "\"value\": \"" + orderLine.getPrice() + "\""
                    + "},"
                    + "\"quantity\": \"" + orderLine.getQuantity() + "\""
                    + "},");
        }

        // Supprimer la virgule à la fin de la liste des articles
        itemsJson.deleteCharAt(itemsJson.length() - 1);

        return "{"
                + "\"intent\": \"CAPTURE\","
                + "\"purchase_units\": ["
                + "{"
                + "\"amount\": {"
                + "\"currency_code\": \"USD\","
                + "\"value\": \"" + order.getTotalPrice() + "\""
                + "},"
                + "\"items\": [" + itemsJson.toString() + "]"
                + "}"
                + "]"
                + "}";
    }
}
