package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="users")
@Getter
@Setter
@NoArgsConstructor
public class UserEntity {

    @Id
    private Integer id;

    @Column(name="email")
    private String email;

    @Column(name="first_name")
    private String firstName;

    @Column(name="last_name")
    private String lastName;

    @Column(name="phone_number")
    private String phoneNumber;

    @Column(name="delivery_address")
    private String deliveryAddress;

    @Column(name="password")
    private String password;

    @Column(name="authorities")
    private String authorities;

    @Column(name="accountNonExpired")
    private Boolean accountNonExpired;

    @Column(name="accountNonLocked")
    private Boolean accountNonLocked;

    @Column(name="credentialsNonExpired")
    private Boolean credentialsNonExpired;

    @Column(name="enabled")
    private Boolean enabled;
}