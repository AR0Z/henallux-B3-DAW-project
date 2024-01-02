package com.spring.henallux.firstSpringProject.service;

import com.spring.henallux.firstSpringProject.Model.User;
import com.spring.henallux.firstSpringProject.dataAccess.dao.UserDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsServiceImplementation implements UserDetailsService {

    private UserDataAccess userDAO;

    @Autowired
    public UserDetailsServiceImplementation(UserDataAccess userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByUsername(username);

        if (user !=null) {
            return user;
        }

        throw new UsernameNotFoundException("User not found");
    }
}
