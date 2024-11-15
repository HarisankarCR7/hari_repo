package com.org.brimcrmsticketmanagement.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.ComplaintsReg;
import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.model.Users;

public interface MainService {
	public List getRegion();
	public List getCenter(String region);
	public List<CafDetails> getDispatchedCafs(int crrNo);
	
	public String getDispatchedCouriers(String center);
	public List<CafDetails> getCafDetails(String cafNo);
	public List<Map<String, Object>> getVerificationStatus();
	public List<Map<String,Object>> getCourierDetails(String courierId);
	public int courierAcknowledgement(String courierId,String comments);
	public List<Tickets> getPendingTickets(List<String> roles);
	public List<ComplaintsReg> getTicketDetails(int complaintId);
	public void UpdateStatus(Tickets ticket);
	public List<ComplaintsReg> getClosedTickets(); 
	 public List<ComplaintsReg> getTicketsReport(String fromDate, String toDate, String status);
public List<ComplaintsReg> getComplaints(); 
public boolean addUser(Users user);
public String closeTicket(ComplaintsReg complaint, String userName);
}