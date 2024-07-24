package com.org.brimcrmsticketmanagement.model;

import java.util.Optional;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class MantisTicketConstaintValidator implements ConstraintValidator<MantisTicketConstraint, Tickets>{
   String message;
	public void initialize(MantisTicketConstraint constraintAnnotation) {
  this.message=constraintAnnotation.message();
    } 

	@Override
	public boolean isValid(Tickets value, ConstraintValidatorContext context) {
		
		if(Optional.ofNullable(value.getStatusUpdate()).orElse("").equals("L2-Pending")) {
			System.out.println("constraint mantisticketno" + "" + value.getMantisTicketNo());
			if(value.getMantisTicketNo().equals("") || value.getMantisTicketNo() == null) {
				System.out.println("codition mantis ticket no is empty");
				return false;
			}
			else {
				System.out.println("codition mantis ticket no is not empty");
				return true;
			}
		}
		else {
			System.out.println("status other than l2 pending");
			return true;
		}
		
	}

}
