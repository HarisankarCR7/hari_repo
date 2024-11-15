package com.org.brimcrmsticketmanagement.exception;

public class ExceptionDto {
	private String message;
	private String errorCode;
	public ExceptionDto(String message, String errorCode) {
		super();
		this.message = message;
		this.errorCode = errorCode;
	}
	public ExceptionDto() {}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	

}
