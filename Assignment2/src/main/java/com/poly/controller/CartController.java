/**
 * 
 */
package com.poly.controller;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.Const;
import com.poly.dao.BookDAO;
import com.poly.dao.BooksOfAccountDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.OrdersDAO;
import com.poly.entity.Book;
import com.poly.entity.BooksOfAccount;
import com.poly.entity.CartItem;
import com.poly.entity.OrderDetail;
import com.poly.entity.Orders;
import com.poly.service.MailService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.service.ShoppingCartService;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

/**
 * 
 */
@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	ShoppingCartService cart;

	@Autowired
	ParamService param;

	@Autowired
	SessionService session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	BookDAO bookDAO;
	
	@Autowired
	OrdersDAO ordersDAO;
	
	@Autowired
	BooksOfAccountDAO booksOfAccountDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	MailService mailService;

	@GetMapping("")
	public String getCart(Model model) {
		model.addAttribute("amount", cart.getAmount());
		model.addAttribute("quantity", cart.getCount());
		return "cart";
	}

	@GetMapping("/add")
	public String addToCart(@RequestParam("id") Integer id, @RequestParam("path") String path, Model model) {
		Book book = bookDAO.findById(id).get();
		CartItem item = new CartItem();
		item.setId(book.getId());
		item.setPicturePath(book.getPicturePath());
		item.setPrice(book.getPrice());
		item.setQty(1);
		item.setTitle(book.getTitle());
		cart.addBook(item);
		session.setAttribute(Const.CART, cart.getCartItems());
		String uri = "";
		if (path.contains("/category")) {
			uri = path;
		} else if (path.equals("product")) {
			uri = "/product?id=" + id;
		}
		return "redirect:" + uri;
	}

	@PostMapping("/update")
	public String updateCart(@RequestParam("id") Integer id, @RequestParam("qty") Integer qty, Model model) {
		cart.updateBook(id, qty);
		return "redirect:/cart";
	}

	@GetMapping("/delete")
	public String removeFromCart(@RequestParam("id") Integer id, Model model) {
		cart.removeBook(id);
		return "redirect:/cart";
	}

	@GetMapping("/clear")
	public String clearCart(Model model) {
		cart.clear();
		return "redirect:/cart";
	}

	@GetMapping("/checkout")
	public String getCheckOut(Model model) {
		model.addAttribute("amount", cart.getAmount());
		model.addAttribute("quantity", cart.getCount());
		return "checkout";
	}
	
	@PostMapping("/checkout")
	public String postCheckout(Model model, @RequestParam("fullname") String fullname, @RequestParam("phone") String phone, @RequestParam("email") String email, @RequestParam("checked") Optional<Boolean> confirm) throws MessagingException {
		if (cart.getAmount() == 0) {
			return "redirect:/category";
		}
		if (!fullname.isBlank()) {
			if (phone.matches("(0[3|5|7|8|9])+(\\d{8})\\b")) {
				if (email.matches("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$")) {
					if (confirm.orElse(false)) {
						Orders order = new Orders();
						order.setAccount(session.getAttribute(Const.ACCOUNT));
						order.setPhone(phone);
						ordersDAO.save(order);
						order = ordersDAO.save(order);
						for (CartItem item : cart.getCartItems().values()) {
							OrderDetail orderDetail = new OrderDetail();
							orderDetail.setOrder(order);
							orderDetail.setBook(bookDAO.findById(item.getId()).get());
							orderDetail.setQty(item.getQty());
							orderDetail.setPrice(item.getPrice());
							orderDetailDAO.save(orderDetail);
							List<BooksOfAccount> booksOfAccounts = booksOfAccountDAO.findByBookAndAccount(bookDAO.findById(item.getId()).get(), session.getAttribute(Const.ACCOUNT));
							if (booksOfAccounts.isEmpty()) {
								BooksOfAccount booksOfAccount = new BooksOfAccount();
								booksOfAccount.setBook(bookDAO.findById(item.getId()).get());
								booksOfAccount.setAccount(session.getAttribute(Const.ACCOUNT));
								booksOfAccountDAO.save(booksOfAccount);
							}
						}
						String body = "Đơn hàng của bạn đã được thanh toán thành công. Cảm ơn bạn "+fullname+" đã tin tưởng và mua hàng của chúng tôi";
						mailService.queue(email, "[Bokonl] Xác nhận đơn hàng thành công", body);
						
						return "redirect:/cart/confirmation";
					}else {
						model.addAttribute("message","Vui lòng xác nhận với điều khoản");
					}
				}else {
					model.addAttribute("message","Vui lòng nhập đúng email");
				}
			}else {
				model.addAttribute("message","Vui lòng nhập đúng số điện thoại");
			}
		}else {
			model.addAttribute("message","Vui lòng nhập học tên");
		}
		return "checkout";
	}

	@GetMapping("/confirmation")
	public String getConfirmation(Model model) {
		List<Orders> order = ordersDAO.findByAccount(session.getAttribute(Const.ACCOUNT));
		model.addAttribute("order", order.get(order.size()-1));
		model.addAttribute(Const.ORDER_DETAILS, orderDetailDAO.findAllByOrder(order.get(order.size()-1)));
		return "confirmation";
	}

}
