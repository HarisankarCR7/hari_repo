package com.org.brimcrmsticketmanagement.model;

public class CafDetails {
	private String CAF_ID;
	private String CAF_NO;
	private String subCode;
	private String division;
	private String  name;
	private String  landmark;
	private String pincode;
	private String  phone;
	private String  mobile;
	private String currentContactNo;
	private String email;
	private String region;
	private String area;
	private String activatedOn;
	private String status;
	private String mac;
	private String subStatus;
	private String serviceAmo;
	private String centerId;
	private String cafStatus;
	private String cafDate;
	private String houseNo;
	private String state;
	private String street;
	public String getHouseNo() {
		return houseNo;
	}
	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	private String country;
	public String getCourierID() {
		return courierID;
	}
	public void setCourierID(String courierID) {
		this.courierID = courierID;
	}
	private String addressMerged;
	private String courierID;
	public CafDetails() {}
	
	public CafDetails(String cAF_ID, String cAF_NO, String subCode, String division, String name, String landmark,
			String pincode, String phone, String mobile, String currentContactNo, String email, String region,
			String area, String activatedOn, String status, String mac, String subStatus, String serviceAmo,
			String centerId, String cafStatus, String cafDate, String addressMerged, String courierID) {
		super();
		CAF_ID = cAF_ID;
		CAF_NO = cAF_NO;
		this.subCode = subCode;
		this.division = division;
		this.name = name;
		this.landmark = landmark;
		this.pincode = pincode;
		this.phone = phone;
		this.mobile = mobile;
		this.currentContactNo = currentContactNo;
		this.email = email;
		this.region = region;
		this.area = area;
		this.activatedOn = activatedOn;
		this.status = status;
		this.mac = mac;
		this.subStatus = subStatus;
		this.serviceAmo = serviceAmo;
		this.centerId = centerId;
		this.cafStatus = cafStatus;
		this.cafDate = cafDate;
		this.addressMerged = addressMerged;
		this.courierID = courierID;
	}
	public String getCAF_ID() {
		return CAF_ID;
	}
	public void setCAF_ID(String cAF_ID) {
		CAF_ID = cAF_ID;
	}
	public String getCAF_NO() {
		return CAF_NO;
	}
	public void setCAF_NO(String cAF_NO) {
		CAF_NO = cAF_NO;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCurrentContactNo() {
		return currentContactNo;
	}
	public void setCurrentContactNo(String currentContactNo) {
		this.currentContactNo = currentContactNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getActivatedOn() {
		return activatedOn;
	}
	public void setActivatedOn(String activatedOn) {
		this.activatedOn = activatedOn;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	public String getSubStatus() {
		return subStatus;
	}
	public void setSubStatus(String subStatus) {
		this.subStatus = subStatus;
	}
	public String getServiceAmo() {
		return serviceAmo;
	}
	public void setServiceAmo(String serviceAmo) {
		this.serviceAmo = serviceAmo;
	}
	public String getCenterId() {
		return centerId;
	}
	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}
	public String getCafStatus() {
		return cafStatus;
	}
	public void setCafStatus(String cafStatus) {
		this.cafStatus = cafStatus;
	}
	public String getCafDate() {
		return cafDate;
	}
	public void setCafDate(String cafDate) {
		this.cafDate = cafDate;
	}
	public String getAddressMerged() {
		return addressMerged;
	}
	public void setAddressMerged(String addressMerged) {
		this.addressMerged = addressMerged;
	}
	

}
