package com.reserve.seat.reserve.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = SeatInfoValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface SeatInfo {

    String message() default "잘못된 형식의 데이터입니다";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    String regexp() default "^(0|1)(,[01])*(\\s(0|1)(,[01])*)*$";
}
