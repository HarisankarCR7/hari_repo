package com.org.brimcrmsticketmanagement.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.ComplaintsReg;
import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.model.Users;

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
public List<ComplaintsReg> getTicketDetails(int complaintId);
public void updateTicketStatus(Tickets ticket);
public List<ComplaintsReg> getClosedTickets();
public List<ComplaintsReg> getTicketsReport(String fromDate, String toDate, String status);
public List<ComplaintsReg> getComplaints(); 
public boolean addUsers(Users user);
public String closeTicket(ComplaintsReg complaint, String username);
}
