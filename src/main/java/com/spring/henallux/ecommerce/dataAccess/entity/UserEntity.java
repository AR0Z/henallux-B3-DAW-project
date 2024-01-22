package com.spring.henallux.ecommerce.dataAccess.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;

@Entity
@Table(name="users")
@Getter
@Setter
@NoArgsConstructor
public class UserEntity {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="user_id")
    private int id;

    @Column(name="email", unique=true)
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

    @Column(name="account_non_expired")
    private Boolean accountNonExpired;

    @Column(name="account_non_locked")
    private Boolean accountNonLocked;

    @Column(name="credentials_non_expired")
    private Boolean credentialsNonExpired;

    @Column(name="enabled")
    private Boolean enabled;

}