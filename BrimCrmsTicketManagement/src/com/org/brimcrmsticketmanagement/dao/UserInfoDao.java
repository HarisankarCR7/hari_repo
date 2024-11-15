package com.org.brimcrmsticketmanagement.dao;

import com.org.brimcrmsticketmanagement.model.UserInfo;
import com.org.brimcrmsticketmanagement.model.Users;

public interface UserInfoDao {
	 public UserInfo findUserInfo(String userName);
	 public Users getUser(String username);
}
