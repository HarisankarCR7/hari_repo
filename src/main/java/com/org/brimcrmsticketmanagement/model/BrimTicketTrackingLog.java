package com.org.brimcrmsticketmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "dbo.Brim_Ticket_Tracking_Log")
public class BrimTicketTrackingLog {
	@Id
	@Column(name = "id", updatable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@Column(name="ticket_id")
	private int ticketId;
	@Column(name ="user_id")
	private int userId;
	@Column(name="forwarded_time")
	private String forwardedTime;
	@Column(name="comments")
	private String comments;
	
public BrimTicketTrackingLog() {}

public BrimTicketTrackingLog(Integer id, int ticketId, int userId, String forwardedTime, String comments) {
	super();
	this.id = id;
	this.ticketId = ticketId;
	this.userId = userId;
	this.forwardedTime = forwardedTime;
	this.comments = comments;
}

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public int getTicketId() {
	return ticketId;
}

public void setTicketId(int ticketId) {
	this.ticketId = ticketId;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public String getForwardedTime() {
	return forwardedTime;
}

public void setForwardedTime(String forwardedTime) {
	this.forwardedTime = forwardedTime;
}

public String getComments() {
	return comments;
}

public void setComments(String comments) {
	this.comments = comments;
}

}
