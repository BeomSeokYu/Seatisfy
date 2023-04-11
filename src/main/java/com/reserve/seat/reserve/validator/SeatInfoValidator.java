package com.reserve.seat.reserve.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class SeatInfoValidator implements ConstraintValidator<SeatInfo, String> {
	private String regexp;

    @Override
    public void initialize(SeatInfo constraintAnnotation) {
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
