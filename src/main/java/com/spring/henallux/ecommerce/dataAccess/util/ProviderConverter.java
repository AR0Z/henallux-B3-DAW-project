package com.spring.henallux.ecommerce.dataAccess.util;

import com.spring.henallux.ecommerce.Model.*;
import com.spring.henallux.ecommerce.dataAccess.entity.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ProviderConverter {

    public User userEntityToUser(UserEntity userEntity) {
        User user = new User();

        user.setEmail(userEntity.getEmail());
        user.setPassword(userEntity.getPassword());
        user.setFirstName(userEntity.getFirstName());
        user.setLastName(userEntity.getLastName());
        user.setPhoneNumber(userEntity.getPhoneNumber());
        user.setDeliveryAddress(userEntity.getDeliveryAddress());
        user.setAuthorities(userEntity.getAuthorities());
        user.setAccountNonExpired(userEntity.getAccountNonExpired());
        user.setAccountNonLocked(userEntity.getAccountNonLocked());
        user.setCredentialsNonExpired(userEntity.getCredentialsNonExpired());
        user.setEnabled(userEntity.getEnabled());

        return user;
    }

    public UserEntity userToUserEntity(User user) {
        UserEntity userEntity = new UserEntity();


        userEntity.setEmail(user.getEmail());
        userEntity.setPassword(user.getPassword());
        userEntity.setFirstName(user.getFirstName());
        userEntity.setLastName(user.getLastName());
        userEntity.setPhoneNumber(user.getPhoneNumber());
        userEntity.setDeliveryAddress(user.getDeliveryAddress());
        userEntity.setAuthorities(user.getAuthoritiesString());
        userEntity.setAccountNonExpired(user.getAccountNonExpired());
        userEntity.setAccountNonLocked(user.getAccountNonLocked());
        userEntity.setCredentialsNonExpired(user.getCredentialsNonExpired());
        userEntity.setEnabled(user.getEnabled());

        return userEntity;
    }

    public Product productEntityToProduct(ProductEntity productEntity) {
        Product product = new Product();

        product.setId(productEntity.getId());
        product.setLabelEn(productEntity.getLabelEn());
        product.setLabelFr(productEntity.getLabelFr());
        product.setDescriptionEn(productEntity.getDescriptionEn());
        product.setDescriptionFr(productEntity.getDescriptionFr());
        List<Category> categories = productEntity.getCategoryId()
                .stream()
                .map(categoryId -> getCategoryByCategoryEntity(categoryId)) // Replace getCategoryById with your logic
                .toList();
        product.setCategory(categories);
        product.setPromotion(getPromotionByPromotionEntity(productEntity.getPromotionId()));
        product.setDimension(productEntity.getDimension());
        product.setWeight(productEntity.getWeight());
        product.setPrice(productEntity.getPrice());
        product.setStock(productEntity.getStock());
        product.setDateAdded(productEntity.getDateAdded());

        return product;
    }

    private Category getCategoryByCategoryEntity(CategoryEntity categoryEntity) {
        Category category = new Category();
        category.setId(categoryEntity.getId());
        category.setLabelEn(categoryEntity.getLabelEn());
        category.setLabelFr(categoryEntity.getLabelFr());
        return category;
    }

    private Promotion getPromotionByPromotionEntity(PromotionEntity promotionEntity) {
        Promotion promotion = new Promotion();
        promotion.setId(promotionEntity.getId());
        promotion.setLabelEn(promotionEntity.getLabelEn());
        promotion.setLabelFr(promotionEntity.getLabelFr());
        promotion.setBeginDate(promotionEntity.getBeginDate());
        promotion.setEndDate(promotionEntity.getEndDate());
        promotion.setPercentage(promotionEntity.getPercentage());
        promotion.setType(promotionEntity.getType());
        return promotion;
    }

    public OrderEntity orderToOrderEntity(Order order) {
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setDate(order.getDate());
        orderEntity.setOrderStatus(order.getOrderStatus());
        return orderEntity;
    }

}
