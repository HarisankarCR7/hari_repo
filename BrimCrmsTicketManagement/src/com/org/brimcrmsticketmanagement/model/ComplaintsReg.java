package com.org.brimcrmsticketmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;
@Entity
@Table(name = "complaintsReg")
public class ComplaintsReg {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String username;
	private String role;
	private String lob;
	private String bp;
	private String loginTIme;
	private String probTypeName;
	private String subTypeName;
	private String mac;
	private String description;
	private String status;
	@Column(name = "closed_by")
	private String closedBy;
	@Column(name = "closed_on")
	private String closedOn;
	@Column(name = "updated_on")
	private String updatedOn;
	@Column(name = "closed_remarks")
	private String closedRemarks;
	@Column(name = "ticket_no")
	private String ticketNo;
	@Column(name = "tat")
	private String tat;
	@Transient
	private String activity;
	 @Lob
	    @Type(type = "org.hibernate.type.ImageType")
	@Column(name = "image")
	private byte[] image;
	public ComplaintsReg() {}
	public ComplaintsReg(int id, String username, String role, String lob, String bp, String loginTIme,
			String probTypeName, String subTypeName, String mac, String description, String status, String closedBy,
			String closedOn, String updatedOn, String closedRemarks, String ticketNo, String tat, String activity,
			byte[] image) {
		super();
		this.id = id;
		this.username = username;
		this.role = role;
		this.lob = lob;
		this.bp = bp;
		this.loginTIme = loginTIme;
		this.probTypeName = probTypeName;
		this.subTypeName = subTypeName;
		this.mac = mac;
		this.description = description;
		this.status = status;
		this.closedBy = closedBy;
		this.closedOn = closedOn;
		this.updatedOn = updatedOn;
		this.closedRemarks = closedRemarks;
		this.ticketNo = ticketNo;
		this.tat = tat;
		this.activity = activity;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLob() {
		return lob;
	}
	public void setLob(String lob) {
		this.lob = lob;
	}
	public String getBp() {
		return bp;
	}
	public void setBp(String bp) {
		this.bp = bp;
	}
	public String getLoginTIme() {
		return loginTIme;
	}
	public void setLoginTIme(String loginTIme) {
		this.loginTIme = loginTIme;
	}
	public String getProbTypeName() {
		return probTypeName;
	}
	public void setProbTypeName(String probTypeName) {
		this.probTypeName = probTypeName;
	}
	public String getSubTypeName() {
		return subTypeName;
	}
	public void setSubTypeName(String subTypeName) {
		this.subTypeName = subTypeName;
	}
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getClosedBy() {
		return closedBy;
	}
	public void setClosedBy(String closedBy) {
		this.closedBy = closedBy;
	}
	public String getClosedOn() {
		return closedOn;
	}
	public void setClosedOn(String closedOn) {
		this.closedOn = closedOn;
	}
	public String getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(String updatedOn) {
		this.updatedOn = updatedOn;
	}
	public String getClosedRemarks() {
		return closedRemarks;
	}
	public void setClosedRemarks(String closedRemarks) {
		this.closedRemarks = closedRemarks;
	}
	public String getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
		System.out.println("setting ticketno");
		this.ticketNo = "BR" + getId();
	}
	public String getTat() {
		return tat;
	}
	public void setTat(String tat) {
		this.tat = tat;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}

	
		
	

}
