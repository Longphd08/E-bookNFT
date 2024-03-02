/**
 * 
 */
package com.poly.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 
 */
@Service
public class CookieService {
	@Autowired HttpServletRequest request;
	@Autowired HttpServletResponse response;
	
	public void createCookie(String name, String value, int days) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(days * 60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	public Cookie getCookie(String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie;
				}
			}
		}
		return null;
	}
	
	public String getValue(String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	
	public void removeCookie(String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					break;
				}
			}
		}
	}
}
