package com.reserve.seat;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.http.HttpStatus;

import com.reserve.seat.CommonExceptionAdvice;


/**
 * Handles requests for the application home page.
 */

@ControllerAdvice
public class CommonExceptionAdvice {
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String except(NoHandlerFoundException e) {
		return "error/404";
//		return "/error/commonError";
	}
	
	@ExceptionHandler(Exception.class)
	public String except(Exception e) {
		return "/error/commonError";
	}
}
