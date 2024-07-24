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
import com.org.brimcrmsticketmanagement.model.Tickets;

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
	public List<Tickets> getTicketDetails(String ticketNo, Long currentUser) {
		return mainDao.getTicketDetails(ticketNo,currentUser);
	}

	@Transactional
	@Override
	public void UpdateStatus(Tickets ticket) {
		// TODO Auto-generated method stub
		mainDao.updateTicketStatus(ticket);
	}

	@Transactional
	@Override
	public List<Tickets> getClosedTickets() {
		// TODO Auto-generated method stub
		return mainDao.getClosedTickets();
	}
@Transactional
	@Override
	public List<Tickets> getTicketsReport(Date fromDate, Date toDate, String status) {
		// TODO Auto-generated method stub
		return mainDao.getTicketsReport(fromDate, toDate, status);
	}

@Transactional
@Override
public List<Tickets> getL2PendingTickets(List<String> roles) {
	// TODO Auto-generated method stub
	return mainDao.getL2PendingTickets(roles);
}
@Transactional
@Override
public void forwardTcket(String ticketId, String user, String comments, int forwardedBy) {
 mainDao.forwardTcket(ticketId, user, comments, forwardedBy);
	
}
@Transactional
@Override
public List<Tickets> checkForwardedTickets(String uesrID) {
	return mainDao.checkForwardedTickets(uesrID);
}

@Transactional
@Override
public List<Tickets> getReceiveTickets(int userId) {
	// TODO Auto-generated method stub
	return mainDao.getReceiveTickets(userId);
}

@Override
public List<Tickets> getTicketsForwarded(int userId) {
	// TODO Auto-generated method stub
	return null;
}

}
