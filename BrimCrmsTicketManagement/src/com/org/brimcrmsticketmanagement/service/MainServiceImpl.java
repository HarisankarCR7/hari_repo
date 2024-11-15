package com.org.brimcrmsticketmanagement.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.org.brimcrmsticketmanagement.dao.MainDao;
import com.org.brimcrmsticketmanagement.dao.MainDaoImpl;
import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.ComplaintsReg;
import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.model.Users;

@Service
//@Transactional
public class MainServiceImpl implements MainService {
	@Autowired
	MainDaoImpl mainDao;

	@Override
	public List getRegion() {
		// TODO Auto-generated method stub
		return mainDao.getRegion();
	}

	@Override
	public List getCenter(String region) {
		// TODO Auto-generated method stub
		return mainDao.getCenter(region);
	}

	@Override
	public String getDispatchedCouriers(String center) {
		// TODO Auto-generated method stub
		return mainDao.getDispatchedCouriers(center);
	}

	@Override
	public List<CafDetails> getDispatchedCafs(int crrNo) {
		// TODO Auto-generated method stub
		return mainDao.getDispatchedCafs(crrNo);
	}

	@Override
	public List<CafDetails> getCafDetails(String cafNo) {
		// TODO Auto-generated method stub
		return mainDao.getCafDetails(cafNo);
	}

	@Override
	public List<Map<String, Object>> getVerificationStatus() {
		// TODO Auto-generated method stub
		return mainDao.getCafVerificationStatus();
	}

	@Override
	public List<Map<String, Object>> getCourierDetails(String courierId) {
		// TODO Auto-generated method stub
		return mainDao.getCourierDetails(courierId);
	}

	@Override
	public int courierAcknowledgement(String courierId, String comments) {
		return mainDao.courierAcknowledgement(courierId, comments);

	}

	@Transactional
	@Override
	public List<Tickets> getPendingTickets(List<String> roles) {
		// TODO Auto-generated method stub
		return mainDao.getPendingTickets(roles);
	}

	@Transactional
	@Override
	public List<ComplaintsReg> getTicketDetails(int complaintId) {
		return mainDao.getTicketDetails(complaintId);
	}

	@Transactional
	@Override
	public void UpdateStatus(Tickets ticket) {
		// TODO Auto-generated method stub
		mainDao.updateTicketStatus(ticket);
	}

	@Transactional
	@Override
	public List<ComplaintsReg> getClosedTickets() {
		// TODO Auto-generated method stub
		return mainDao.getClosedTickets();
	}
@Transactional
	@Override
	public List<ComplaintsReg> getTicketsReport(String fromDate, String toDate, String status) {
		// TODO Auto-generated method stub
		return mainDao.getTicketsReport(fromDate, toDate, status);
	}
@Transactional
@Override
public List<ComplaintsReg> getComplaints() {
	// TODO Auto-generated method stub
	return mainDao.getComplaints();
}
@Transactional
@Override
public boolean addUser(Users user) {
	// TODO Auto-generated method stub
	return mainDao.addUsers(user);
}
@Transactional
@Override
public String closeTicket(ComplaintsReg complaint, String userName) {
	// TODO Auto-generated method stub
	return mainDao.closeTicket(complaint, userName);
}
@Transactional
public byte[] viewImage(String id) {
	return mainDao.viewImage(id);
	
}

}
