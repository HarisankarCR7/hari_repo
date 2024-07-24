package com.org.brimcrmsticketmanagement.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Subselect;

import com.fasterxml.jackson.annotation.JsonIgnore;

@MantisTicketConstraint
@Entity
@Table(name = "dbo.brim_ticket")
public class Tickets {
	@Id
	@Column(name = "autoId", updatable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String center;
	@Column
	private String module;
	@Column
	private String problemDescription;
	@Column
	private String userName;
	@Column
	private String userId;
	@Column(nullable = false, updatable = false)
	/* @Temporal(TemporalType.TIMESTAMP) */
	private String loginTime;
	@Column
	private String status;
	@Column(name = "TicketNumber")
	private String ticketNo;
	@Column
	private String crmTicketNo;
	@Column
	private String lob;
	@Column(nullable = false, updatable = true)
	/* @Temporal(TemporalType.TIMESTAMP) */
	private String resolvedTime;
	@Column
	private String sap_bp_id;
	@Column(name = "Problem_TYPE")
	private String problemType;
	@Transient
	private String statusUpdate;
	private String fileName;
	private String resolvedBy;
	private String resolvedRemarks;
	private String mantisTicketNo;
	/*
	 * @ManyToOne(cascade = CascadeType.ALL)
	 * 
	 * @JsonIgnore
	 * 
	 * @JoinColumn(name = "assignTo") private Users user;
	 */

	private String forwardComments;
	@Column(name = "forward_to_user")
	private Integer forwardedUserId;

	/*
	 * @JsonIgnore
	 * 
	 * @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	 * 
	 * @JoinTable(name = "Brim_Ticket_Tracking_Forward_Ticket", joinColumns = {
	 * 
	 * @JoinColumn(name = "ticket_id") }, inverseJoinColumns = { @JoinColumn(name =
	 * "user_id") }) private Set<Users> forwarededUsers = new HashSet<>();
	 */
	@JsonIgnore
	@OneToMany(mappedBy = "primaryKey.tickets", 
			cascade = CascadeType.ALL)
	private Set<BrimTicketForwarding> forwardTicket = new HashSet<BrimTicketForwarding>();
	
	@Transient
	private String forwardedBy;
	
	@Transient
	private String forwardedComments;
	
	@Transient
	private String forwardedTime;
	
	public Tickets() {
	}

	
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCenter() {
		return center;
	}

	public void setCenter(String center) {
		this.center = center;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getProblemDescription() {
		return problemDescription;
	}

	public void setProblemDescription(String problemDescription) {
		this.problemDescription = problemDescription;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCrmTicketNo() {
		return crmTicketNo;
	}

	public void setCrmTicketNo(String crmTicketNo) {
		this.crmTicketNo = crmTicketNo;
	}

	public String getLob() {
		return lob;
	}

	public void setLob(String lob) {
		this.lob = lob;
	}

	public String getResolvedTime() {
		return resolvedTime;
	}

	public void setResolvedTime(String resolvedTime) {
		this.resolvedTime = resolvedTime;
	}

	public String getSap_bp_id() {
		return sap_bp_id;
	}

	public void setSap_bp_id(String sap_bp_id) {
		this.sap_bp_id = sap_bp_id;
	}

	public String getStatusUpdate() {
		return statusUpdate;
	}

	public void setStatusUpdate(String statusUpdate) {
		this.statusUpdate = statusUpdate;
	}

	public String getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}

	public String getProblemType() {
		return problemType;
	}

	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}

	public String getResolvedBy() {
		return resolvedBy;
	}

	public void setResolvedBy(String resolvedBy) {
		this.resolvedBy = resolvedBy;
	}

	public String getResolvedRemarks() {
		return resolvedRemarks;
	}

	public void setResolvedRemarks(String resolvedRemarks) {
		this.resolvedRemarks = resolvedRemarks;
	}

	public String getMantisTicketNo() {
		return mantisTicketNo;
	}

	public void setMantisTicketNo(String mantisTicketNo) {
		this.mantisTicketNo = mantisTicketNo;
	}

	/*
	 * public Users getUser() { return user; }
	 * 
	 * 
	 * public void setUser(Users user) { this.user = user; }
	 */

	public String getForwardComments() {
		return forwardComments;
	}

	public void setForwardComments(String forwardComments) {
		this.forwardComments = forwardComments;
	}




	
	

	public Integer getForwardedUserId() {
		return forwardedUserId;
	}


	public void setForwardedUserId(Integer forwardedUserId) {
		this.forwardedUserId = forwardedUserId;
	}
	
	
	

	
	
public Set<BrimTicketForwarding> getForwardTicket() {
		return forwardTicket;
	}



	public void setForwardTicket(Set<BrimTicketForwarding> forwardTicket) {
		this.forwardTicket = forwardTicket;
	}

	public void addForwardTicket(BrimTicketForwarding forwardTicket) {
		this.forwardTicket.add(forwardTicket);
	}
	
	

	public String getForwardedBy() {
		return forwardedBy;
	}



	public void setForwardedBy(String forwardedBy) {
		this.forwardedBy = forwardedBy;
	}



	public String getForwardedComments() {
		return forwardedComments;
	}



	public void setForwardedComments(String forwardedComments) {
		this.forwardedComments = forwardedComments;
	}



	public String getForwardedTime() {
		return forwardedTime;
	}



	public void setForwardedTime(String forwardedTime) {
		this.forwardedTime = forwardedTime;
	}



	//Neeha Code
	public boolean matches(String searchQuery) {

		if (ticketNo != null && ticketNo.contains(searchQuery)) {
			return true;
		}
		if (crmTicketNo != null && crmTicketNo.contains(searchQuery)) {
			return true;
		}

		return false;
	}

//Neeha code end

}
