package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.Model.User;

public interface UserDataAccess {
    User findByEmail(String username);
    User save(User user);
}
