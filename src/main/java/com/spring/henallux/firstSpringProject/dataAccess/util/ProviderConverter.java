package com.spring.henallux.firstSpringProject.dataAccess.util;

import com.spring.henallux.firstSpringProject.Model.User;
import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.stereotype.Component;

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
}
