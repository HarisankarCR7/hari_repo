package com.org.brimcrmsticketmanagement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.org.brimcrmsticketmanagement.model.UserInfo;

@Repository
public class UserDAO {
	/*
	 * private JdbcTemplate jdbcTemplate;
	 * 
	 * @Autowired public void setDataSource(DataSource dataSource) {
	 * this.jdbcTemplate = new JdbcTemplate(dataSource); } public UserInfo
	 * getUserInfo(String username){ String sql =
	 * "SELECT d.DUser, d.Pwd, concat('ROLE_',m.hierarchy) hierarchy  FROM "+
	 * "dbo.dusermaster d INNER JOIN dbo.usermoduleaccess m on a.duser=m.duser WHERE "
	 * + "d.status='Active' and d.duser = ?"; UserInfo userInfo =
	 * (UserInfo)jdbcTemplate.queryForObject(sql, new Object[]{username}, new
	 * RowMapper<UserInfo>() { public UserInfo mapRow(ResultSet rs, int rowNum)
	 * throws SQLException { UserInfo user = new UserInfo();
	 * user.setdUser(rs.getString("DUser")); user.setPassword(rs.getString("Pwd"));
	 * user.setUserRoles(rs.getString("hierarchy")); return user; } }); return
	 * userInfo; }
	 */
}
