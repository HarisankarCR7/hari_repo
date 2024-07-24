package com.org.brimcrmsticketmanagement.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.org.brimcrmsticketmanagement.model.ResourceNotFoundException;

@ControllerAdvice
public class GlobalException {
	@ExceptionHandler(ResourceNotFoundException.class)
	public String handleResourceNotFound(Exception ex) {
		System.out.println("Getting Error page");
	    return "ResoureNotFound";
	}

}
