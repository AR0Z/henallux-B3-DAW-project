package com.spring.henallux.ecommerce.dataAccess.dao;

import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.Model.UserEdit;
import com.spring.henallux.ecommerce.dataAccess.entity.UserEntity;
import com.spring.henallux.ecommerce.dataAccess.repository.UserRepository;
import com.spring.henallux.ecommerce.dataAccess.util.ProviderConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDAO implements UserDataAccess {

    private UserRepository userRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public UserDAO(UserRepository userRepository, ProviderConverter providerConverter) {
        this.userRepository = userRepository;
        this.providerConverter = providerConverter;
    }

    public User findByEmail(String email) {
        UserEntity userEntity = userRepository.findByEmail(email);

        if (userEntity == null) {
            return null;
        }

        return providerConverter.userEntityToUser(userEntity);
    }

    public User save(User user) {
        UserEntity userEntity = providerConverter.userToUserEntity(user);

        userEntity = userRepository.save(userEntity);

        return providerConverter.userEntityToUser(userEntity);
    }

    public User update(UserEdit user, User oldUser) {
        if (user.getEmail() != null) {
            oldUser.setEmail(oldUser.getEmail());
        }

        if (user.getFirstName() != null) {
            oldUser.setFirstName(user.getFirstName());
        }

        if (user.getLastName() != null) {
            oldUser.setLastName(user.getLastName());
        }

        if (user.getDeliveryAddress() != null) {
            oldUser.setDeliveryAddress(user.getDeliveryAddress());
        }

        if (user.getPhoneNumber() != null) {
            oldUser.setPhoneNumber(user.getPhoneNumber());
        }

        UserEntity userEntity = providerConverter.userToUserEntity(oldUser);

        userEntity = userRepository.save(userEntity);

        return providerConverter.userEntityToUser(userEntity);
    }

}
