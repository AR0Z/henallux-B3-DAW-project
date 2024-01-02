package com.spring.henallux.firstSpringProject.dataAccess.util;

import com.spring.henallux.firstSpringProject.Model.User;
import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;

public class ProviderConverter {

    private Mapper mapper = new DozerBeanMapper();

    public User userEntityToUser(UserEntity userEntity) {
        User user = mapper.map(userEntity, User.class);

        user.setAccountNonExpired(userEntity.getAccountNonExpired());
        user.setAccountNonLocked(userEntity.getAccountNonLocked());
        user.setCredentialsNonExpired(userEntity.getCredentialsNonExpired());
        user.setEnabled(userEntity.getEnabled());
        user.setAuthorities(userEntity.getAuthorities());

        return user;
    }
}
