package com.org.brimcrmsticketmanagement.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.model.Users;


public interface BrimTicketDao {

//	 public List<Tickets> getAllTickets();
//	 public List<Tickets> searchTickets(String searchQuery);
	 public List<Tickets> getTickets(Date fromDate, Date toDate, String status, String center);
	 public List<String> getDistinctCenters();
}