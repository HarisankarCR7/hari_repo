package com.org.brimcrmsticketmanagement.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.Tickets;

public interface MainDao {

	List getCenter(String region);
	List getRegion();
	public String getDispatchedCouriers(String center);
	List<CafDetails> getDispatchedCafs(int courierId);
public List<CafDetails> getCafDetails(String cafNo);
public List<Map<String, Object>> getCafVerificationStatus();
public List<Map<String,Object>> getCourierDetails(String courierId);
public int courierAcknowledgement(String courierId,String comments);
public List<Tickets>  getPendingTickets(List<String> roles);
public List<Tickets> getTicketDetails(String ticketNo,Long user);
public void updateTicketStatus(Tickets ticket);
public List<Tickets> getClosedTickets();
public List<Tickets> getTicketsReport(Date fromDate, Date toDate, String status);
public List<Tickets> getL2PendingTickets(List<String> roles);
public void forwardTcket(String ticketId, String user, String comments, int forwardedBy);
public List<Tickets> checkForwardedTickets(String uesrID);
public List<Tickets> getReceiveTickets(int userId);
public List<Tickets> getTicketsForwarded(int userId);
}
