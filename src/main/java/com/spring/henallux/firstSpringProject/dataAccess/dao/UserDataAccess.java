package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.Model.User;
import com.spring.henallux.firstSpringProject.Model.UserEdit;

public interface UserDataAccess {
    User findByEmail(String username);
    User save(User user);
    User update(UserEdit user, User oldUser);
}
