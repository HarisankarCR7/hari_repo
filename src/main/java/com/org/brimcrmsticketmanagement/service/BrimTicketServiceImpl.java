package com.org.brimcrmsticketmanagement.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.org.brimcrmsticketmanagement.dao.BrimTicketDaoImpl;
import com.org.brimcrmsticketmanagement.model.Tickets;
@Service
public class BrimTicketServiceImpl  implements BrimTicketService{
	  @Autowired
	   
	    private BrimTicketDaoImpl brimTicketDao;
	@Override
	@Transactional
	public List<Tickets>  getTickets(Date fromDate, Date toDate, String status, String center) {
		  return brimTicketDao.getTickets(fromDate, toDate, status, center);
	}
	@Override
	@Transactional
	public List<String> getDistinctCenters() {
		return brimTicketDao.getDistinctCenters();
	}

}
