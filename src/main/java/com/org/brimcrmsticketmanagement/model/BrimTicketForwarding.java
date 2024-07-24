package com.org.brimcrmsticketmanagement.model;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name = "dbo.Brim_Ticket_Forwarding")
@AssociationOverrides({
	@AssociationOverride(name = "primaryKey.tickets", 
		joinColumns = @JoinColumn(name = "ticket_id")),
	@AssociationOverride(name = "primaryKey.users", 
		joinColumns = @JoinColumn(name = "user_id")) })
public class BrimTicketForwarding {
	// composite-id key
		private BrimTicketForwardingId primaryKey = new BrimTicketForwardingId();
	@Column(name = "forward_by")
	private int forwardBy;
	private String comments;
	public BrimTicketForwarding() {}
	
	
	@EmbeddedId
	public BrimTicketForwardingId getPrimaryKey() {
		return primaryKey;
	}



	public void setPrimaryKey(BrimTicketForwardingId primaryKey) {
		this.primaryKey = primaryKey;
	}


@Transient
	public Tickets getTickets() {
		return getPrimaryKey().getTickets();
	}
	public void setTickets(Tickets tickets) {
		getPrimaryKey().setTickets(tickets);
	}
	@Transient
	public Users getUsers() {
		return getPrimaryKey().getUsers();
	}
	public void setUsers(Users users) {
		getPrimaryKey().setUsers(users);
	}
	public int getForwardBy() {
		return forwardBy;
	}
	public void setForwardBy(int forwardBy) {
		this.forwardBy = forwardBy;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	

}
