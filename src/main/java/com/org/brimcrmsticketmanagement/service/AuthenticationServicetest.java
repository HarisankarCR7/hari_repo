package com.org.brimcrmsticketmanagement.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.org.brimcrmsticketmanagement.dao.UserDAO;
import com.org.brimcrmsticketmanagement.model.UserInfo;
@Service
public class AuthenticationServicetest  {
	@Autowired
	private UserDAO userDAO;
	
}
