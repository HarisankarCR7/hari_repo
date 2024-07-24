package com.org.brimcrmsticketmanagement.service;

import java.sql.Date;
import java.util.List;

import com.org.brimcrmsticketmanagement.model.Tickets;

public interface BrimTicketService {
	 public List<Tickets> getTickets(Date fromDate, Date toDate, String status, String center);
	 public List<String> getDistinctCenters(); 
}
