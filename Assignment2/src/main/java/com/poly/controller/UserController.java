/**
 * 
 */
package com.poly.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.Const;
import com.poly.dao.AccountDAO;
import com.poly.dao.AdminDAO;
import com.poly.dao.BookDAO;
import com.poly.dao.BooksOfAccountDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.OrdersDAO;
import com.poly.entity.Account;
import com.poly.entity.Admin;
import com.poly.entity.Book;
import com.poly.entity.BooksOfAccount;
import com.poly.entity.Orders;
import com.poly.service.CookieService;
import com.poly.service.MailService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.service.UploadService;
import com.poly.service.impl.MailServiceImpl;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	SessionService sessionService;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	UploadService uploadService;
	@Autowired
	AdminDAO adminDAO;
	@Autowired
	ServletContext app;
	@Autowired
	MailService mailService;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	OrdersDAO ordersDAO;
	@Autowired
	BookDAO bookDAO; 
	@Autowired
	BooksOfAccountDAO booksOfAccountDAO;
	@Autowired
	private ServletContext servletContext;

	@GetMapping("/login")
	public String getLogin(Model model) {
		Account account = null;
		if (sessionService.getAttribute(Const.ACCOUNT) instanceof Account) {
			return "redirect:/home";
		}
		if (sessionService.getAttribute(Const.ACCOUNT) instanceof Admin) {
			return "redirect:/admin";
		}
		model.addAttribute("username", cookieService.getValue("username"));
		model.addAttribute("password", cookieService.getValue("password"));
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		if (!username.isBlank()) {
			if (!password.isBlank()) {
				boolean remember = paramService.getBoolean("remember", false);
				Account user = null;
				if (!accountDAO.findByEmail(username).isEmpty()) {
					user = accountDAO.findByEmail(username).get(0);
					if (!user.getPassword().equals(password)) {
						model.addAttribute("passwordError", "Sai mật khẩu!");
					} else {
						sessionService.setAttribute("username", username);
						if (remember) {
							cookieService.createCookie("username", username, 1);
							cookieService.createCookie("password", password, 1);
							model.addAttribute("username", cookieService.getValue("username"));
							model.addAttribute("password", cookieService.getValue("password"));
						} else {
							cookieService.removeCookie("username");
							cookieService.removeCookie("password");
						}
						sessionService.setAttribute(Const.ACCOUNT, user);
						String uri = (String) sessionService.getAttribute("securityUri");
						sessionService.removeAttribute(Const.SECURITY_URI);
						if (uri != null) {
							return "redirect:" + uri;
						} else {
							return "redirect:/home";
						}
					}
				}

				Admin admin = null;
				if (!adminDAO.findByUsername(username).isEmpty()) {
					admin = adminDAO.findByUsername(username).get(0);
					if (!admin.getPassword().equals(password)) {
						model.addAttribute("passwordError", "Sai mật khẩu!");
					} else {
						sessionService.setAttribute("username", username);
						if (remember) {
							cookieService.createCookie("username", username, 1);
							cookieService.createCookie("password", password, 1);
							model.addAttribute("username", cookieService.getValue("username"));
							model.addAttribute("password", cookieService.getValue("password"));
						} else {
							cookieService.removeCookie("username");
							cookieService.removeCookie("password");
						}
						sessionService.setAttribute(Const.ACCOUNT, admin);
						String uri = (String) sessionService.getAttribute("securityUri");
						if (uri != null) {
							return "redirect:" + uri;
						} else {
							return "redirect:/admin";
						}
					}
				}
				if (user == null && admin == null) {
					model.addAttribute("usernameError", "Tài khoản không tồn tại!");
				}
			} else {
				model.addAttribute("passwordError", "Vui lòng nhập mật khẩu!");
			}
		} else {
			model.addAttribute("usernameError", "Vui lòng nhập tài khoản!");
		}
		return "login";
	}

	@GetMapping("/registration")
	public String getRegistration(Model model, @ModelAttribute("account") Account account) {
		if (sessionService.getAttribute(Const.ACCOUNT) instanceof Account) {
			return "redirect:/home";
		}
		return "registration";
	}

	@PostMapping("/registration")
	public String posrRegistration(Model model, @Validated @ModelAttribute("account") Account account,
			BindingResult bindingResult, @RequestParam("passwordConfirmation") String passwordConfirmation) {
		if (account.getPassword().equals(passwordConfirmation)) {
			if (!accountDAO.findByEmail(account.getEmail()).isEmpty()) {
				model.addAttribute("message", "Tài khoản đã tồn tại");
			} else {
				if (bindingResult.hasErrors()) {
					model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
				} else {
					accountDAO.save(account);
					sessionService.setAttribute(Const.ACCOUNT, accountDAO.findByEmail(account.getEmail()).get(0));
					model.addAttribute("message", "Tạo tài khoản thành công!");
					return "forward:/user";
				}
			}
		} else {
			model.addAttribute("passwordConfirmationMessage", "Mật khẩu xác nhận không chính xác!");
		}
		return "registration";
	}

	@GetMapping("")
	public String getUserInfo() {
		return "personal-info";
	}

	@GetMapping("/my-bookshelf")
	public String getUserBookshelf(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable page = PageRequest.of(p.orElse(0), 6);
		model.addAttribute("page", booksOfAccountDAO.findByAccount(sessionService.getAttribute(Const.ACCOUNT), page));
		return "my-bookshelf";
	}

	@GetMapping("/my-bookshelf/my-product")
	public String getMyProduct(Model model, @RequestParam("id") Optional<Integer> id) {
		return "my-bookshelf";
	}

	@GetMapping("/my-bookshelf/ReadBook")
	public String getReadBook(Model model, HttpServletResponse response, @RequestParam("id") Integer id)
			throws IOException {		
		String pdfPath = bookDAO.findById(id).get().getPdfPath();
		model.addAttribute("pdfPath", pdfPath);
		return "readBook";

	}

	@GetMapping("/change-password")
	public String getChangePassword() { 
		return "change-password";
	}

	@PostMapping("/change-password")
	public String postChangePassword(Model model, @RequestParam("password") String password,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("passwordConfirmation") String passwordConfirmation) {
		Account acc = sessionService.getAttribute(Const.ACCOUNT);
		if (acc.getPassword().equals(password)) {
			if (newPassword.equals(passwordConfirmation)) {
				acc.setPassword(passwordConfirmation);
				accountDAO.save(acc);
				model.addAttribute("message", "Đổi mật khẩu thành công!");
			}
		} else {
			model.addAttribute("message", "Mật khẩu không đúng!");
		}
		return "change-password";
	}

	@GetMapping("/forgot-password")
	public String getForgotPassword() {
		if (sessionService.getAttribute(Const.ACCOUNT) instanceof Account) {
			return "redirect:/home";
		}
		if (sessionService.getAttribute(Const.ACCOUNT) instanceof Admin) {
			return "redirect:/admin";
		}
		return "forgot-password";
	}

	@PostMapping("/forgot-password")
	public String postForgotPassword(Model model, @RequestParam("email") String email) {
		Account account = accountDAO.findByEmail(email).get(0);
		if (account != null) {
			String body = "Mật khẩu của bạn là: " + account.getPassword()
					+ ". Vui lòng đăng nhập và đổi mật khẩu trong trường hợp bạn sẽ tiếp tục quên";
			mailService.queue(email, "[Bokonl] Lấy lại mật khẩu", body);
			model.addAttribute("message", "Mật khẩu của bạn đã được gửi đến mail, vui lòng đợi trong giây lát!");
		} else {
			model.addAttribute("message", "Email không tồn tại!");
		}
		return "forgot-password";
	}

	@GetMapping("/update-profile")
	public String getUpdateUser(Model model, @ModelAttribute("account") Account account) {
		return "personal-info-update";
	}

	@PostMapping("/update-profile")
	public String postUpdateUser(Model model, @RequestParam("fullname") String fullname,
			@RequestParam("picture") MultipartFile file, @RequestParam("passwordConfirm") String passwordConfirm) {
		Account acc = sessionService.getAttribute(Const.ACCOUNT);
		if (!file.isEmpty()) {
			uploadService.save(file, app.getRealPath("/views/images/avatar/"));
			String pictureName = StringUtils.cleanPath(file.getOriginalFilename());
			acc.setAvatar(pictureName);
		}
		if (fullname.isBlank()) {
			model.addAttribute("message", "Tên không được để trống:");
		} else {
			if (acc.getPassword().equals(passwordConfirm)) {
				accountDAO.save(acc);
				model.addAttribute("message", "Cập nhật thành công!");
			} else {
				model.addAttribute("message", "Mật khẩu không đúng!");
			}
		}
		return "personal-info-update";
	}

	@GetMapping("/logout")
	public String getLogout() {
		sessionService.removeAttribute(Const.ACCOUNT);
		return "login";
	}

	@GetMapping("/orders/order-detail")
	public String getOrderDetail(Model model, @RequestParam("id") Integer id) {
		Orders order = ordersDAO.findById(id).get();
		model.addAttribute(Const.ORDERS, order);
		model.addAttribute(Const.ORDER_DETAILS, orderDetailDAO.findAllByOrder(order));
		return "order-detail";
	}

	@GetMapping("/orders")
	public String getUserOrders(Model model) {
		List<Orders> orders = ordersDAO.findByAccount(sessionService.getAttribute(Const.ACCOUNT));
		model.addAttribute(Const.ORDERS, orders);
		return "my-orders";
	}
}
