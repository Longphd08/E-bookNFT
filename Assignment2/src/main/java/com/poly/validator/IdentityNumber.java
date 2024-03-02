package com.poly.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.poly.validator.impl.IdentityNumberValidator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Documented
@Constraint(validatedBy = IdentityNumberValidator.class)
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.FIELD, ElementType.METHOD })
public @interface IdentityNumber {
	String message() default "{IdentityNumber}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
