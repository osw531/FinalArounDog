package com.aroundog.common.exception;

public class LoginFailException extends RuntimeException{
	public LoginFailException(String msg) {
		super(msg);
	}
}
