package com.org.brimcrmsticketmanagement.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;
@Embeddable
public class BrimTicketForwardingId implements Serializable{
	private Tickets tickets;
	private Users users;
	@ManyToOne(cascade = CascadeType.ALL)
	public Tickets getTickets() {
		return tickets;
	}
	public void setTickets(Tickets tickets) {
		this.tickets = tickets;
	}
	@ManyToOne(cascade = CascadeType.ALL)
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	

}
