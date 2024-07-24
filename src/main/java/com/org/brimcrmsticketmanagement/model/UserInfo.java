package com.org.brimcrmsticketmanagement.model;

import java.util.List;

public class UserInfo {
	private String dUser;
	
	private String password;
	public UserInfo() {}

	public UserInfo(String dUser, String password) {
		super();
		this.dUser = dUser;
		this.password = password;
	}

	public String getdUser() {
		return dUser;
	}

	public void setdUser(String dUser) {
		this.dUser = dUser;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	

}
