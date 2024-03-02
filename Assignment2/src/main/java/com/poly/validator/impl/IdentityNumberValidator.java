package com.poly.validator.impl;


import com.poly.validator.IdentityNumber;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class IdentityNumberValidator  implements ConstraintValidator<IdentityNumber, String>{
	@Override
	public void initialize(IdentityNumber paramA) {
	}

	public boolean isValid(String identityNum, ConstraintValidatorContext ctx) {
		if (identityNum == null) {
			return false;
		}
		return identityNum.matches("^0{0,2}[0-9]{10}$");
	}
}
