package com.reserve.seat.reserve.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class DateTimeLocalValidator implements ConstraintValidator<DateTimeLocal, String> {
	private String regexp;

    @Override
    public void initialize(DateTimeLocal constraintAnnotation) {
    	this.regexp = constraintAnnotation.regexp();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return true;
        }
        return value.matches(regexp);
    }
}