package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.Model.User;

public interface UserDataAccess {
    User findByUsername(String username);
}
