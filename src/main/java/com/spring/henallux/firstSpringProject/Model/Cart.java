package com.spring.henallux.firstSpringProject.Model;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;

public class Cart {
    private ArrayList<CartLine> cartLines;

    public Cart() {
        cartLines = new ArrayList<>();
    }

    public ArrayList<CartLine> getCartLines() {
        return cartLines;
    }

    public void editQuantity(int productId, int quantity) {
        for (CartLine cartLine : cartLines) {
            if (cartLine.getProduct().getId() == productId) {
                cartLine.setQuantity(quantity);
            }
        }
    }

    public void removeProduct(int productId) {
        Iterator<CartLine> iterator = cartLines.iterator();
        while (iterator.hasNext()) {
            CartLine cartLine = iterator.next();
            if (cartLine.getProduct().getId() == productId) {
                iterator.remove();
            }
        }
    }

    public void addCartLine(CartLine cartLine) {
        cartLines.add(cartLine);
    }

    public void removeCartLine(CartLine cartLine) {
        cartLines.remove(cartLine);
    }

    public void clearCart() {
        cartLines.clear();
    }

    public Float getTotalPrice() {
        float totalPrice = 0;
        for (CartLine cartLine : cartLines) {
            totalPrice += cartLine.getProduct().getPrice() * cartLine.getQuantity();
        }
        double roundedTotalPrice = Math.round(totalPrice * 100.0) / 100.0;

        // Retourner le prix total arrondi en tant que float
        return (float) roundedTotalPrice;
    }

    public Float getTotalPriceWithShippingCost() {
        float totalPrice = 0;
        for (CartLine cartLine : cartLines) {
            totalPrice += cartLine.getProduct().getPrice() * cartLine.getQuantity();
        }
        double roundedTotalPrice = Math.round(totalPrice * 100.0) / 100.0;

        // Retourner le prix total arrondi en tant que float
        return (float) roundedTotalPrice + 5;
    }

    public void addProduct(CartLine cartLine) {
        Boolean productFound = false;
        for (CartLine cartLine1 : cartLines) {
            if (cartLine1.getProduct().getId().equals(cartLine.getProduct().getId())) {
                cartLine1.setQuantity(cartLine1.getQuantity() + cartLine.getQuantity());
                productFound = true;
            }
        }

        if (!productFound) {
            cartLines.add(cartLine);
        }
    }
}
