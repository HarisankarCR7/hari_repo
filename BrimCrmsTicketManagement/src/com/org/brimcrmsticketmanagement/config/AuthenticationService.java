package com.org.brimcrmsticketmanagement.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.org.brimcrmsticketmanagement.dao.UserInfoDao;
import com.org.brimcrmsticketmanagement.model.Roles;
import com.org.brimcrmsticketmanagement.model.UserInfo;
import com.org.brimcrmsticketmanagement.model.Users;
import com.org.brimcrmsticketmanagement.service.UserServiceImpl;
@Service
public class AuthenticationService implements UserDetailsService {
	 @Autowired
	 private UserServiceImpl userServiceImpl;
	   // private UserInfoDao userInfoDAO;
	 @Autowired
	 HttpServletRequest request;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 Users userInfo = userServiceImpl.getUser(username);
		 request.getSession().setAttribute("name", userInfo.getName());

	        if (userInfo == null) {
	            throw new UsernameNotFoundException("User " + username + " was not found in the database");
	        }
	        List<GrantedAuthority> grantList= new ArrayList<GrantedAuthority>();
	                UserDetails userDetails = (UserDetails) new User(userInfo.getUsername(), //
	                userInfo.getPassword(), grantList);
	      //  HttpSession sessio

	        return userDetails;
	}

}
