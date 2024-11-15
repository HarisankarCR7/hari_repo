package com.org.brimcrmsticketmanagement.service;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;

import com.org.brimcrmsticketmanagement.dao.MainDaoImpl;
import com.org.brimcrmsticketmanagement.dao.UserInfoDaoImpl;
import com.org.brimcrmsticketmanagement.model.Users;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserInfoDaoImpl userInfoDao;
@Transactional
	@Override
	public Users getUser(String username) {
		//System.out.println("into service" + username);
		return userInfoDao.getUser(username);
	}
	


}
