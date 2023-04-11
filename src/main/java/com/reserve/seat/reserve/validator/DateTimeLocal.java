package com.reserve.seat.reserve.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DateTimeLocalValidator.class)
public @interface DateTimeLocal {

    String message() default "잘못된 날짜 형식입니다";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
    
    String regexp() default "\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}";
}