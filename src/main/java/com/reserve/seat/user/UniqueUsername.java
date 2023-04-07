package com.reserve.seat.user;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

//제약 조건 어노테이션
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueUsernameValidator.class)
public @interface UniqueUsername {
    String message() default "이미 가입된 이메일입니다. 다른 이메일을 사용하세요.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
