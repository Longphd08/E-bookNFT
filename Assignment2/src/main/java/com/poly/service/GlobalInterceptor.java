package com.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.poly.Const;
import com.poly.dao.AccountDAO;
import com.poly.dao.AdminDAO;
import com.poly.dao.AuthorDAO;
import com.poly.dao.BookDAO;
import com.poly.dao.BooksOfAccountDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.OrdersDAO;
import com.poly.dao.PublisherDAO;
import com.poly.entity.Orders;
import com.poly.entity.Publisher;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class GlobalInterceptor implements HandlerInterceptor {

	@Autowired
	AccountDAO accountDAO;
	@Autowired
	BookDAO bookDAO;
	@Autowired
	AdminDAO adminDAO;
	@Autowired
	AuthorDAO authorDAO;
	@Autowired
	BooksOfAccountDAO booksOfAccountDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	PublisherDAO publisherDAO;
	@Autowired
	ShoppingCartService cart;
	@Autowired
	SessionService sessionService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		if (sessionService.getAttribute(Const.ACCOUNTS) == null) {
			sessionService.setAttribute(Const.ACCOUNTS, accountDAO.findAll());
		}
		
		if (sessionService.getAttribute(Const.ADMINS) == null) {
			sessionService.setAttribute(Const.ADMINS, adminDAO.findAll());
		}
		
		if (sessionService.getAttribute(Const.AUTHORS) == null) {
			sessionService.setAttribute(Const.AUTHORS, authorDAO.findAll());
		}
		
		if (sessionService.getAttribute(Const.BOOKS) == null) {
			sessionService.setAttribute(Const.BOOKS, bookDAO.findAll());
		}
		
		if (sessionService.getAttribute(Const.CATEGORIES) == null) {
			sessionService.setAttribute(Const.CATEGORIES, categoryDAO.findAll());
		}
		
		if (sessionService.getAttribute(Const.PUBLISHERS) == null) {
			sessionService.setAttribute(Const.PUBLISHERS, publisherDAO.findAll());
		}
		if (sessionService.getAttribute(Const.CART) == null) {
			sessionService.setAttribute(Const.CART, cart.getCartItems());
		}
	}
}
