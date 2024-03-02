package com.poly.validator.impl;

import com.poly.validator.Phone;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone, String> {
	@Override
	public void initialize(Phone paramA) {
	}

	public boolean isValid(String phoneNo, ConstraintValidatorContext ctx) {
		if (phoneNo == null) {
			return false;
		}
		return phoneNo.matches("(0[3|5|7|8|9])+([0-9]{8})\\b");
	}
}
