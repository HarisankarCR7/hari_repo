package com.org.brimcrmsticketmanagement.model;

import java.lang.annotation.*;


import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = MantisTicketConstaintValidator.class)  
@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE}) 
@Retention(RetentionPolicy.RUNTIME)  
public @interface MantisTicketConstraint {
	 String message() default "Mantis Ticket Number cannot be empty";
	    Class<?>[] groups() default {};
	    Class<? extends Payload>[] payload() default {};
}
