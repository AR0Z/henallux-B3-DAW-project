package com.spring.henallux.ecommerce.dataAccess.util;

import com.spring.henallux.ecommerce.Model.*;
import com.spring.henallux.ecommerce.dataAccess.entity.*;
import org.dozer.DozerBeanMapper;
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
        DozerBeanMapper mapper = new DozerBeanMapper();
        return mapper.map(productEntity, Product.class);
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
        DozerBeanMapper mapper = new DozerBeanMapper();
        return mapper.map(order, OrderEntity.class);
    }

    public OrderLineEntity orderLineToOrderLineEntity(OrderLine orderLine) {
        OrderLineEntity orderLineEntity = new OrderLineEntity();
        orderLineEntity.setQuantity(orderLine.getQuantity());
        orderLineEntity.setPrice(orderLine.getPrice());
        return orderLineEntity;
    }

    public Order orderEntityToOrder(OrderEntity orderEntity) {
        DozerBeanMapper mapper = new DozerBeanMapper();
        return mapper.map(orderEntity, Order.class);
    }
}
