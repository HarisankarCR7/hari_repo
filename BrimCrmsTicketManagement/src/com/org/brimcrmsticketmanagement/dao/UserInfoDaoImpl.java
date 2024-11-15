package com.org.brimcrmsticketmanagement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.org.brimcrmsticketmanagement.model.UserInfo;
import com.org.brimcrmsticketmanagement.model.Users;


@Repository
public class UserInfoDaoImpl implements UserInfoDao {

	/*
	 * @Autowired
	 * 
	 * @Qualifier("loginJdbcTemplate") private JdbcTemplate jdbcTemplate;
	 */

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public UserInfo findUserInfo(String userName) {

		/*
		 * System.out.println("into finduserinfo"); String sql =
		 * "SELECT d.DUser, CONVERT(NVARCHAR(250),DecryptByPassphrase ('key',pwd)) as Pwd  FROM "
		 * + "dbo.dusermaster d WHERE "+ "d.status='Active' and d.duser = ?"; try {
		 * UserInfo userInfo = (UserInfo)jdbcTemplate.queryForObject(sql, new
		 * Object[]{userName}, new RowMapper<UserInfo>() { public UserInfo
		 * mapRow(ResultSet rs, int rowNum) throws SQLException { UserInfo user = new
		 * UserInfo(); user.setdUser(rs.getString("DUser"));
		 * user.setPassword(rs.getString("Pwd")); return user; } }); return userInfo; }
		 * catch (Exception e) { System.out.println("Error in getting user info" +
		 * e.getMessage()); return null; }
		 */
		return null;
	}

	@Override
	public Users getUser(String username) {
		//System.out.println("into dao" + username);
		Users user = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			String getUserQuery = "from Users where username = :username";
			Query query = session.createQuery(getUserQuery);
			query.setParameter("username", username);
			List<?> list = query.list();
			if (list.size() > 0) {
				user = (Users) list.get(0);
			}
			return user;
		}

		catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
