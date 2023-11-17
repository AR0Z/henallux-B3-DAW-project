package com.spring.henallux.firstSpringProject.Model;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public interface UserDetails {
    //  getAuthorities, getPassword, getUsername,
    //isAccountNonExpired, isAccountNonLocked, isCredentialsNonExpired et
    //isEnabled

    public Collection<GrantedAuthority> getAuthorities();

    public String getPassword();

    public String getUsername();

    public boolean isAccountNonExpired();

    public boolean isAccountNonLocked();

    public boolean isCredentialsNonExpired();

    public boolean isEnabled();
}
