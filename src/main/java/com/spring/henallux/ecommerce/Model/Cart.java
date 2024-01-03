package com.spring.henallux.ecommerce.Model;

import java.util.HashMap;

public class Cart {
    private HashMap<Integer, CartLine> cartLines; // Utilisation explicite de HashMap

    public Cart() {
        cartLines = new HashMap<>();
    }

    public HashMap<Integer, CartLine> getCartLines() {
        return cartLines;
    }

    public void editQuantity(int productId, int quantity) {
        CartLine cartLine = cartLines.get(productId);
        if (cartLine != null) {
            cartLine.setQuantity(quantity);
        }
    }

    public void removeProduct(int productId) {
        cartLines.remove(productId);
    }

    public void addCartLine(CartLine cartLine) {
        cartLines.put(cartLine.getProduct().getId(), cartLine);
    }

    public void removeCartLine(CartLine cartLine) {
        cartLines.remove(cartLine.getProduct().getId());
    }

    public void clearCart() {
        cartLines.clear();
    }

    public Float getTotalPrice() {
        float totalPrice = 0;
        for (CartLine cartLine : cartLines.values()) {
            totalPrice += cartLine.getProduct().getPrice() * cartLine.getQuantity();
        }
        double roundedTotalPrice = Math.round(totalPrice * 100.0) / 100.0;

        // Retourner le prix total arrondi en tant que float
        return (float) roundedTotalPrice;
    }

    public Float getTotalPriceWithShippingCost() {
        float totalPrice = getTotalPrice();
        double roundedTotalPrice = Math.round(totalPrice * 100.0) / 100.0;

        // Retourner le prix total arrondi en tant que float avec frais de port
        return (float) roundedTotalPrice + 5;
    }

    public void addProduct(CartLine cartLine) {
        CartLine existingCartLine = cartLines.get(cartLine.getProduct().getId());
        if (existingCartLine != null) {
            existingCartLine.setQuantity(existingCartLine.getQuantity() + cartLine.getQuantity());
        } else {
            cartLines.put(cartLine.getProduct().getId(), cartLine);
        }
    }
}
