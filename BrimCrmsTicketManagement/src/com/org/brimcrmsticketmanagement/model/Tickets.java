package com.org.brimcrmsticketmanagement.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "brim_ticket")
public class Tickets {
	@Id
    @Column(name = "autoId",updatable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
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
 @Column(nullable = false, updatable=false)
 @Temporal(TemporalType.TIMESTAMP)
 private Date loginTime;
 @Column
 private String status;
 @Column(name ="TicketNumber")
 private String ticketNo;
 @Column
 private String crmTicketNo;
 @Column
 private String lob;
 @Column(nullable = false, updatable=true)
 @Temporal(TemporalType.TIMESTAMP)
 private Date resolvedTime;
 @Column
 private String sap_bp_id;
 @Column(name ="Problem_TYPE" )
 private String problemType; 
 @Transient
 private String statusUpdate;
 private String fileName;
 public Tickets() {}
 
 



public Tickets(Integer id, String center, String module, String problemDescription, String userName, String userId,
		Date loginTime, String status, String ticketNo, String crmTicketNo, String lob, Date resolvedTime,
		String sap_bp_id, String problemType, String statusUpdate, String fileName) {
	super();
	this.id = id;
	this.center = center;
	this.module = module;
	this.problemDescription = problemDescription;
	this.userName = userName;
	this.userId = userId;
	this.loginTime = loginTime;
	this.status = status;
	this.ticketNo = "BR" + id;
	this.crmTicketNo = crmTicketNo;
	this.lob = lob;
	this.resolvedTime = resolvedTime;
	this.sap_bp_id = sap_bp_id;
	this.problemType = problemType;
	this.statusUpdate = statusUpdate;
	this.fileName = fileName;
}





public String getFileName() {
	return fileName;
}

public void setFileName(String fileName) {
	this.fileName = fileName;
}

public Integer getId() {
	return id;
}
public void setId(Integer id) {
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
public Date getLoginTime() {
	return loginTime;
}
public void setLoginTime(Date loginTime) {
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
public Date getResolvedTime() {
	return resolvedTime;
}
public void setResolvedTime(Date resolvedTime) {
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
	this.ticketNo = "BR" + getTicketNo();
}











public String getProblemType() {
	return problemType;
}











public void setProblemType(String problemType) {
	this.problemType = problemType;
}











@Override
public String toString() {
	return "Tickets [id=" + id + ", center=" + center + ", module=" + module + ", problemDescription="
			+ problemDescription + ", userName=" + userName + ", userId=" + userId + ", loginTime=" + loginTime
			+ ", status=" + status + ", ticketNo=" + ticketNo + ", crmTicketNo=" + crmTicketNo + ", lob=" + lob
			+ ", resolvedTime=" + resolvedTime + ", sap_bp_id=" + sap_bp_id + ", problemType=" + problemType
			+ ", statusUpdate=" + statusUpdate + "]";
}



}
