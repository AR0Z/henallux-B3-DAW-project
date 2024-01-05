package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.Model.UserEdit;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;

public interface UserDataAccess {
    User findByEmail(String username);
    User save(User user);
    User update(UserEdit user, User oldUser);
}
