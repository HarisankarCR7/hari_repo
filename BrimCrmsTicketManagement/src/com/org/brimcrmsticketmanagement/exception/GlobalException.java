package com.org.brimcrmsticketmanagement.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.org.brimcrmsticketmanagement.model.ResourceNotFoundException;

@ControllerAdvice
public class GlobalException {
	@ExceptionHandler({ResourceNotFoundException.class,UserCreationException.class})
	public ResponseEntity<ExceptionDto> handleExcpeion(RuntimeException exception) {
		ExceptionDto dto= new ExceptionDto();
				dto.setMessage(exception.getMessage());
		dto.setErrorCode(Integer.valueOf(HttpStatus.INTERNAL_SERVER_ERROR.value()).toString());
	    return new ResponseEntity<ExceptionDto>(dto,HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
