package com.webet.config;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.webet.entities.Login;

public class LoginPrincipal implements UserDetails {

    private static final long serialVersionUID = -5270061614463868043L;

    private Login login;

    public LoginPrincipal(Login login) {
	this.login = login;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
	Collection<GrantedAuthority> authorities = new ArrayList<>();
	String role = login.getRole().getName();
	if (role.equals("ROLE_ROOT")) {
	    authorities.add(new SimpleGrantedAuthority("ROLE_GUEST"));
	    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
	    authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
	}
	authorities.add(new SimpleGrantedAuthority(login.getRole().getName())); // !!
	return authorities;
    }

    @Override
    public String getPassword() {
	return login.getMdp();
    }

    @Override
    public String getUsername() {
	return login.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
	return true;
    }

    @Override
    public boolean isAccountNonLocked() {
	return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
	return true;
    }

    @Override
    public boolean isEnabled() {
	return true;
    }
}
