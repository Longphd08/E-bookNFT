package com.poly.service;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.Const;
import com.poly.entity.Account;
import com.poly.entity.Admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {

	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		System.out.println(uri);
		String error = "";
		if (session.getAttribute(Const.ACCOUNT) == null) {
			error = "Please login!";
			session.setAttribute(Const.SECURITY_URI, uri);
			response.sendRedirect("/user/login?error=" + error);
			return false;
		} else {
			if (session.getAttribute(Const.ACCOUNT) instanceof Account) {
				Account user = session.getAttribute(Const.ACCOUNT);
				if (user == null) {
					error = "Please login as user!";
					session.setAttribute(Const.SECURITY_URI, uri);
					response.sendRedirect("/user/login?error=" + error);
					return false;
				} else if (uri.startsWith("/admin")) {
					error = "Access denied! Login as admin!";
					session.setAttribute(Const.SECURITY_URI, uri);
					response.sendRedirect("/home?error=" + error);
					return false;
				}
			}

			if (session.getAttribute(Const.ACCOUNT) instanceof Admin) {
				Admin admin = session.getAttribute(Const.ACCOUNT);
				if (admin == null) {
					error = "Please login as admin!";
					session.setAttribute(Const.SECURITY_URI, uri);
					response.sendRedirect("/user/login?error=" + error);
					return false;
				} else if (uri.startsWith("/user") || uri.startsWith("/home") || uri.startsWith("/cart")
						|| uri.startsWith("/product") || uri.startsWith("/category") || uri.startsWith("contact")) {
					error = "Access denied! Loggin as user!";
					session.setAttribute(Const.SECURITY_URI, uri);
					response.sendRedirect("/admin?error=" + error);
					return false;
				}
			}
		}

		return true;
	}

}
