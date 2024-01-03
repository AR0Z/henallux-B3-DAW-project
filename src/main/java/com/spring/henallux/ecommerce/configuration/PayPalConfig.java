package com.spring.henallux.ecommerce.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;

@Configuration
public class PayPalConfig {
    @Value("${paypal.clientId}")
    private String clientId;

    @Value("${paypal.secret}")
    private String secret;

    @Value("${paypal.baseUrl}")
    private String baseUrl;

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    public ResponseEntity<String> makePayPalApiCall(String endpoint, HttpMethod method, HttpHeaders headers, HttpEntity<?> entity) {
        String apiUrl = baseUrl + endpoint;

        if (headers == null) {
            headers = new HttpHeaders();
        }

        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBasicAuth(clientId, secret);

        return restTemplate().exchange(apiUrl, method, entity, String.class);
    }

    public String getAccessToken() {
        String apiUrl = "/v1/oauth2/token";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", "client_credentials");

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

        // Utiliser cette ligne pour passer les paramètres corrects à makePayPalApiCall
        ResponseEntity<String> response = makePayPalApiCall(apiUrl, HttpMethod.POST, null, entity);


        // Analyser la réponse pour extraire le jeton d'accès
        if (response.getStatusCode().is2xxSuccessful()) {
            // Exemple simplifié - Vous devrez peut-être utiliser une bibliothèque JSON pour analyser la réponse de manière plus robuste
            return response.getBody().split("\"access_token\":\"")[1].split("\"")[0];
        } else {
            // Gestion des erreurs, si nécessaire
            System.out.println("Erreur lors de la récupération du jeton d'accès PayPal. Code de statut : " + response.getStatusCode());
            return null;
        }
    }



}
