package com.webet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.webet.config.LoginPrincipal;
import com.webet.dao.ILoginJpaRepository;
import com.webet.entities.Login;

@Service
public class LoginService implements UserDetailsService {

    @Autowired
    private ILoginJpaRepository loginRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	Login login = loginRepo.findByEmail(username);
	if (null == login) {
	    throw new UsernameNotFoundException("No user found with username: " + username);
	}
	return new LoginPrincipal(login);
    }
}
